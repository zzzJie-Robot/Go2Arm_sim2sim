;; Auto-generated. Do not edit!


(when (boundp 'robot_msgs::IMU)
  (if (not (find-package "ROBOT_MSGS"))
    (make-package "ROBOT_MSGS"))
  (shadow 'IMU (find-package "ROBOT_MSGS")))
(unless (find-package "ROBOT_MSGS::IMU")
  (make-package "ROBOT_MSGS::IMU"))

(in-package "ROS")
;;//! \htmlinclude IMU.msg.html


(defclass robot_msgs::IMU
  :super ros::object
  :slots (_quaternion _gyroscope _accelerometer ))

(defmethod robot_msgs::IMU
  (:init
   (&key
    ((:quaternion __quaternion) (make-array 4 :initial-element 0.0 :element-type :float))
    ((:gyroscope __gyroscope) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:accelerometer __accelerometer) (make-array 3 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _quaternion __quaternion)
   (setq _gyroscope __gyroscope)
   (setq _accelerometer __accelerometer)
   self)
  (:quaternion
   (&optional __quaternion)
   (if __quaternion (setq _quaternion __quaternion)) _quaternion)
  (:gyroscope
   (&optional __gyroscope)
   (if __gyroscope (setq _gyroscope __gyroscope)) _gyroscope)
  (:accelerometer
   (&optional __accelerometer)
   (if __accelerometer (setq _accelerometer __accelerometer)) _accelerometer)
  (:serialization-length
   ()
   (+
    ;; float32[4] _quaternion
    (* 4    4)
    ;; float32[3] _gyroscope
    (* 4    3)
    ;; float32[3] _accelerometer
    (* 4    3)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[4] _quaternion
     (dotimes (i 4)
       (sys::poke (elt _quaternion i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _gyroscope
     (dotimes (i 3)
       (sys::poke (elt _gyroscope i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _accelerometer
     (dotimes (i 3)
       (sys::poke (elt _accelerometer i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[4] _quaternion
   (dotimes (i (length _quaternion))
     (setf (elt _quaternion i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _gyroscope
   (dotimes (i (length _gyroscope))
     (setf (elt _gyroscope i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _accelerometer
   (dotimes (i (length _accelerometer))
     (setf (elt _accelerometer i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;;
   self)
  )

(setf (get robot_msgs::IMU :md5sum-) "615f09ab254a289c43db20afb6b357e3")
(setf (get robot_msgs::IMU :datatype-) "robot_msgs/IMU")
(setf (get robot_msgs::IMU :definition-)
      "float32[4] quaternion
float32[3] gyroscope
float32[3] accelerometer
")



(provide :robot_msgs/IMU "615f09ab254a289c43db20afb6b357e3")


