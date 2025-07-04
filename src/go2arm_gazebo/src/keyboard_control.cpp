#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Float32.h>
#include <termios.h>
#include <unistd.h>
#include "go2arm_gazebo/Command.h"
#include <std_msgs/Float64.h>
#include "robot_msgs/MotorCommand.h" 

bool is_Catch = false;

void handleKeyboardInput(char c, go2arm_gazebo::Command& cmd);
void limitCommandValues(go2arm_gazebo::Command& cmd);
void clearScreen();
void printStatus(const go2arm_gazebo::Command& cmd);


char getch()
{
    char buf = 0;
    struct termios old = {0};
    if (tcgetattr(0, &old) < 0)
        perror("tcsetattr()");
    old.c_lflag &= ~ICANON;
    old.c_lflag &= ~ECHO;
    old.c_cc[VMIN] = 1;
    old.c_cc[VTIME] = 0;
    if (tcsetattr(0, TCSANOW, &old) < 0)
        perror("tcsetattr ICANON");
    if (read(0, &buf, 1) < 0)
        perror("read()");
    old.c_lflag |= ICANON;
    old.c_lflag |= ECHO;
    if (tcsetattr(0, TCSADRAIN, &old) < 0)
        perror("tcsetattr ~ICANON");
    return buf;
}

void clearScreen()
{
    std::cout << "\033[2J\033[1;1H";  
}

void printStatus(const go2arm_gazebo::Command& cmd)
{
    std::cout << "Keyboard Control:\n";
    std::cout << "-----------------\n";
    std::cout << "Velocity (x,y,yaw):           W/S, A/D, Q/E\n";
    std::cout << "Position (x,y,z):             I/K, J/L, U/O\n";
    std::cout << "Orientation (pitch,roll,yaw): 8/5, 7/4, 9/6\n";
    std::cout << "Finger: (Catch, Release):     1/2\n";
    std::cout << "Reset: R\n\n";
    
    std::cout << "Current Values:\n";
    std::cout << "Velocity:    x=" << cmd.velocity.x 
              << "  y=" << cmd.velocity.y
              << "  yaw=" << cmd.velocity.z << "\n";
              
    std::cout << "Position:    x=" << cmd.pos.x 
              << "  y=" << cmd.pos.y
              << "  z=" << cmd.pos.z << "\n";
              
    std::cout << "Orientation: pitch=" << cmd.ori.pitch 
              << "  roll=" << cmd.ori.roll
              << "  yaw=" << cmd.ori.yaw << "\n";
    
    std::cout << "is_Catch: " << (is_Catch ? "true" : "false") << "\n";

    std::cout << "\nPress keys to control (Ctrl+C to exit)...\n";
}


void handleKeyboardInput(char c, go2arm_gazebo::Command& cmd)
{
    // Velocity control
    if (c == 'a') cmd.velocity.y += 0.05;
    else if (c == 'd') cmd.velocity.y -= 0.05;
    else if (c == 'w') cmd.velocity.x += 0.05;
    else if (c == 's') cmd.velocity.x -= 0.05;
    else if (c == 'q') cmd.velocity.z += 0.05;
    else if (c == 'e') cmd.velocity.z -= 0.05;
    
    // Position control
    else if (c == 'j') cmd.pos.y += 0.05;
    else if (c == 'l') cmd.pos.y -= 0.05;
    else if (c == 'i') cmd.pos.x += 0.05;
    else if (c == 'k') cmd.pos.x -= 0.05;
    else if (c == 'u') cmd.pos.z += 0.05;
    else if (c == 'o') cmd.pos.z -= 0.05;
    
    // Orientation control
    else if (c == '7') cmd.ori.roll += 0.05;
    else if (c == '4') cmd.ori.roll -= 0.05;
    else if (c == '8') cmd.ori.pitch += 0.05;
    else if (c == '5') cmd.ori.pitch -= 0.05;
    else if (c == '9') cmd.ori.yaw += 0.05;
    else if (c == '6') cmd.ori.yaw -= 0.05;
    
    // finger Catch
    else if (c == '1') {
        is_Catch = true;
        cmd.L_finger_pos = 0.017;
        cmd.R_finger_pos = -0.017;
    }

    // finger Release
    else if (c == '2') {
        is_Catch = false;
        cmd.L_finger_pos = 0.035;
        cmd.R_finger_pos = -0.035;
    }

    // Reset
    else if (c == 'r') {
        cmd.velocity.x = 0.0;
        cmd.velocity.y = 0.0;
        cmd.velocity.z = 0.0;
        cmd.ori.pitch = 0.0;
        cmd.ori.roll = 0.0;
        cmd.ori.yaw = 0.0;
        cmd.pos.x = 0.45;
        cmd.pos.y = 0.0;
        cmd.pos.z = 0.2;
        is_Catch = false;
        cmd.L_finger_pos = 0.025;
        cmd.R_finger_pos = -0.025;

    }
}

void limitCommandValues(go2arm_gazebo::Command& cmd)
{
    // Limit velocity values
    cmd.velocity.x = (cmd.velocity.x > 1.0) ? 1.0 : (cmd.velocity.x < -1.0) ? -1.0 : cmd.velocity.x;
    cmd.velocity.y = (cmd.velocity.y > 0.5) ? 0.5 : (cmd.velocity.y < -0.5) ? -0.5 : cmd.velocity.y;
    cmd.velocity.z = (cmd.velocity.z > 0.5) ? 0.5 : (cmd.velocity.z < -0.5) ? -0.5 : cmd.velocity.z;
    
    // Limit position values
    cmd.pos.x = (cmd.pos.x > 0.6) ? 0.6 : (cmd.pos.x < 0.3) ? 0.3 : cmd.pos.x;
    cmd.pos.y = (cmd.pos.y > 0.4) ? 0.4 : (cmd.pos.y < -0.4) ? -0.4 : cmd.pos.y;
    cmd.pos.z = (cmd.pos.z > 0.4) ? 0.4 : (cmd.pos.z < -0.2) ? -0.2 : cmd.pos.z;

    // Limit orientation values
    cmd.ori.pitch = (cmd.ori.pitch > 0.5) ? 0.5 : (cmd.ori.pitch < -0.5) ? -0.5 : cmd.ori.pitch;
    // cmd.ori.roll = (cmd.ori.roll > 1.0) ? 1.0 : (cmd.ori.roll < -1.0) ? -1.0 : cmd.ori.roll;
    cmd.ori.yaw = (cmd.ori.yaw > 0.5) ? 0.5 : (cmd.ori.yaw < -0.5) ? -0.5 : cmd.ori.yaw;

}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "keyboard_control_node");
    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<go2arm_gazebo::Command>("data_pub", 10);
    go2arm_gazebo::Command command;

    command.velocity.x = 0.0;
    command.velocity.y = 0.0;
    command.velocity.z = 0.0;
    command.ori.pitch = 0.0;
    command.ori.roll = 0.0;
    command.ori.yaw = 0.0;
    command.pos.x = 0.45;
    command.pos.y = 0.0;
    command.pos.z = 0.2;
    command.L_finger_pos = 0.025;
    command.R_finger_pos = -0.025;

    ros::Rate rate(10);  

    while (ros::ok())
    {
        clearScreen();
        printStatus(command);    
        
        char c = getch();
        handleKeyboardInput(c, command);
        limitCommandValues(command);
        pub.publish(command);
        rate.sleep();
    }

    return 0;
}


