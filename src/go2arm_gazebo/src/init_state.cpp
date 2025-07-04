    #include <ros/ros.h>
    #include <std_msgs/Float64.h>
    #include <vector>
    #include <string>
    #include <map>
    #include <regex>
    #include "robot_msgs/MotorCommand.h"

    int main(int argc, char** argv) {
        
        ros::init(argc, argv, "motor_command_publisher");
        ros::NodeHandle nh;

        const std::vector<std::string> motor_names = {
            "FL_hip", "FL_calf", "FL_thigh",
            "FR_hip", "FR_calf", "FR_thigh",
            "RL_hip", "RL_calf", "RL_thigh",
            "RR_hip", "RR_calf", "RR_thigh",
            "waist", "shoulder", "elbow", 
            "forearm_roll", "wrist_angle", "wrist_rotate" ,
            "left_finger", "right_finger"
        };



        std::map<std::string, ros::Publisher> motor_publishers;

        for (const auto& motor_name : motor_names) {
            std::string topic_name = "/go2_wx250s_gazebo/" + motor_name + "_controller/command";
            motor_publishers[motor_name] = nh.advertise<robot_msgs::MotorCommand>(topic_name, 10);
        }

        ros::Rate rate(1); 

        robot_msgs::MotorCommand motor_command;

        while (ros::ok()) {
            for (const auto& motor_name : motor_names) {
                if (std::regex_search(motor_name, std::regex(".*L_hip"))) {
                    motor_command.q = 0.1;
                    motor_command.kp = 40.0;
                    motor_command.kd = 1.0;
                } else if (std::regex_search(motor_name, std::regex(".*R_hip"))) {
                    motor_command.q = -0.1;
                    motor_command.kp = 40.0;
                    motor_command.kd = 1.0;
                } else if (std::regex_search(motor_name, std::regex("F[L,R]_thigh"))) {
                    motor_command.q = 0.8;
                    motor_command.kp = 40.0;
                    motor_command.kd = 1.0;
                } else if (std::regex_search(motor_name, std::regex("R[L,R]_thigh"))) {
                    motor_command.q = 1.0;
                    motor_command.kp = 40.0;
                    motor_command.kd = 1.0;
                } else if (std::regex_search(motor_name, std::regex(".*_calf"))) {
                    motor_command.q = -1.5;
                    motor_command.kp = 40.0;
                    motor_command.kd = 1.0;
                } else if (motor_name == "waist") {
                    motor_command.q = 0.0;
                    motor_command.kp = 50.0;
                    motor_command.kd = 0.5;
                } else if (motor_name == "shoulder") {
                    motor_command.q = 0.0;
                    motor_command.kp = 50.0;
                    motor_command.kd = 1.0;
                } else if (motor_name == "elbow") {
                    motor_command.q = 0.1;
                    motor_command.kp = 50.0;
                    motor_command.kd = 1.0;
                } else if (motor_name == "forearm_roll") {
                    motor_command.q = 0.0;
                    motor_command.kp = 50.0;
                    motor_command.kd = 1.0;
                } else if (motor_name == "wrist_angle") {
                    motor_command.q = -0.54;
                    motor_command.kp = 50.0;
                    motor_command.kd = 1.0;
                } else if (motor_name == "wrist_rotate") {
                    motor_command.q = 0.0;
                    motor_command.kp = 50.0;
                    motor_command.kd = 1.0;
                } else if (motor_name == "left_finger") {
                    motor_command.q = 0.025;
                    motor_command.kp = 5.0;
                    motor_command.kd = 0.5;
                } else if (motor_name == "right_finger") {
                    motor_command.q = -0.025;
                    motor_command.kp = 5.0;
                    motor_command.kd = 0.5;
                } else {
                    ROS_WARN_STREAM("Unknown motor: " << motor_name);
                    continue;
                }

                motor_publishers[motor_name].publish(motor_command);
            }
            rate.sleep(); 
        }
        return 0;
    }    


