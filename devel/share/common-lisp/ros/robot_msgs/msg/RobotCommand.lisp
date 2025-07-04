; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude RobotCommand.msg.html

(cl:defclass <RobotCommand> (roslisp-msg-protocol:ros-message)
  ((motor_command
    :reader motor_command
    :initarg :motor_command
    :type (cl:vector robot_msgs-msg:MotorCommand)
   :initform (cl:make-array 32 :element-type 'robot_msgs-msg:MotorCommand :initial-element (cl:make-instance 'robot_msgs-msg:MotorCommand))))
)

(cl:defclass RobotCommand (<RobotCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<RobotCommand> is deprecated: use robot_msgs-msg:RobotCommand instead.")))

(cl:ensure-generic-function 'motor_command-val :lambda-list '(m))
(cl:defmethod motor_command-val ((m <RobotCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:motor_command-val is deprecated.  Use robot_msgs-msg:motor_command instead.")
  (motor_command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotCommand>) ostream)
  "Serializes a message object of type '<RobotCommand>"
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'motor_command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotCommand>) istream)
  "Deserializes a message object of type '<RobotCommand>"
  (cl:setf (cl:slot-value msg 'motor_command) (cl:make-array 32))
  (cl:let ((vals (cl:slot-value msg 'motor_command)))
    (cl:dotimes (i 32)
    (cl:setf (cl:aref vals i) (cl:make-instance 'robot_msgs-msg:MotorCommand))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotCommand>)))
  "Returns string type for a message object of type '<RobotCommand>"
  "robot_msgs/RobotCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotCommand)))
  "Returns string type for a message object of type 'RobotCommand"
  "robot_msgs/RobotCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotCommand>)))
  "Returns md5sum for a message object of type '<RobotCommand>"
  "ef1354637f40ee9d0985c79aafa5f40f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotCommand)))
  "Returns md5sum for a message object of type 'RobotCommand"
  "ef1354637f40ee9d0985c79aafa5f40f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotCommand>)))
  "Returns full string definition for message of type '<RobotCommand>"
  (cl:format cl:nil "MotorCommand[32] motor_command~%================================================================================~%MSG: robot_msgs/MotorCommand~%float32 q            # motor target position~%float32 dq           # motor target velocity~%float32 tau          # motor target torque~%float32 kp           # motor spring stiffness coefficient~%float32 kd           # motor damper coefficient~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotCommand)))
  "Returns full string definition for message of type 'RobotCommand"
  (cl:format cl:nil "MotorCommand[32] motor_command~%================================================================================~%MSG: robot_msgs/MotorCommand~%float32 q            # motor target position~%float32 dq           # motor target velocity~%float32 tau          # motor target torque~%float32 kp           # motor spring stiffness coefficient~%float32 kd           # motor damper coefficient~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotCommand>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'motor_command) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotCommand
    (cl:cons ':motor_command (motor_command msg))
))
