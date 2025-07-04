;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::RobotCommand)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'RobotCommand (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::ROBOTCOMMAND")
  (make-package "ROBOT_MSGS::ROBOTCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude RobotCommand.msg.html


(defclass robot_msgs::RobotCommand
  :super ros::object
  :slots (_motor_command ))

(defmethod robot_msgs::RobotCommand
  (:init
   (&key
    ((:motor_command __motor_command) (let (r) (dotimes (i 32) (push (instance robot_msgs::MotorCommand :init) r)) r))
    )
   (send-super :init)
   (setq _motor_command __motor_command)
   self)
  (:motor_command
   (&rest __motor_command)
   (if (keywordp (car __motor_command))
       (send* _motor_command __motor_command)
     (progn
       (if __motor_command (setq _motor_command (car __motor_command)))
       _motor_command)))
  (:serialization-length
   ()
   (+
    ;; robot_msgs/MotorCommand[32] _motor_command
    (apply #'+ (send-all _motor_command :serialization-length))
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; robot_msgs/MotorCommand[32] _motor_command
     (dolist (elem _motor_command)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; robot_msgs/MotorCommand[32] _motor_command
   (dotimes (i 32)
     (send (elt _motor_command i) :deserialize buf ptr-) (incf ptr- (send (elt _motor_command i) :serialization-length))
     )
   ;;
   self)
  )

(setf (get robot_msgs::RobotCommand :md5sum-) "ef1354637f40ee9d0985c79aafa5f40f")
(setf (get robot_msgs::RobotCommand :datatype-) "robot_msgs/RobotCommand")
(setf (get robot_msgs::RobotCommand :definition-)
      "MotorCommand[32] motor_command
================================================================================
MSG: robot_msgs/MotorCommand
float32 q            # motor target position
float32 dq           # motor target velocity
float32 tau          # motor target torque
float32 kp           # motor spring stiffness coefficient
float32 kd           # motor damper coefficient
")



(provide :robot_msgs/RobotCommand "ef1354637f40ee9d0985c79aafa5f40f")


