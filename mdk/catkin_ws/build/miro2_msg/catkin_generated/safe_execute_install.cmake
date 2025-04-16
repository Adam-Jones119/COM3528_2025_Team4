execute_process(COMMAND "/home/joel/pkgs/mdk-230105/catkin_ws/build/miro2_msg/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/joel/pkgs/mdk-230105/catkin_ws/build/miro2_msg/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
