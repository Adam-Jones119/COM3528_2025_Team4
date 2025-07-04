#	@section COPYRIGHT
#	Copyright (C) 2023 Consequential Robotics Ltd
#	
#	@section AUTHOR
#	Consequential Robotics http://consequentialrobotics.com
#	
#	@section LICENSE
#	For a full copy of the license agreement, and a complete
#	definition of "The Software", see LICENSE in the MDK root
#	directory.
#	
#	Subject to the terms of this Agreement, Consequential
#	Robotics grants to you a limited, non-exclusive, non-
#	transferable license, without right to sub-license, to use
#	"The Software" in accordance with this Agreement and any
#	other written agreement with Consequential Robotics.
#	Consequential Robotics does not transfer the title of "The
#	Software" to you; the license granted to you is not a sale.
#	This agreement is a binding legal agreement between
#	Consequential Robotics and the purchasers or users of "The
#	Software".
#	
#	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
#	KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
#	WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
#	PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
#	OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
#	OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
#	OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
#	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#	

import numpy as np
import time
import copy

import node
import miro2 as miro

from action.basal_ganglia import BasalGanglia
from action.action_types import ActionInput
from action.action_approach import ActionApproach
from action.action_halt import ActionHalt
from action.action_mull import ActionMull
from action.action_orient import ActionOrient
from action.action_flee import ActionFlee
from action.action_avert import ActionAvert
from action.action_retreat import ActionRetreat
from action.action_special import ActionSpecial

from std_msgs.msg import MultiArrayDimension



