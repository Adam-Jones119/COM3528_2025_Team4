# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "miro2_msg: 18 messages, 0 services")

set(MSG_I_FLAGS "-Imiro2_msg:/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(miro2_msg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg" ""
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg" "miro2_msg/adjust"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg" ""
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg" "miro2_msg/affect_adjust:miro2_msg/sleep_adjust:miro2_msg/adjust"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg" "miro2_msg/sleep:miro2_msg/affect"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg" "miro2_msg/img_annotation:std_msgs/Header:std_msgs/MultiArrayDimension:std_msgs/String:std_msgs/Float32:std_msgs/UInt8:std_msgs/MultiArrayLayout:std_msgs/Float32MultiArray"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg" "std_msgs/Header:std_msgs/MultiArrayDimension:std_msgs/String:std_msgs/Float32:std_msgs/UInt8:std_msgs/MultiArrayLayout:std_msgs/Float32MultiArray"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg" ""
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg" ""
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg" "miro2_msg/object_ball:miro2_msg/object_face:miro2_msg/object_tag"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg" ""
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg" ""
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg" "geometry_msgs/Point:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg" "geometry_msgs/Pose2D:sensor_msgs/Imu:std_msgs/UInt16MultiArray:std_msgs/Header:miro2_msg/BatteryState:geometry_msgs/TwistWithCovariance:std_msgs/Float32MultiArray:nav_msgs/Odometry:std_msgs/UInt16:std_msgs/MultiArrayDimension:geometry_msgs/Point:std_msgs/MultiArrayLayout:geometry_msgs/Quaternion:geometry_msgs/Vector3:geometry_msgs/PoseWithCovariance:std_msgs/UInt32:sensor_msgs/Range:sensor_msgs/JointState:geometry_msgs/Twist:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg" "miro2_msg/adjust"
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg" ""
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg" ""
)

get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg" NAME_WE)
add_custom_target(_miro2_msg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "miro2_msg" "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt32.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Range.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)
_generate_msg_cpp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
)

### Generating Services

### Generating Module File
_generate_module_cpp(miro2_msg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(miro2_msg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(miro2_msg_generate_messages miro2_msg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_cpp _miro2_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(miro2_msg_gencpp)
add_dependencies(miro2_msg_gencpp miro2_msg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS miro2_msg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt32.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Range.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)
_generate_msg_eus(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
)

### Generating Services

### Generating Module File
_generate_module_eus(miro2_msg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(miro2_msg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(miro2_msg_generate_messages miro2_msg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_eus _miro2_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(miro2_msg_geneus)
add_dependencies(miro2_msg_geneus miro2_msg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS miro2_msg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt32.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Range.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)
_generate_msg_lisp(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
)

### Generating Services

### Generating Module File
_generate_module_lisp(miro2_msg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(miro2_msg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(miro2_msg_generate_messages miro2_msg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_lisp _miro2_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(miro2_msg_genlisp)
add_dependencies(miro2_msg_genlisp miro2_msg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS miro2_msg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt32.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Range.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)
_generate_msg_nodejs(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
)

### Generating Services

### Generating Module File
_generate_module_nodejs(miro2_msg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(miro2_msg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(miro2_msg_generate_messages miro2_msg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_nodejs _miro2_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(miro2_msg_gennodejs)
add_dependencies(miro2_msg_gennodejs miro2_msg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS miro2_msg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/String.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt8.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose2D.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Imu.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16MultiArray.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/TwistWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Float32MultiArray.msg;/opt/ros/noetic/share/nav_msgs/cmake/../msg/Odometry.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt16.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayDimension.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/MultiArrayLayout.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseWithCovariance.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/UInt32.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Range.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/JointState.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Twist.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg"
  "${MSG_I_FLAGS}"
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)
_generate_msg_py(miro2_msg
  "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
)

### Generating Services

### Generating Module File
_generate_module_py(miro2_msg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(miro2_msg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(miro2_msg_generate_messages miro2_msg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/affect.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/animal_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/funnel_web.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/img_annotation.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_ball.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_face.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/objects.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/object_tag.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/priority_peak.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/push.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sensors_package.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep_adjust.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/sleep.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/voice_state.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/joel/pkgs/mdk-230105/catkin_ws/src/miro2_msg/msg/BatteryState.msg" NAME_WE)
add_dependencies(miro2_msg_generate_messages_py _miro2_msg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(miro2_msg_genpy)
add_dependencies(miro2_msg_genpy miro2_msg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS miro2_msg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/miro2_msg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(miro2_msg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(miro2_msg_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(miro2_msg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(miro2_msg_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/miro2_msg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(miro2_msg_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(miro2_msg_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(miro2_msg_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(miro2_msg_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/miro2_msg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(miro2_msg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(miro2_msg_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(miro2_msg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(miro2_msg_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/miro2_msg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(miro2_msg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(miro2_msg_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(miro2_msg_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(miro2_msg_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/miro2_msg
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(miro2_msg_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(miro2_msg_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(miro2_msg_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(miro2_msg_generate_messages_py nav_msgs_generate_messages_py)
endif()
