# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "servo_control: 3 messages, 1 services")

set(MSG_I_FLAGS "-Iservo_control:/home/zhong/version_1_hand/version1_ws/src/servo_control/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(servo_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/WritePos.msg" NAME_WE)
add_custom_target(_servo_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "servo_control" "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/WritePos.msg" ""
)

get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/SetTorque.msg" NAME_WE)
add_custom_target(_servo_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "servo_control" "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/SetTorque.msg" ""
)

get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/srv/HandGrasp.srv" NAME_WE)
add_custom_target(_servo_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "servo_control" "/home/zhong/version_1_hand/version1_ws/src/servo_control/srv/HandGrasp.srv" ""
)

get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/ServoState.msg" NAME_WE)
add_custom_target(_servo_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "servo_control" "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/ServoState.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/WritePos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/servo_control
)
_generate_msg_cpp(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/SetTorque.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/servo_control
)
_generate_msg_cpp(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/ServoState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/servo_control
)

### Generating Services
_generate_srv_cpp(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/srv/HandGrasp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/servo_control
)

### Generating Module File
_generate_module_cpp(servo_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/servo_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(servo_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(servo_control_generate_messages servo_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/WritePos.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_cpp _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/SetTorque.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_cpp _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/srv/HandGrasp.srv" NAME_WE)
add_dependencies(servo_control_generate_messages_cpp _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/ServoState.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_cpp _servo_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(servo_control_gencpp)
add_dependencies(servo_control_gencpp servo_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS servo_control_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/WritePos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/servo_control
)
_generate_msg_lisp(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/SetTorque.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/servo_control
)
_generate_msg_lisp(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/ServoState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/servo_control
)

### Generating Services
_generate_srv_lisp(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/srv/HandGrasp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/servo_control
)

### Generating Module File
_generate_module_lisp(servo_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/servo_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(servo_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(servo_control_generate_messages servo_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/WritePos.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_lisp _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/SetTorque.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_lisp _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/srv/HandGrasp.srv" NAME_WE)
add_dependencies(servo_control_generate_messages_lisp _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/ServoState.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_lisp _servo_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(servo_control_genlisp)
add_dependencies(servo_control_genlisp servo_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS servo_control_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/WritePos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/servo_control
)
_generate_msg_py(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/SetTorque.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/servo_control
)
_generate_msg_py(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/ServoState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/servo_control
)

### Generating Services
_generate_srv_py(servo_control
  "/home/zhong/version_1_hand/version1_ws/src/servo_control/srv/HandGrasp.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/servo_control
)

### Generating Module File
_generate_module_py(servo_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/servo_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(servo_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(servo_control_generate_messages servo_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/WritePos.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_py _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/SetTorque.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_py _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/srv/HandGrasp.srv" NAME_WE)
add_dependencies(servo_control_generate_messages_py _servo_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/zhong/version_1_hand/version1_ws/src/servo_control/msg/ServoState.msg" NAME_WE)
add_dependencies(servo_control_generate_messages_py _servo_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(servo_control_genpy)
add_dependencies(servo_control_genpy servo_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS servo_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/servo_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/servo_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(servo_control_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/servo_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/servo_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(servo_control_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/servo_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/servo_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/servo_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(servo_control_generate_messages_py std_msgs_generate_messages_py)
endif()
