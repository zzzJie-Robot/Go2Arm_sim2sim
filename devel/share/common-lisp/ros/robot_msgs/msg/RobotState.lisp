; Auto-generated. Do not edit!


(cl:in-package robot_msgs-msg)


;//! \htmlinclude RobotState.msg.html

(cl:defclass <RobotState> (roslisp-msg-protocol:ros-message)
  ((imu
    :reader imu
    :initarg :imu
    :type robot_msgs-msg:IMU
    :initform (cl:make-instance 'robot_msgs-msg:IMU))
   (motor_state
    :reader motor_state
    :initarg :motor_state
    :type (cl:vector robot_msgs-msg:MotorState)
   :initform (cl:make-array 32 :element-type 'robot_msgs-msg:MotorState :initial-element (cl:make-instance 'robot_msgs-msg:MotorState))))
)

(cl:defclass RobotState (<RobotState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_msgs-msg:<RobotState> is deprecated: use robot_msgs-msg:RobotState instead.")))

(cl:ensure-generic-function 'imu-val :lambda-list '(m))
(cl:defmethod imu-val ((m <RobotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:imu-val is deprecated.  Use robot_msgs-msg:imu instead.")
  (imu m))

(cl:ensure-generic-function 'motor_state-val :lambda-list '(m))
(cl:defmethod motor_state-val ((m <RobotState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_msgs-msg:motor_state-val is deprecated.  Use robot_msgs-msg:motor_state instead.")
  (motor_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotState>) ostream)
  "Serializes a message object of type '<RobotState>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'imu) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'motor_state))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotState>) istream)
  "Deserializes a message object of type '<RobotState>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'imu) istream)
  (cl:setf (cl:slot-value msg 'motor_state) (cl:make-array 32))
  (cl:let ((vals (cl:slot-value msg 'motor_state)))
    (cl:dotimes (i 32)
    (cl:setf (cl:aref vals i) (cl:make-instance 'robot_msgs-msg:MotorState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotState>)))
  "Returns string type for a message object of type '<RobotState>"
  "robot_msgs/RobotState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotState)))
  "Returns string type for a message object of type 'RobotState"
  "robot_msgs/RobotState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotState>)))
  "Returns md5sum for a message object of type '<RobotState>"
  "c7d5f0c74618348347456ca207fda81e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotState)))
  "Returns md5sum for a message object of type 'RobotState"
  "c7d5f0c74618348347456ca207fda81e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotState>)))
  "Returns full string definition for message of type '<RobotState>"
  (cl:format cl:nil "IMU imu~%MotorState[32] motor_state~%================================================================================~%MSG: robot_msgs/IMU~%float32[4] quaternion~%float32[3] gyroscope~%float32[3] accelerometer~%================================================================================~%MSG: robot_msgs/MotorState~%float32 q            # motor current position (rad)~%float32 dq           # motor current speed (rad/s)~%float32 ddq          # motor current speed (rad/s)~%float32 tau_est      # current estimated output torque (N*m)~%float32 cur          # current estimated output cur (N*m)~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotState)))
  "Returns full string definition for message of type 'RobotState"
  (cl:format cl:nil "IMU imu~%MotorState[32] motor_state~%================================================================================~%MSG: robot_msgs/IMU~%float32[4] quaternion~%float32[3] gyroscope~%float32[3] accelerometer~%================================================================================~%MSG: robot_msgs/MotorState~%float32 q            # motor current position (rad)~%float32 dq           # motor current speed (rad/s)~%float32 ddq          # motor current speed (rad/s)~%float32 tau_est      # current estimated output torque (N*m)~%float32 cur          # current estimated output cur (N*m)~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotState>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imu))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'motor_state) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotState>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotState
    (cl:cons ':imu (imu msg))
    (cl:cons ':motor_state (motor_state msg))
))
