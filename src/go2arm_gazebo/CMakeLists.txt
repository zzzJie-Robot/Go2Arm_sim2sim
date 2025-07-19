cmake_minimum_required(VERSION 3.0.2)
project(go2arm_gazebo)

add_definitions(-DCMAKE_CURRENT_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")


set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")



set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${TORCH_CXX_FLAGS}")
find_package(Torch REQUIRED)

find_package(Boost REQUIRED COMPONENTS system)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${GAZEBO_CXX_FLAGS}")
find_package(gazebo REQUIRED)

find_package(catkin REQUIRED COMPONENTS
    controller_manager
    genmsg
    joint_state_controller
    robot_state_publisher
    roscpp
    gazebo_ros
    std_msgs
    tf
    geometry_msgs
    # Torch REQUIRED
    message_generation
    robot_msgs
    robot_joint_controller
)

add_message_files(
  FILES
  Vector3.msg
  Orientation.msg
  Command.msg

)

generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
)

catkin_package(
    CATKIN_DEPENDS 
    std_msgs 
    geometry_msgs
    message_runtime 
    robot_joint_controller
)

include_directories(
    include
    ${Boost_INCLUDE_DIR}
    ${catkin_INCLUDE_DIRS}
    ${GAZEBO_INCLUDE_DIRS}
    # ${LIBTORCH_DIR}/include
)

link_directories(${GAZEBO_LIBRARY_DIRS})

add_library(unitreeFootContactPlugin SHARED plugin/foot_contact_plugin.cc)
target_link_libraries(unitreeFootContactPlugin ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})

add_library(unitreeDrawForcePlugin SHARED plugin/draw_force_plugin.cc)
target_link_libraries(unitreeDrawForcePlugin ${catkin_LIBRARIES} ${GAZEBO_LIBRARIES})


add_executable(main src/main.cpp )
add_dependencies(main ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(main
    ${catkin_LIBRARIES}
    ${TORCH_LIBRARIES}
)

add_executable(keyboard_control src/keyboard_control.cpp)
target_link_libraries(keyboard_control
    ${catkin_LIBRARIES}

)

add_executable(init_state src/init_state.cpp)
target_link_libraries(init_state
    ${catkin_LIBRARIES}

)

