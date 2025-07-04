;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::MotorCommand)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'MotorCommand (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::MOTORCOMMAND")
  (make-package "ROBOT_MSGS::MOTORCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude MotorCommand.msg.html


(defclass robot_msgs::MotorCommand
  :super ros::object
  :slots (_q _dq _tau _kp _kd ))

(defmethod robot_msgs::MotorCommand
  (:init
   (&key
    ((:q __q) 0.0)
    ((:dq __dq) 0.0)
    ((:tau __tau) 0.0)
    ((:kp __kp) 0.0)
    ((:kd __kd) 0.0)
    )
   (send-super :init)
   (setq _q (float __q))
   (setq _dq (float __dq))
   (setq _tau (float __tau))
   (setq _kp (float __kp))
   (setq _kd (float __kd))
   self)
  (:q
   (&optional __q)
   (if __q (setq _q __q)) _q)
  (:dq
   (&optional __dq)
   (if __dq (setq _dq __dq)) _dq)
  (:tau
   (&optional __tau)
   (if __tau (setq _tau __tau)) _tau)
  (:kp
   (&optional __kp)
   (if __kp (setq _kp __kp)) _kp)
  (:kd
   (&optional __kd)
   (if __kd (setq _kd __kd)) _kd)
  (:serialization-length
   ()
   (+
    ;; float32 _q
    4
    ;; float32 _dq
    4
    ;; float32 _tau
    4
    ;; float32 _kp
    4
    ;; float32 _kd
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _q
       (sys::poke _q (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _dq
       (sys::poke _dq (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tau
       (sys::poke _tau (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _kp
       (sys::poke _kp (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _kd
       (sys::poke _kd (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _q
     (setq _q (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dq
     (setq _dq (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tau
     (setq _tau (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _kp
     (setq _kp (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _kd
     (setq _kd (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msgs::MotorCommand :md5sum-) "0de93abe63b1a227801d67b6ef4add00")
(setf (get robot_msgs::MotorCommand :datatype-) "robot_msgs/MotorCommand")
(setf (get robot_msgs::MotorCommand :definition-)
      "float32 q            # motor target position
float32 dq           # motor target velocity
float32 tau          # motor target torque
float32 kp           # motor spring stiffness coefficient
float32 kd           # motor damper coefficient
")



(provide :robot_msgs/MotorCommand "0de93abe63b1a227801d67b6ef4add00")


