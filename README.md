# COM3528_2025_Team4
# Integrating Action Recognition into MiRo Demo Mode for Mimicking Human-Dog Interaction.

## Contents:
This repository contains a modified version of the Miro client demo, where miro can detect certain gestures such as ‘knee slapping’ and ‘raised arms’ and perform actions corresponding to the gesture detected, for example approaching or running away from the person performing the action. This has been implemented by running Mediapipe (an open source skeleton pose tracking API by Google) locally from the Miro demo code. 

Link to Mediapipe docs:
https://ai.google.dev/edge/mediapipe/solutions/vision/gesture_recognizer/python

## Additions/modifications to the MDK and Client Demo:
The program repository contains the modified Miro MDK, with an additional file called `node_detect_gesture.py`, which contains and calls the Mediapipe API with Miro’s camera feed. The API has been modified to detect custom gestures. The output of the API (the detected gesture) is published by a publisher node as a string message type to the ‘gesture’ topic.
In action_types.py the ActionTemplate class’ constructor and been modified to include a ‘sub_gesture’ node, which subscribes to the ‘gesture topic’ and sets self.gesture to the detected gesture on the gesture topic. This is inherited by the different actions.
action_approach.py and action_flee.py check self.gesture in self.compute_priority and if it matches the gesture they are checking for, increases the priority.
The client_demo.py file has also been modified to initialize and run the mentioned nodes.

## Setup:
- The program is compatible with Python 3.8.10.
- The Mediapipe library is required for the program, which can be installed on the command line using ‘pip install mediapipe==0.10.15’

## How to Run:

Connect to miro

Terminal 1:
```
roscore
```

Terminal 2:
```
cd mdk/share/python/miro2/core
python3 client_demo.py
```

Terminal 3:
```
cd mdk/share/python/miro2/core
python3 client_demo.py - caml
```

Terminal 4:
```
cd mdk/share/python/miro2/core
python3 client_demo.py - camr
```