class NodeAction(node.Node):

	def __init__(self, sys):

		node.Node.__init__(self, sys, "action")

		# action selection (basal ganglia model)
		self.selector = BasalGanglia(self.state, self.pars)

		# input/output objects
		self.action_input = ActionInput()

		# create actions
		self.actions = [
				ActionMull(self),
				ActionOrient(self),
				ActionApproach(self),
				ActionFlee(self),
				ActionAvert(self),
				ActionHalt(self),
				ActionRetreat(self),
				ActionSpecial(self)
				]

		# state
		self.count = 0
		self.push = []
		self.retreatable_push = None
		self.debug_tick = 0
		self.avert_count = 0
		self.cliff_sensor_fail_detect_count = 0

		# output
		nchan = len(self.actions)
		self.output.sel_prio.layout.dim = [MultiArrayDimension()]
		self.output.sel_prio.layout.dim[0].label = "channel"
		self.output.sel_prio.layout.dim[0].size = nchan
		self.output.sel_prio.layout.dim[0].stride = 1
		self.output.sel_inhib.layout.dim = [MultiArrayDimension()]
		self.output.sel_inhib.layout.dim[0].label = "channel"
		self.output.sel_inhib.layout.dim[0].size = nchan
		self.output.sel_inhib.layout.dim[0].stride = 1

	def apply_push(self, push, retreatable):

		# store
		self.push.append(push)
		if retreatable:
			self.retreatable_push = push

	def modulate_by_sonar(self):

		# default
		self.action_input.conf_space = 1.0

		# if not flagged off
		if self.pars.flags.ACTION_MODULATE_BY_SONAR:

			# get sonar reading
			range = self.input.sensors_package.sonar.range

			# get sonar range
			range_min = self.pars.body.sonar_min_range
			range_max = self.pars.body.sonar_max_range

			# get normalised range
			range -= range_min
			range_max -= range_min
			range = range / range_max

			# constrain
			if range < 0.0:
				range = 0.0
			if range > 1.0:
				range = 1.0

			# readings come and go, so preserve them using a filter
			self.action_input.conf_space *= 0.95
			range *= 0.05
			self.action_input.conf_space += range

			# debug
			if self.pars.flags.DEBUG_SONAR:
				# play tone to indicate range to target
				if self.action_input.conf_space < 0.95:
					ping_period = int(5.0 + self.action_input.conf_space * 20.0)
					if self.state.tick >= (self.debug_tick + ping_period):
						self.debug_tick = self.state.tick
						self.output.tone = int((1.0 - self.action_input.conf_space) * 250.0)

	def modulate_by_cliff(self):

		# default
		self.action_input.conf_surf = 1.0

		# if not flagged off
		if self.pars.flags.ACTION_MODULATE_BY_CLIFF:

			# if cliff sensors are valid
			if not self.pars.dev.IGNORE_CLIFF_SENSORS:

				# get current
				cliff_reading = self.action_input.cliff

				# get min/max
				cliff_min = np.clip(self.pars.action.cliff_thresh - self.pars.action.cliff_margin, 0, 15)
				cliff_max = np.clip(self.pars.action.cliff_thresh + self.pars.action.cliff_margin, 0, 15)
				cliff_range = cliff_max - cliff_min

				# dev
				if self.pars.dev.SIMULATE_CLIFF:
					cliff_reading[0] = 0.0
					cliff_reading[1] = 0.0
					if (self.state.tick % 50) == 0:
						print ("DEV_SIMULATE_CLIFF")

				# aka "shun cliffs"
				cliff = np.min(cliff_reading)
				cliff = (cliff * 15.0).astype(np.uint16)
				cliff -= cliff_min
				cliff = np.float(np.clip(cliff, 0, cliff_range))

				# confidence in a surface ahead of us
				conf = 0.0
				if cliff_range > 0:
					conf = cliff / cliff_range
				else:
					if cliff >= 0.0:
						conf = 1.0

				# store
				self.action_input.conf_surf = conf

	def compute_gaze_elevation(self):
		'''
			Compute gaze elevation
			- modulated by wakefulness
		'''
		# gaze elevation - reduced as we near sleep -- get wakefulness
		w = self.action_input.sleep.wakefulness
		awake = miro.constants.CAM_ELEVATION
		asleep = awake * 0.5
		self.action_input.gaze_elevation = asleep + w * (awake - asleep)

	def compute_dgaze(self):
		'''
			Computes change in gaze to new priority peak
		'''
		# Compute distance of that from gaze direction
		dazim = self.action_input.priority_peak.azim
		delev = self.action_input.priority_peak.elev - self.action_input.gaze_elevation
		self.action_input.dgaze = np.sqrt(dazim * dazim + delev * delev)

	def compute_gaze_fixation(self):
		'''
			Compute fixation
			- fixation is a measure of similarity between successive priority peaks
			  a high fixation implies a stationary stimuli in the saliency map
		'''
		# Fixation is highest when dgaze is smallest
		fixation = 1.0 - self.action_input.dgaze * self.pars.action.fixation_width_recip
		self.action_input.fixation = np.clip(fixation, 0.0, 1.0)

	def process_input(self):

		# flagged off
		if self.pars.flags.ACTION_ENABLE_INPUT:

			# get msg
			msg = self.input.sensors_package

			# store
			self.action_input.user_touch = self.state.user_touch
			self.action_input.sonar_range = msg.sonar.range
			self.action_input.cliff = np.array(msg.cliff.data)
			self.action_input.priority_peak = self.state.priority_peak
			self.action_input.emotion = copy.copy(self.output.animal_state.emotion)
			self.action_input.sleep = copy.copy(self.output.animal_state.sleep)
			self.action_input.wheel_speed_opto = self.input.sensors_package.wheel_speed_opto.data
			self.action_input.wheel_speed_back_emf = self.input.sensors_package.wheel_speed_back_emf.data
			self.action_input.wheel_effort_pwm = self.input.sensors_package.wheel_effort_pwm.data
			self.action_input.wheel_speed_cmd = self.input.sensors_package.wheel_speed_cmd.data
			self.action_input.stream = self.input.stream

		# compute transformed input data
		self.compute_gaze_elevation()
		self.compute_dgaze()
		self.compute_gaze_fixation()

		# do modulations
		self.modulate_by_sonar()
		self.modulate_by_cliff()

	def limit_accel(self, action):

		''' Limit acceleration of push '''
		# TODO: import limit acceleration imp from MIRO1, which is improved

		# acceleration
		steps_from_start = action.clock.steps_so_far
		max_speed1 = (self.pars.body.max_accel_mmpsps
						* self.pars.timing.tick_sec
						* float(steps_from_start))

		# decceleration
		steps_from_end = action.clock.steps_total - steps_from_start
		max_speed2 = (self.pars.body.max_decel_mmpsps
						* self.pars.timing.tick_sec
						* float(steps_from_end))

		max_speed = min(max_speed1, max_speed2) / 1000.0

		# constrain pushvec by max speed
		max_pushlen = max_speed / self.pars.timing.tick_hz
		pushlen = np.modulus(action.output.push.vec)

		if pushlen > max_pushlen:
			scale = max_pushlen / pushlen
			action.output.push.vec *= scale

	def start_test_action(self, action_name):

		action_name = "approach"
		start_at = 100

		if self.count == start_at:

			print ("start test action", action_name)

			if action_name == "orient":
				self.action_input.priority_peak.height = 1
				self.action_input.priority_peak.size = 0.005
				self.action_input.priority_peak.azim = 0.5
				self.action_input.priority_peak.elev = 0.78539816339
				self.action_input.priority_peak.size_norm = 0.5
				self.action_input.priority_peak.range = 0.5

			if action_name == "approach":
				self.action_input.priority_peak.height = 1
				self.action_input.priority_peak.size = 0.005
				self.action_input.priority_peak.azim = 1.57
				self.action_input.priority_peak.elev = 0.0
				self.action_input.priority_peak.size_norm = 0.5
				self.action_input.priority_peak.range = 1.0

			if action_name == "flee":
				self.action_input.priority_peak.height = 1
				self.action_input.priority_peak.size = 0.005
				self.action_input.priority_peak.azim = 0.5
				self.action_input.priority_peak.elev = 0.0
				self.action_input.priority_peak.size_norm = 0.5
				self.action_input.priority_peak.range = 1.0

			if action_name == "retreat":
				push = kc.KinematicPush()
				push.link = miro.constants.LINK_HEAD
				push.flags = 0
				push.pos = miro.lib.get("LOC_SONAR_FOVEA_HEAD")
				push.vec = np.array([1.0, 0.5, 0.0])
				self.retreatable_push = push

			for action in self.actions:
				if action.name == action_name:
					action.interface.priority = 1.0
					return

		else:

			self.action_input.priority_peak.height = 0

			if self.count > start_at and self.selector.selected == 0:
				self.state.keep_running = False

	def cliff_sensor_fail_detect(self, action_starting):

		if action_starting.name == "avert":
			# count one
			self.avert_count += 1
		elif action_starting.name == "mull":
			# ignore interposed mulls
			pass
		else:
			# count reset
			self.avert_count = 0

		# if avert is selected multiple times in a row without anything
		# interposed other than mull, it's almost guaranteed that the
		# cliff sensors are playing up. play a sound to indicate this.
		if self.avert_count >= 3:
			self.cliff_sensor_fail_detect_count = 15

	def tick(self):

		# cannot usefully proceed without this
		if self.state.priority_peak is None:
			return

		# do cliff sensor fail warning sound
		if self.cliff_sensor_fail_detect_count > 0:
			self.cliff_sensor_fail_detect_count -= 1
			if (self.cliff_sensor_fail_detect_count % 5) < 2:
				self.output.tone = 120

		# fill in action input
		self.process_input()

		# debug
		if self.pars.dev.DEBUG_ORIENTS:
			if self.state.tick >= 100 and self.state.tick <= 120:
				pass
			elif self.state.tick >= 240 and self.state.tick <= 260:
				pass
			else:
				self.action_input.priority_peak.height = 0.0

		# for each action
		for action in self.actions:

			# run ascending branch
			action.ascending()

			# module by wakefulness
			if action.modulate_by_wakefulness:
				action.interface.priority *= self.action_input.sleep.wakefulness

			# handle ENABLE_MOVE_AWAY
			if not self.pars.flags.ACTION_ENABLE_MOVE_AWAY:
				if action.move_away:
					action.interface.priority = 0.0

			# handle ORIENT_ONLY
			if self.pars.dev.ORIENT_ONLY and action.name != "orient":
				action.interface.priority = 0.0

			# handle MULL_ONLY
				action.interface.priority = 0.0

			# handle NO_FLEE
			if self.pars.dev.NO_FLEE and action.name == "flee":
				action.interface.priority = 0.0

			# handle dev focus action
			if self.pars.dev.focus_action:
				if action.name != "mull" and action.name != self.pars.dev.focus_action:
					action.interface.priority = 0.0

		# start test action?
		if self.pars.dev.RUN_TEST_ACTION:
			self.start_test_action()

		# update selection mechanism
		self.selector.update(self)

		# get sham state
		sham = self.selector.sham

		# and store its state for monitoring
		self.output.sel_prio.data = self.selector.prio
		self.output.sel_inhib.data = self.selector.inhib

		# for each action
		for action in self.actions:

			# run descending branch
			action.descending()

		# action push
		for push in self.push:

			# add flags
			if self.pars.flags.BODY_ENABLE_TRANSLATION == 0:
				push.flags |= miro.constants.PUSH_FLAG_NO_TRANSLATION
			if self.pars.flags.BODY_ENABLE_ROTATION == 0:
				push.flags |= miro.constants.PUSH_FLAG_NO_ROTATION
			if self.pars.flags.BODY_ENABLE_NECK_MOVEMENT == 0:
				push.flags |= miro.constants.PUSH_FLAG_NO_NECK_MOVEMENT

			# modulate forward motion by sonar reading
			space = self.action_input.conf_space
			if self.pars.flags.ACTION_ENABLE_SONAR_STOP:
				if push.link == miro.constants.LINK_HEAD:
					if push.vec[0] > 0.0:
						x = push.vec[0]
						push.vec[0] *= space
						x = x - push.vec[0]

						if self.pars.flags.DEBUG_SONAR and x > 0.0:
							# play tone to indicate we're restricted
							if self.state.tick & 1:
								self.output.tone = int(x * 50000.0)
							else:
								self.output.tone = 0

			# if not in sham state
			if not sham:

				# apply push to local kc
				self.kc_m.push(push)

				# publish push to external kc
				self.output.pushes.append(push)

		# clear actioned pushes
		self.push = []

		# debug
		self.count += 1
