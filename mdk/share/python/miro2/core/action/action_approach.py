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
#
#	Action approach
#	action for MIRO to approach a stimulus


import numpy as np
import tf
import rospy
import copy
import miro2 as miro

from . import action_types



class ActionApproach(action_types.ActionTemplate):

	def finalize(self):

		# parameters
		self.name = "approach"
		self.retreatable = True

	def compute_priority(self):
		rospy.loginfo(f"Gesture: {self.gesture}")
		
		# extract variables
		peak_height = self.input.priority_peak.height
		size_norm = self.input.priority_peak.size_norm
		fixation = self.input.fixation
		valence = self.input.emotion.valence
		arousal = self.input.emotion.arousal

		# extract pars
		move_fixation_thresh = self.pars.action.move_fixation_thresh
		move_size_gain = self.pars.action.move_size_gain
		move_fixation_gain = self.pars.action.move_fixation_gain
		move_valence_gain = self.pars.action.move_valence_gain
		move_arousal_gain = self.pars.action.move_arousal_gain

		# compute priority
		modulation = 1.0 \
		 	- move_size_gain * (size_norm - 0.5) \
			+ move_fixation_gain * (fixation - move_fixation_thresh) \
			+ move_valence_gain * (valence - 0.5) \
			+ move_arousal_gain * (arousal - 0.5)
		priority = self.move_softsat(peak_height * modulation)

		# modulate by cliff and sonar
		priority *= self.input.conf_surf
		priority *= self.input.conf_space

		# if gesture is one of the following, motivate approach
		valid_gestures = ["Knee Smacking"]
		if self.gesture in valid_gestures:
			priority += 1

		# ok
		rospy.loginfo(f"Approach priority: {priority}")
		return priority

	def event_start(self):

		self.appetitive_response(self.pars.action.approach_appetitive_commitment)
		self.debug_event_start()

	def start(self):

		# compute start point for fovea in WORLD
		self.fovea_i_WORLD = self.kc.changeFrameAbs(miro.constants.LINK_HEAD, miro.constants.LINK_WORLD, self.fovea_HEAD)

		# compute end point for fovea in WORLD
		fovea_f_WORLD = self.kc.changeFrameAbs(
				miro.constants.LINK_HEAD,
				miro.constants.LINK_WORLD,
				miro.lib.kc_interf.kc_viewline_to_position(
					self.input.priority_peak.azim,
					self.input.priority_peak.elev,
					self.input.priority_peak.range
					)
				)

		# limit end point to be reachable
		fovea_f_WORLD[2] = np.clip(fovea_f_WORLD[2],
							self.pars.geom.reachable_z_min,
							self.pars.geom.reachable_z_max
							)

		# compute total movement fovea will make in world
		self.dfovea_WORLD = fovea_f_WORLD - self.fovea_i_WORLD

		# compute pattern time
		total_dist = np.linalg.norm(self.dfovea_WORLD)
		secs_ideal = total_dist * self.pars.action.approach_speed_spm
		steps_ideal = int(secs_ideal * self.pars.timing.tick_hz)
		steps_constrained = np.clip(steps_ideal,
					self.pars.action.approach_min_steps,
					self.pars.action.approach_max_steps
					)

		# start pattern
		self.clock.start(steps_constrained)

		# debug
		if self.debug:
			print ("fovea_i_WORLD", self.fovea_i_WORLD)
			print ("fovea_f_WORLD", fovea_f_WORLD)
			print ("pattern time", total_dist, secs_ideal, steps_ideal, steps_constrained)

	def service(self):

		# read clock
		x = self.clock.cosine_profile()
		self.clock.advance(True)

		# compute an interim target along a straight trajectory
		fovea_x_WORLD = x * self.dfovea_WORLD + self.fovea_i_WORLD

		# transform interim target into HEAD for actioning
		fovea_x_HEAD = self.kc.changeFrameAbs(miro.constants.LINK_WORLD, miro.constants.LINK_HEAD, fovea_x_WORLD)

		# apply push
		self.apply_push_fovea(fovea_x_HEAD - self.fovea_HEAD)

		# debug fovea movement through WORLD
		#fovea_WORLD = self.kc.changeFrameAbs(miro.constants.LINK_HEAD, miro.constants.LINK_WORLD, self.fovea_HEAD)
		#print ("fovea_WORLD", fovea_WORLD, self.clock.toString())
