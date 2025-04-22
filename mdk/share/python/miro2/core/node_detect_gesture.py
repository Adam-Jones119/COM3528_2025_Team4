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


class NodeDetectGesture():

	def __init__(self):
          
		node.Node.__init__(self, sys, "detect_gesture")
		self.pub_gesture = self.publisher("gesture_topic", mp_test.msg.gesture)

		# clock state
		self.ticks = [0, 0]

	def tick_camera(self):
		gesture_classification = "test"
		msg = mp_test.msg.gesture()

		# get image (BGR)
		img_bgr = self.state.frame_bgr[stream_index]

		# publish and tick clock
		msg.gesture = gesture_classification
		self.ticks[stream_index] += 1
		rospy.loginfo(f"[gesture_publisher]: {msg}")
		self.pub_gesture.publish(msg)
