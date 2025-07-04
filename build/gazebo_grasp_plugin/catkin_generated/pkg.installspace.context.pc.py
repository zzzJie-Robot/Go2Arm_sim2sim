# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "gazebo_ros;geometry_msgs;roscpp;std_msgs;gazebo_version_helpers".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lgazebo_grasp_fix;-lgazebo_grasp_msgs".split(';') if "-lgazebo_grasp_fix;-lgazebo_grasp_msgs" != "" else []
PROJECT_NAME = "gazebo_grasp_plugin"
PROJECT_SPACE_DIR = "/home/legion/go2arm_sim2sim/install"
PROJECT_VERSION = "1.0.2"
