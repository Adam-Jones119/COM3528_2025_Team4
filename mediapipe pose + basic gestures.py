import cv2
import mediapipe as mp

# Initialize MediaPipe Pose and Drawing utilities
mp_pose = mp.solutions.pose
mp_drawing = mp.solutions.drawing_utils

def classify_pose(landmarks):
    """
    Classify the pose based on key landmark positions.

    Landmarks used:
    - Left Shoulder (11) & Right Shoulder (12)
    - Left Wrist (15) & Right Wrist (16)
    - Left Knee (23) & Right Knee (24) -- note: MediaPipe uses different indices in some docs,
      but here we use the enumerated names from mp_pose.PoseLandmark.
    """
    # Get relevant landmarks
    left_shoulder = landmarks[mp_pose.PoseLandmark.LEFT_SHOULDER.value]
    right_shoulder = landmarks[mp_pose.PoseLandmark.RIGHT_SHOULDER.value]
    left_wrist = landmarks[mp_pose.PoseLandmark.LEFT_WRIST.value]
    right_wrist = landmarks[mp_pose.PoseLandmark.RIGHT_WRIST.value]
    left_knee = landmarks[mp_pose.PoseLandmark.LEFT_KNEE.value]
    right_knee = landmarks[mp_pose.PoseLandmark.RIGHT_KNEE.value]
    
    # Define threshold for "closeness" in normalized coordinates.
    y_threshold = 0.15  
    x_threshold = 0.15  

    # Check for "Hands on Knees":
    # Both wrists should be very near the corresponding knees in both x and y dimensions.
    if (abs(left_wrist.y - left_knee.y) < y_threshold and abs(left_wrist.x - left_knee.x) < x_threshold and
        abs(right_wrist.y - right_knee.y) < y_threshold and abs(right_wrist.x - right_knee.x) < x_threshold):
        return "Hands on Knees"
    # Check if both wrists are above shoulders
    elif left_wrist.y < left_shoulder.y and right_wrist.y < right_shoulder.y:
        return "Hands Up"
    # Check if only left wrist is above the left shoulder
    elif left_wrist.y < left_shoulder.y:
        return "Left Hand Raised"
    # Check if only right wrist is above the right shoulder
    elif right_wrist.y < right_shoulder.y:
        return "Right Hand Raised"
    else:
        return "Arms Down"

# Open a connection to the default camera
cap = cv2.VideoCapture(0)

# Configure the Pose function with desired confidence values
with mp_pose.Pose(min_detection_confidence=0.5, min_tracking_confidence=0.5) as pose:
    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            print("Failed to grab frame. Exiting...")
            break

        # Convert the image from BGR to RGB
        image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        image.flags.writeable = False  # Optimize performance

        # Process the image and detect pose landmarks
        results = pose.process(image)

        # Convert the image back to BGR for rendering
        image.flags.writeable = True
        image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)

        # Default classification
        pose_class = "No Pose Detected"

        # If landmarks are detected, draw them and classify the pose
        if results.pose_landmarks:
            mp_drawing.draw_landmarks(
                image,
                results.pose_landmarks,
                mp_pose.POSE_CONNECTIONS,
                landmark_drawing_spec=mp_drawing.DrawingSpec(color=(0, 255, 0), thickness=2, circle_radius=2),
                connection_drawing_spec=mp_drawing.DrawingSpec(color=(0, 0, 255), thickness=2, circle_radius=2)
            )
            pose_class = classify_pose(results.pose_landmarks.landmark)
        
        # Overlay the classification text on the image
        cv2.putText(image, f"Pose: {pose_class}", (10, 30),
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)

        # Display the final output
        cv2.imshow('Pose Recognition', image)

        # Exit when the ESC key is pressed
        if cv2.waitKey(5) & 0xFF == 27:
            break

# Clean up
cap.release()
cv2.destroyAllWindows()
