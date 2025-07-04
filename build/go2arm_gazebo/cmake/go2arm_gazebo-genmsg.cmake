# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "go2arm_gazebo: 3 messages, 0 services")

set(MSG_I_FLAGS "-Igo2arm_gazebo:/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(go2arm_gazebo_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg" NAME_WE)
add_custom_target(_go2arm_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "go2arm_gazebo" "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg" ""
)

get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg" NAME_WE)
add_custom_target(_go2arm_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "go2arm_gazebo" "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg" ""
)

get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg" NAME_WE)
add_custom_target(_go2arm_gazebo_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "go2arm_gazebo" "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg" "go2arm_gazebo/Vector3:go2arm_gazebo/Orientation"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_cpp(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_cpp(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg;/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/go2arm_gazebo
)

### Generating Services

### Generating Module File
_generate_module_cpp(go2arm_gazebo
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/go2arm_gazebo
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(go2arm_gazebo_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(go2arm_gazebo_generate_messages go2arm_gazebo_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_cpp _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_cpp _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_cpp _go2arm_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(go2arm_gazebo_gencpp)
add_dependencies(go2arm_gazebo_gencpp go2arm_gazebo_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS go2arm_gazebo_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_eus(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_eus(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg;/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/go2arm_gazebo
)

### Generating Services

### Generating Module File
_generate_module_eus(go2arm_gazebo
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/go2arm_gazebo
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(go2arm_gazebo_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(go2arm_gazebo_generate_messages go2arm_gazebo_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_eus _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_eus _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_eus _go2arm_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(go2arm_gazebo_geneus)
add_dependencies(go2arm_gazebo_geneus go2arm_gazebo_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS go2arm_gazebo_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_lisp(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_lisp(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg;/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/go2arm_gazebo
)

### Generating Services

### Generating Module File
_generate_module_lisp(go2arm_gazebo
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/go2arm_gazebo
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(go2arm_gazebo_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(go2arm_gazebo_generate_messages go2arm_gazebo_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_lisp _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_lisp _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_lisp _go2arm_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(go2arm_gazebo_genlisp)
add_dependencies(go2arm_gazebo_genlisp go2arm_gazebo_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS go2arm_gazebo_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_nodejs(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_nodejs(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg;/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/go2arm_gazebo
)

### Generating Services

### Generating Module File
_generate_module_nodejs(go2arm_gazebo
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/go2arm_gazebo
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(go2arm_gazebo_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(go2arm_gazebo_generate_messages go2arm_gazebo_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_nodejs _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_nodejs _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_nodejs _go2arm_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(go2arm_gazebo_gennodejs)
add_dependencies(go2arm_gazebo_gennodejs go2arm_gazebo_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS go2arm_gazebo_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_py(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/go2arm_gazebo
)
_generate_msg_py(go2arm_gazebo
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg"
  "${MSG_I_FLAGS}"
  "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg;/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/go2arm_gazebo
)

### Generating Services

### Generating Module File
_generate_module_py(go2arm_gazebo
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/go2arm_gazebo
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(go2arm_gazebo_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(go2arm_gazebo_generate_messages go2arm_gazebo_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Vector3.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_py _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Orientation.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_py _go2arm_gazebo_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/legion/go2arm_sim2sim/src/go2arm_gazebo/msg/Command.msg" NAME_WE)
add_dependencies(go2arm_gazebo_generate_messages_py _go2arm_gazebo_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(go2arm_gazebo_genpy)
add_dependencies(go2arm_gazebo_genpy go2arm_gazebo_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS go2arm_gazebo_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/go2arm_gazebo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/go2arm_gazebo
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(go2arm_gazebo_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(go2arm_gazebo_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/go2arm_gazebo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/go2arm_gazebo
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(go2arm_gazebo_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(go2arm_gazebo_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/go2arm_gazebo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/go2arm_gazebo
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(go2arm_gazebo_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(go2arm_gazebo_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/go2arm_gazebo)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/go2arm_gazebo
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(go2arm_gazebo_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(go2arm_gazebo_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/go2arm_gazebo)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/go2arm_gazebo\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/go2arm_gazebo
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(go2arm_gazebo_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(go2arm_gazebo_generate_messages_py geometry_msgs_generate_messages_py)
endif()
