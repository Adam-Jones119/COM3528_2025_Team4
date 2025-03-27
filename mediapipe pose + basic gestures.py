import cv2
import mediapipe as mp
from collections import deque, Counter
import numpy as np



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
    Classify pose: Pointing Down ("Sit") has highest priority.
    Then Waving, Knee Smacking, Hands Up.
    Labels adjusted for mirrored display.
    """
    
    classification = "No Pose"

    try:
        if left_pointing or right_pointing:
             return "Sit" 


        if pose_landmarks:
            l_shoulder = pose_landmarks[mp_pose.PoseLandmark.LEFT_SHOULDER.value]
            r_shoulder = pose_landmarks[mp_pose.PoseLandmark.RIGHT_SHOULDER.value]
            l_knee = pose_landmarks[mp_pose.PoseLandmark.LEFT_KNEE.value]
            r_knee = pose_landmarks[mp_pose.PoseLandmark.RIGHT_KNEE.value]


            left_waving = False
            if l_shoulder.visibility > 0.5 and left_palm_hist:
                left_waving = detect_waving(left_palm_hist, l_shoulder.y)
            right_waving = False
            if r_shoulder.visibility > 0.5 and right_palm_hist:
                 right_waving = detect_waving(right_palm_hist, r_shoulder.y)

            if left_waving and right_waving: return "Waving Both Hands"
            elif left_waving: return "Waving Left Hand"  
            elif right_waving: return "Waving Right Hand"   


            left_knee_smack = False
            if l_knee.visibility > 0.5 and left_palm_hist:
                 left_knee_smack = detect_knee_smacking(left_palm_hist, l_knee.x, l_knee.y, l_knee.z)
            right_knee_smack = False
            if r_knee.visibility > 0.5 and right_palm_hist:
                 right_knee_smack = detect_knee_smacking(right_palm_hist, r_knee.x, r_knee.y, r_knee.z)

            if left_knee_smack or right_knee_smack: return "Knee Smacking"


        if pose_landmarks:
            l_wrist_idx = mp_pose.PoseLandmark.LEFT_WRIST.value
            r_wrist_idx = mp_pose.PoseLandmark.RIGHT_WRIST.value
            l_shoulder_idx = mp_pose.PoseLandmark.LEFT_SHOULDER.value
            r_shoulder_idx = mp_pose.PoseLandmark.RIGHT_SHOULDER.value

            if all(idx < len(pose_landmarks) for idx in [l_wrist_idx, r_wrist_idx, l_shoulder_idx, r_shoulder_idx]):
                l_wrist = pose_landmarks[l_wrist_idx]
                r_wrist = pose_landmarks[r_wrist_idx]
                l_shoulder = pose_landmarks[l_shoulder_idx]
                r_shoulder = pose_landmarks[r_shoulder_idx]

                left_hand_up = l_wrist.visibility > 0.5 and l_shoulder.visibility > 0.5 and l_wrist.y < l_shoulder.y
                right_hand_up = r_wrist.visibility > 0.5 and r_shoulder.visibility > 0.5 and r_wrist.y < r_shoulder.y

                if left_hand_up and right_hand_up: return "Hands Up"
                elif left_hand_up: return "Left Hand Raised" 
                elif right_hand_up: return "Right Hand Raised"  


        return classification 

    except (IndexError, KeyError, TypeError, AttributeError) as e:
         return "Error Processing"



def get_final_classification(history, waving_threshold=6, knee_smacking_threshold=6, pointing_threshold=4): # Lowered pointing threshold
    """Determine final classification. "Sit" has highest priority."""
    if not history: return "No Pose Detected"
    counts = Counter(history)


    if counts["Sit"] >= pointing_threshold: return "Sit" 

    if counts["Waving Both Hands"] >= waving_threshold: return "Waving Both Hands"
    if counts["Waving Left Hand"] >= waving_threshold: return "Waving Left Hand"   
    if counts["Waving Right Hand"] >= waving_threshold: return "Waving Right Hand"  
    if counts["Knee Smacking"] >= knee_smacking_threshold: return "Knee Smacking"

    filtered_counts = Counter({k: v for k, v in counts.items() if k not in ["No Pose Detected", "Error Processing", "No Pose"]})
    if filtered_counts: return filtered_counts.most_common(1)[0][0]
    elif counts: return counts.most_common(1)[0][0] 
    else: return "No Pose Detected"


cap = cv2.VideoCapture(0)

desired_width = 1920
desired_height = 1080
cap.set(cv2.CAP_PROP_FRAME_WIDTH, desired_width)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, desired_height)

actual_width = cap.get(cv2.CAP_PROP_FRAME_WIDTH)
actual_height = cap.get(cv2.CAP_PROP_FRAME_HEIGHT)
print(f"Attempting to set resolution to {desired_width}x{desired_height}")
print(f"Actual camera resolution: {int(actual_width)}x{int(actual_height)}")


with mp_pose.Pose(min_detection_confidence=0.5, min_tracking_confidence=0.75) as pose, \
     mp_hands.Hands(max_num_hands=2, min_detection_confidence=0.6, min_tracking_confidence=0.75) as hands: 
    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            print("Failed to grab frame. Exiting...")
            break


        image_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        image_rgb.flags.writeable = False 


        results_pose = pose.process(image_rgb)


        results_hands = hands.process(image_rgb)


        image_bgr = cv2.cvtColor(image_rgb, cv2.COLOR_RGB2BGR)
        image_bgr.flags.writeable = True


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

cap.release()
cv2.destroyAllWindows()