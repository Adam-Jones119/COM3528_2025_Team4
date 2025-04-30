#	ADDED BY TEAM4 AS PART OF MIRO'S DEMO MODE GESTURE EXTENSION
#   ADAPTED FROM node_detect_face.py

import numpy as np
import time
import os
import copy
import rospy
import node
import miro2 as miro
import mp_test.msg
import cv2
from cv_bridge import CvBridge, CvBridgeError  # ROS -> OpenCV converter

import mediapipe as mp
from collections import deque, Counter
import numpy as np
import math


class NodeDetectGesture():

	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# MediaPipe functions

	mp_pose = mp.solutions.pose
	mp_drawing = mp.solutions.drawing_utils
	mp_hands = mp.solutions.hands 

	# History settings.
	palm_history_length = 12
	classification_history_length = 12


	left_palm_history = deque(maxlen=palm_history_length)
	right_palm_history = deque(maxlen=palm_history_length)


	classification_history = deque(maxlen=classification_history_length)


	def get_coord(landmark):
		"""Returns (x, y, z) coordinates from a landmark."""
		return landmark.x, landmark.y, landmark.z

	def calculate_angle(a, b, c):
		"""Calculates angle ABC (in degrees)"""
		try:
			# Calculate vectors BA and BC
			vec_ba = np.array([a.x - b.x, a.y - b.y, a.z - b.z])
			vec_bc = np.array([c.x - b.x, c.y - b.y, c.z - b.z])

			# Dot product
			dot_product = np.dot(vec_ba, vec_bc)

			# Magnitudes
			mag_ba = np.linalg.norm(vec_ba)
			mag_bc = np.linalg.norm(vec_bc)

			# Cosine of the angle
			if mag_ba == 0 or mag_bc == 0: return 0 # Avoid division by zero
			cosine_angle = dot_product / (mag_ba * mag_bc)

			# Ensure cosine value is within valid range [-1, 1] due to potential float errors
			cosine_angle = np.clip(cosine_angle, -1.0, 1.0)

			# Calculate angle in radians and convert to degrees
			angle = np.arccos(cosine_angle)
			return np.degrees(angle)
		except Exception as e:
			# print(f"Error calculating angle: {e}")
			return 0

	# --- NEW: Helper function to calculate 2D distance ---
	def calculate_distance(p1, p2):
		"""Calculates Euclidean distance between two points (using x, y)"""
		try:
			return math.sqrt((p1.x - p2.x)**2 + (p1.y - p2.y)**2)
		except Exception as e:
			# print(f"Error calculating distance: {e}")
			return float('inf')

	# --- NEW: Helper function for cumulative angle change around a center ---
	def calculate_cumulative_angle_change(points_history, center):
		"""Calculates the total angular change (in radians) of points around a center."""
		if len(points_history) < 3 or not center: return 0

		total_angle_change = 0
		prev_angle = None

		for point_coords in points_history:
			# Use palm center history which are (x,y,z) tuples
			dx = point_coords[0] - center.x
			dy = point_coords[1] - center.y

			# Calculate angle using atan2 (more robust than atan)
			current_angle = math.atan2(dy, dx)

			if prev_angle is not None:
				# Calculate difference, handling wrap-around (e.g., from +pi to -pi)
				delta_angle = current_angle - prev_angle
				if delta_angle > math.pi:
					delta_angle -= 2 * math.pi
				elif delta_angle < -math.pi:
					delta_angle += 2 * math.pi
				total_angle_change += delta_angle

			prev_angle = current_angle

		return abs(total_angle_change) # Return absolute total change

	# --- Palm Center Function (from Pose) ---
	def get_palm_center(landmarks, hand='left'):
		"""Compute approximate palm center using Pose landmarks."""
		try:
			if hand == 'left':
				indices = [mp_pose.PoseLandmark.LEFT_WRIST, mp_pose.PoseLandmark.LEFT_PINKY,
						mp_pose.PoseLandmark.LEFT_INDEX, mp_pose.PoseLandmark.LEFT_THUMB]
			else: 
				indices = [mp_pose.PoseLandmark.RIGHT_WRIST, mp_pose.PoseLandmark.RIGHT_PINKY,
						mp_pose.PoseLandmark.RIGHT_INDEX, mp_pose.PoseLandmark.RIGHT_THUMB]

			# Ensure landmarks indices are valid before accessing
			max_index = max(idx.value for idx in indices)
			if max_index >= len(landmarks):
				return None

			points = [landmarks[i.value] for i in indices]

			if not all(hasattr(lm, 'visibility') and lm.visibility > 0.5 for lm in points):
				return None # Not enough visible landmarks

			avg_x = sum(p.x for p in points) / len(points)
			avg_y = sum(p.y for p in points) / len(points)
			avg_z = sum(p.z for p in points) / len(points)
			return (avg_x, avg_y, avg_z)
		except (IndexError, KeyError, AttributeError):
			return None

	# --- Direction Changes Function ---
	def count_direction_changes(values, noise_threshold=0.015):
		"""Count direction changes, ignoring small noise."""
		if len(values) < 3: return 0
		changes = 0
		prev_sign = 0
		for i in range(len(values) - 1):
			diff = values[i+1] - values[i]
			if abs(diff) < noise_threshold: continue
			current_sign = 1 if diff > 0 else -1
			if prev_sign != 0 and current_sign != prev_sign:
				changes += 1
			if current_sign != 0:
				prev_sign = current_sign
		return changes

	# --- Arm Circling Detection Function ---
	def detect_arm_circle(palm_history, shoulder, elbow, wrist,
						straight_arm_angle_thresh=40,   
						downward_offset=0.01,            
						min_cumulative_angle=math.pi / 30, 
						max_dist_variation_ratio=0.70,   
						min_xy_movement_range=0.01):     
		"""
		Detects a circular motion with a relatively straight arm pointing somewhat downwards.
		MUCH MORE SENSITIVE version. Includes debug prints.
		"""
		DEBUG_CIRCLE = True 

		# --- Preliminary Checks ---
		if not all([shoulder, elbow, wrist]):
			# if DEBUG_CIRCLE: print("Debug Circle: Missing key landmarks (S/E/W).") 
			return False
		if not all(hasattr(lm, 'visibility') and lm.visibility > 0.4 for lm in [shoulder, elbow, wrist]): 
			# if DEBUG_CIRCLE: print("Debug Circle: Low visibility on key landmarks (S/E/W).")
			return False
		if len(palm_history) < palm_history_length // 2 : 
			# if DEBUG_CIRCLE: print(f"Debug Circle: Insufficient history ({len(palm_history)} < {palm_history_length // 2}).")
			return False
		try:
			if not all(isinstance(p, tuple) and len(p) == 3 for p in palm_history):
				# if DEBUG_CIRCLE: print("Debug Circle: Invalid data in palm history.")
				return False
		except Exception:
			# if DEBUG_CIRCLE: print("Debug Circle: Error checking palm history validity.")
			return False


		# --- Gesture Specific Checks ---
		try:
			# 1. Static: Arm Straightness
			elbow_angle = calculate_angle(shoulder, elbow, wrist)
			is_arm_straight = (elbow_angle >= straight_arm_angle_thresh)
			if DEBUG_CIRCLE and not is_arm_straight: print(f"Debug Circle: Arm angle {elbow_angle:.1f} < {straight_arm_angle_thresh} -> FAIL")


			# 2. Static: Arm Pointing Downwards?
			is_pointing_down = (wrist.y > shoulder.y + downward_offset)
			if DEBUG_CIRCLE and not is_pointing_down: print(f"Debug Circle: WristY {wrist.y:.3f} <= ShoulderY+Offset {shoulder.y + downward_offset:.3f} -> FAIL")


			# --- Dynamic Checks (Using Palm History) ---
			palm_coords = [(p[0], p[1]) for p in palm_history]

			# 3. Dynamic: Sufficient Movement Range?
			x_coords = [p[0] for p in palm_coords]
			y_coords = [p[1] for p in palm_coords]
			x_range = max(x_coords) - min(x_coords)
			y_range = max(y_coords) - min(y_coords)

			has_min_movement = (x_range >= min_xy_movement_range or y_range >= min_xy_movement_range)
			if DEBUG_CIRCLE and not has_min_movement: print(f"Debug Circle: Movement range X={x_range:.2f}, Y={y_range:.2f} too small (min={min_xy_movement_range}) -> FAIL")


			# 4. Dynamic: Distance Consistency (Circular Path) - Now much less strict
			distances = [math.sqrt((p[0] - shoulder.x)**2 + (p[1] - shoulder.y)**2) for p in palm_coords]
			if not distances: return False
			mean_dist = np.mean(distances)
			std_dev_dist = np.std(distances)
			if mean_dist == 0: return False
			dist_variation_ratio = std_dev_dist / mean_dist
			is_dist_consistent = (dist_variation_ratio <= max_dist_variation_ratio)
			if DEBUG_CIRCLE and not is_dist_consistent: print(f"Debug Circle: Dist variation ratio {dist_variation_ratio:.2f} > {max_dist_variation_ratio} -> FAIL")


			# 5. Dynamic: Sufficient Angular Change? 
			cumulative_angle = calculate_cumulative_angle_change(palm_history, shoulder)
			has_enough_angle = (cumulative_angle >= min_cumulative_angle)
			if DEBUG_CIRCLE and not has_enough_angle: print(f"Debug Circle: Cumulative angle {cumulative_angle:.2f} rad < {min_cumulative_angle:.2f} rad -> FAIL")


			# Combine results - ALL must still pass for detection
			final_result = is_arm_straight and is_pointing_down and has_min_movement and is_dist_consistent and has_enough_angle

			if DEBUG_CIRCLE and final_result: print("Debug Circle: ALL CHECKS PASSED -> DETECTED")
			elif DEBUG_CIRCLE: print("---") # Separator if it failed

			return final_result

		except (ValueError, IndexError, TypeError, AttributeError) as e:
			if DEBUG_CIRCLE: print(f"Error during detect_arm_circle checks: {e}")
			return False

	# --- Dynamic Gesture Detection Functions (Waving, Knee Smacking - from Pose) ---
	def detect_waving(palm_history, shoulder_y, threshold=0.08, min_direction_changes=2):
		"""Detect waving (horizontal oscillation) above the shoulder."""
		if len(palm_history) < palm_history_length: return False
		try:
			avg_palm_pos = np.mean(np.array(palm_history), axis=0)
			avg_palm_y = avg_palm_pos[1]
			if avg_palm_y >= shoulder_y: return False 
			x_values = [p[0] for p in palm_history]
			if max(x_values) - min(x_values) < threshold: return False
			changes = count_direction_changes(x_values)
			return changes >= min_direction_changes
		except (ValueError, IndexError): return False

	def detect_knee_smacking(palm_history, knee_x, knee_y, knee_z,
							proximity_x_thresh=0.18, proximity_y_thresh=0.18,
							y_threshold=0.08, z_threshold=0.08, min_direction_changes=2):
		"""Detect knee smacking (oscillation near knee)."""
		if len(palm_history) < palm_history_length: return False
		try:
			avg_palm_pos = np.mean(np.array(palm_history), axis=0)
			avg_palm_x, avg_palm_y = avg_palm_pos[0], avg_palm_pos[1]
			if abs(avg_palm_x - knee_x) > proximity_x_thresh or \
			abs(avg_palm_y - knee_y) > proximity_y_thresh: return False 
			y_values = [p[1] for p in palm_history]; z_values = [p[2] for p in palm_history]
			y_range = max(y_values) - min(y_values); y_changes = count_direction_changes(y_values)
			z_range = max(z_values) - min(z_values); z_changes = count_direction_changes(z_values)
			if (y_range >= y_threshold and y_changes >= min_direction_changes) or \
			(z_range >= z_threshold and z_changes >= min_direction_changes): return True
			return False
		except (ValueError, IndexError): return False


	def is_pointing_down(hand_landmarks):
		"""
		Checks if the index finger is pointing down and other fingers are curled.
		Uses MediaPipe Hand landmarks. More sensitive version.
		"""
		try:
			
			idx_tip = hand_landmarks.landmark[mp_hands.HandLandmark.INDEX_FINGER_TIP]
			idx_mcp = hand_landmarks.landmark[mp_hands.HandLandmark.INDEX_FINGER_MCP]
			idx_pip = hand_landmarks.landmark[mp_hands.HandLandmark.INDEX_FINGER_PIP] 

			
			mid_tip = hand_landmarks.landmark[mp_hands.HandLandmark.MIDDLE_FINGER_TIP]
			rng_tip = hand_landmarks.landmark[mp_hands.HandLandmark.RING_FINGER_TIP]
			pnk_tip = hand_landmarks.landmark[mp_hands.HandLandmark.PINKY_TIP]
			mid_pip = hand_landmarks.landmark[mp_hands.HandLandmark.MIDDLE_FINGER_PIP]


			# 1. Check if Index finger is pointing downwards
			#    (Tip Y coordinate greater than MCP Y coordinate - smaller threshold)
			is_idx_down = (idx_tip.y > idx_mcp.y + 0.025) 

			# 2. Check if Index finger is relatively straight
			#    (PIP joint Y is also below MCP Y, or close to it)
			is_idx_straight = (idx_pip.y > idx_mcp.y + 0.01) 

			# 3. Check if other fingers are curled
			#    (Their tips are roughly above their own PIP joints or index PIP)
			#    Let's use the middle finger's PIP as a reference point
			#    (Smaller Y means higher up)
			curl_ref_y = mid_pip.y - 0.02
			are_others_curled = (mid_tip.y < curl_ref_y and
								rng_tip.y < curl_ref_y and
								pnk_tip.y < curl_ref_y)

			return is_idx_down and is_idx_straight and are_others_curled

		except (IndexError, AttributeError, TypeError):
			
			return False


	def classify_pose(pose_landmarks, left_palm_hist, right_palm_hist, left_pointing, right_pointing):
		"""
		Classify pose: "Sit" (Pointing) > "Spin Around" (Arm Circle) > Waving > Knee Smacking > Hands Up.
		Labels are NOT swapped for mirroring.
		"""
		classification = "No Pose"

		try:
			# --- HIGHEST PRIORITY: Pointing Down ("Sit") ---
			if left_pointing or right_pointing:
				return "Sit"

			# --- Check Pose Landmarks Exist for other gestures ---
			if pose_landmarks and len(pose_landmarks) > mp_pose.PoseLandmark.RIGHT_WRIST.value: # Basic check

				# Define landmark indices
				l_shoulder_idx = mp_pose.PoseLandmark.LEFT_SHOULDER.value
				r_shoulder_idx = mp_pose.PoseLandmark.RIGHT_SHOULDER.value
				l_elbow_idx = mp_pose.PoseLandmark.LEFT_ELBOW.value
				r_elbow_idx = mp_pose.PoseLandmark.RIGHT_ELBOW.value
				l_wrist_idx = mp_pose.PoseLandmark.LEFT_WRIST.value
				r_wrist_idx = mp_pose.PoseLandmark.RIGHT_WRIST.value
				l_knee_idx = mp_pose.PoseLandmark.LEFT_KNEE.value
				r_knee_idx = mp_pose.PoseLandmark.RIGHT_KNEE.value

				# Get landmarks safely
				l_shoulder = pose_landmarks[l_shoulder_idx]
				r_shoulder = pose_landmarks[r_shoulder_idx]
				l_elbow = pose_landmarks[l_elbow_idx]
				r_elbow = pose_landmarks[r_elbow_idx]
				l_wrist = pose_landmarks[l_wrist_idx]
				r_wrist = pose_landmarks[r_wrist_idx]
				l_knee = pose_landmarks[l_knee_idx]
				r_knee = pose_landmarks[r_knee_idx]


				left_arm_circle = False
				if all(lm.visibility > 0.5 for lm in [l_shoulder, l_elbow, l_wrist]) and left_palm_hist:
					left_arm_circle = detect_arm_circle(left_palm_hist, l_shoulder, l_elbow, l_wrist)
				right_arm_circle = False
				if all(lm.visibility > 0.5 for lm in [r_shoulder, r_elbow, r_wrist]) and right_palm_hist:
					right_arm_circle = detect_arm_circle(right_palm_hist, r_shoulder, r_elbow, r_wrist)

				if left_arm_circle or right_arm_circle:
					return "Spin Around" 


				# --- Waving Check ---
				left_waving = False
				if l_shoulder.visibility > 0.5 and left_palm_hist:
					left_waving = detect_waving(left_palm_hist, l_shoulder.y)
				right_waving = False
				if r_shoulder.visibility > 0.5 and right_palm_hist:
					right_waving = detect_waving(right_palm_hist, r_shoulder.y)

				if left_waving and right_waving: return "Waving Both Hands"
				elif left_waving: return "Waving Left Hand"
				elif right_waving: return "Waving Right Hand"

				# --- Knee Smacking Check ---
				left_knee_smack = False
				if l_knee.visibility > 0.5 and left_palm_hist:
					left_knee_smack = detect_knee_smacking(left_palm_hist, l_knee.x, l_knee.y, l_knee.z)
				right_knee_smack = False
				if r_knee.visibility > 0.5 and right_palm_hist:
					right_knee_smack = detect_knee_smacking(right_palm_hist, r_knee.x, r_knee.y, r_knee.z)

				if left_knee_smack or right_knee_smack: return "Knee Smacking"

				# --- Static Hands Up Check ---
				left_hand_up = (l_wrist.visibility > 0.5 and l_shoulder.visibility > 0.5 and
								l_wrist.y < l_shoulder.y)
				right_hand_up = (r_wrist.visibility > 0.5 and r_shoulder.visibility > 0.5 and
								r_wrist.y < r_shoulder.y)

				if left_hand_up and right_hand_up: return "Hands Up"
				elif left_hand_up: return "Left Hand Raised"
				elif right_hand_up: return "Right Hand Raised"

			return classification

		except (IndexError, KeyError, TypeError, AttributeError) as e:
			# print(f"Error during classification: {e}")
			return "Error Processing"



	def get_final_classification(history, waving_threshold=6, knee_smacking_threshold=6, pointing_threshold=4, spin_threshold=5): # Added spin_threshold
		"""Determine final classification. Priority: Sit > Spin > Waving > Knee Smacking."""
		if not history: return "No Pose Detected"
		counts = Counter(history)

		# Priority Order:
		if counts["Sit"] >= pointing_threshold: return "Sit"
		if counts["Spin Around"] >= spin_threshold: return "Spin Around" # ADDED SPIN CHECK
		if counts["Waving Both Hands"] >= waving_threshold: return "Waving Both Hands"
		if counts["Waving Left Hand"] >= waving_threshold: return "Waving Left Hand"
		if counts["Waving Right Hand"] >= waving_threshold: return "Waving Right Hand"
		if counts["Knee Smacking"] >= knee_smacking_threshold: return "Knee Smacking"

		# Fallback to most common static pose
		filtered_counts = Counter({k: v for k, v in counts.items() if k not in ["No Pose Detected", "Error Processing", "No Pose", "Spin Around"]}) # Add Spin to filter
		if filtered_counts: return filtered_counts.most_common(1)[0][0]
		elif counts: return counts.most_common(1)[0][0]
		else: return "No Pose Detected"



	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# Process video feed

	def process_img(image_bgr):
		with mp_pose.Pose(min_detection_confidence=0.5, min_tracking_confidence=0.75) as pose, \
		mp_hands.Hands(max_num_hands=2, min_detection_confidence=0.6, min_tracking_confidence=0.75) as hands: 
			
			image_rgb = cv2.cvtColor(image_bgr, cv2.COLOR_BGR2RGB)
			image_rgb.flags.writeable = False 

			results_pose = pose.process(image_rgb)
			results_hands = hands.process(image_rgb)


			current_pose_landmarks = None
			if results_pose.pose_landmarks:
				current_pose_landmarks = results_pose.pose_landmarks.landmark
				left_palm = get_palm_center(current_pose_landmarks, 'left')
				right_palm = get_palm_center(current_pose_landmarks, 'right')
				if left_palm: left_palm_history.append(left_palm)
				if right_palm: right_palm_history.append(right_palm)

				mp_drawing.draw_landmarks(
					image_bgr, results_pose.pose_landmarks, mp_pose.POSE_CONNECTIONS,
					landmark_drawing_spec=mp_drawing.DrawingSpec(color=(245, 117, 66), thickness=2, circle_radius=2),
					connection_drawing_spec=mp_drawing.DrawingSpec(color=(245, 66, 230), thickness=2, circle_radius=2))
			else:

				left_palm_history.clear()
				right_palm_history.clear()


			left_hand_pointing = False
			right_hand_pointing = False
			if results_hands.multi_hand_landmarks:
				for hand_idx, hand_landmarks in enumerate(results_hands.multi_hand_landmarks):

					handedness = results_hands.multi_handedness[hand_idx].classification[0].label
					is_pointing = is_pointing_down(hand_landmarks)

					if handedness == "Left":
						left_hand_pointing = is_pointing
					elif handedness == "Right":
						right_hand_pointing = is_pointing

					mp_drawing.draw_landmarks(
						image_bgr, hand_landmarks, mp_hands.HAND_CONNECTIONS,
						landmark_drawing_spec=mp_drawing.DrawingSpec(color=(121, 22, 76), thickness=2, circle_radius=3), # Purpleish
						connection_drawing_spec=mp_drawing.DrawingSpec(color=(121, 44, 250), thickness=2, circle_radius=2)) # Light Purpleish

			current_classification = classify_pose(
				current_pose_landmarks, 
				left_palm_history,
				right_palm_history,
				left_hand_pointing, 
				right_hand_pointing 
			)


			classification_history.append(current_classification)
			final_classification = get_final_classification(classification_history)


			final_image = cv2.flip(image_bgr, 1)
			cv2.putText(final_image, f"Pose: {final_classification}", (10, 40),
						cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2, cv2.LINE_AA)
			cv2.imshow('Pose and Hand Recognition', final_image)

			if cv2.waitKey(5) & 0xFF == 27:
				break
			

			return final_classification
	

	# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	# ROS interface

	def __init__(self):
	
		node.Node.__init__(self, sys, "detect_gesture")
		self.pub_gesture = self.publisher("gesture_topic", mp_test.msg.gesture)

		# clock state
		self.ticks = [0, 0]

	def tick_camera(self):
		msg = mp_test.msg.gesture()

		# get image (BGR)
		img_bgr = self.state.frame_bgr[stream_index]

		# publish and tick clock
		msg.gesture = process_img(img_bgr)
		self.ticks[stream_index] += 1
		rospy.loginfo(f"[gesture_publisher]: {msg}")
		self.pub_gesture.publish(msg)