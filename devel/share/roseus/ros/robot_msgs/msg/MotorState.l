;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::MotorState)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'MotorState (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::MOTORSTATE")
  (make-package "ROBOT_MSGS::MOTORSTATE"))

(in-package "ROS")
;;//! \htmlinclude MotorState.msg.html


(defclass robot_msgs::MotorState
  :super ros::object
  :slots (_q _dq _ddq _tau_est _cur ))

(defmethod robot_msgs::MotorState
  (:init
   (&key
    ((:q __q) 0.0)
    ((:dq __dq) 0.0)
    ((:ddq __ddq) 0.0)
    ((:tau_est __tau_est) 0.0)
    ((:cur __cur) 0.0)
    )
   (send-super :init)
   (setq _q (float __q))
   (setq _dq (float __dq))
   (setq _ddq (float __ddq))
   (setq _tau_est (float __tau_est))
   (setq _cur (float __cur))
   self)
  (:q
   (&optional __q)
   (if __q (setq _q __q)) _q)
  (:dq
   (&optional __dq)
   (if __dq (setq _dq __dq)) _dq)
  (:ddq
   (&optional __ddq)
   (if __ddq (setq _ddq __ddq)) _ddq)
  (:tau_est
   (&optional __tau_est)
   (if __tau_est (setq _tau_est __tau_est)) _tau_est)
  (:cur
   (&optional __cur)
   (if __cur (setq _cur __cur)) _cur)
  (:serialization-length
   ()
   (+
    ;; float32 _q
    4
    ;; float32 _dq
    4
    ;; float32 _ddq
    4
    ;; float32 _tau_est
    4
    ;; float32 _cur
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
     ;; float32 _ddq
       (sys::poke _ddq (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _tau_est
       (sys::poke _tau_est (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _cur
       (sys::poke _cur (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _q
     (setq _q (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _dq
     (setq _dq (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _ddq
     (setq _ddq (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _tau_est
     (setq _tau_est (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _cur
     (setq _cur (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robot_msgs::MotorState :md5sum-) "bf3a599ff7d0c7528dc0b4a11694b234")
(setf (get robot_msgs::MotorState :datatype-) "robot_msgs/MotorState")
(setf (get robot_msgs::MotorState :definition-)
      "float32 q            # motor current position (rad)
float32 dq           # motor current speed (rad/s)
float32 ddq          # motor current speed (rad/s)
float32 tau_est      # current estimated output torque (N*m)
float32 cur          # current estimated output cur (N*m)
")



(provide :robot_msgs/MotorState "bf3a599ff7d0c7528dc0b4a11694b234")


