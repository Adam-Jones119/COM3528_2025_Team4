#	ADDED BY TEAM4 AS PART OF MIRO'S DEMO MODE GESTURE EXTENSION
#   ADAPTED FROM node_detect_face.py

import numpy as np
import time
import os
import copy

import node
import miro2 as miro

import cv2



class NodeDetectGesture(node.Node):

	def __init__(self, sys):

		node.Node.__init__(self, sys, "detect_gesture")

		# clock state
		self.ticks = [0, 0]

	def tick_camera(self, stream_index, msg_obj):

		# get image (grayscale)
		img = self.state.frame_gry[stream_index]




		"""
		# store
		msg = miro.msg.object_face()
		msg.conf = conf
		msg.corner = corn_d
		msg.size = size_d
		msg_obj.faces.append(msg)
		"""

		# tick
		self.ticks[stream_index] += 1


		# ok
		return return_var



