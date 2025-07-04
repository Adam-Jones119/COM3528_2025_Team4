#!/bin/bash
#
#	@section COPYRIGHT
#	Copyright (C) 2021 Consequential Robotics Ltd
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

# check we've run setup.bash
if [ "$MIRO_DIR_MDK" == "" ];
then
	echo "You should source ~/mdk/setup.bash before running this script"
	exit 1
fi

# default is to launch miro world
WORLD=$1
if [ "$WORLD" == "" ]; then WORLD=miro; fi
shift

# local paths
export GAZEBO_MODEL_PATH=./models:${GAZEBO_MODEL_PATH}
export GAZEBO_RESOURCE_PATH=.:${GAZEBO_RESOURCE_PATH}
export GAZEBO_PLUGIN_PATH=../bin/$MIRO_SYSTEM:${GAZEBO_PLUGIN_PATH}

# report
env | grep GAZEBO

# launch
rosrun gazebo_ros gazebo --verbose worlds/$WORLD.world $@
