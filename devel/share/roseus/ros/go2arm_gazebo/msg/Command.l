;; Auto-generated. Do not edit!


(when (boundp 'go2arm_gazebo::Command)
  (if (not (find-package "GO2ARM_GAZEBO"))
    (make-package "GO2ARM_GAZEBO"))
  (shadow 'Command (find-package "GO2ARM_GAZEBO")))
(unless (find-package "GO2ARM_GAZEBO::COMMAND")
  (make-package "GO2ARM_GAZEBO::COMMAND"))

(in-package "ROS")
;;//! \htmlinclude Command.msg.html


(defclass go2arm_gazebo::Command
  :super ros::object
  :slots (_velocity _pos _ori _L_finger_pos _R_finger_pos ))

(defmethod go2arm_gazebo::Command
  (:init
   (&key
    ((:velocity __velocity) (instance go2arm_gazebo::Vector3 :init))
    ((:pos __pos) (instance go2arm_gazebo::Vector3 :init))
    ((:ori __ori) (instance go2arm_gazebo::Orientation :init))
    ((:L_finger_pos __L_finger_pos) 0.0)
    ((:R_finger_pos __R_finger_pos) 0.0)
    )
   (send-super :init)
   (setq _velocity __velocity)
   (setq _pos __pos)
   (setq _ori __ori)
   (setq _L_finger_pos (float __L_finger_pos))
   (setq _R_finger_pos (float __R_finger_pos))
   self)
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:pos
   (&rest __pos)
   (if (keywordp (car __pos))
       (send* _pos __pos)
     (progn
       (if __pos (setq _pos (car __pos)))
       _pos)))
  (:ori
   (&rest __ori)
   (if (keywordp (car __ori))
       (send* _ori __ori)
     (progn
       (if __ori (setq _ori (car __ori)))
       _ori)))
  (:L_finger_pos
   (&optional __L_finger_pos)
   (if __L_finger_pos (setq _L_finger_pos __L_finger_pos)) _L_finger_pos)
  (:R_finger_pos
   (&optional __R_finger_pos)
   (if __R_finger_pos (setq _R_finger_pos __R_finger_pos)) _R_finger_pos)
  (:serialization-length
   ()
   (+
    ;; go2arm_gazebo/Vector3 _velocity
    (send _velocity :serialization-length)
    ;; go2arm_gazebo/Vector3 _pos
    (send _pos :serialization-length)
    ;; go2arm_gazebo/Orientation _ori
    (send _ori :serialization-length)
    ;; float64 _L_finger_pos
    8
    ;; float64 _R_finger_pos
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; go2arm_gazebo/Vector3 _velocity
       (send _velocity :serialize s)
     ;; go2arm_gazebo/Vector3 _pos
       (send _pos :serialize s)
     ;; go2arm_gazebo/Orientation _ori
       (send _ori :serialize s)
     ;; float64 _L_finger_pos
       (sys::poke _L_finger_pos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _R_finger_pos
       (sys::poke _R_finger_pos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; go2arm_gazebo/Vector3 _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; go2arm_gazebo/Vector3 _pos
     (send _pos :deserialize buf ptr-) (incf ptr- (send _pos :serialization-length))
   ;; go2arm_gazebo/Orientation _ori
     (send _ori :deserialize buf ptr-) (incf ptr- (send _ori :serialization-length))
   ;; float64 _L_finger_pos
     (setq _L_finger_pos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _R_finger_pos
     (setq _R_finger_pos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get go2arm_gazebo::Command :md5sum-) "7ab687a3009a5ba42ab64b770a245c5d")
(setf (get go2arm_gazebo::Command :datatype-) "go2arm_gazebo/Command")
(setf (get go2arm_gazebo::Command :definition-)
      "# Command.msg
Vector3 velocity
Vector3 pos
Orientation ori
float64 L_finger_pos
float64 R_finger_pos
================================================================================
MSG: go2arm_gazebo/Vector3
# Vector3.msg
float32 x
float32 y
float32 z
================================================================================
MSG: go2arm_gazebo/Orientation
# Orientation.msg
float32 roll
float32 pitch
float32 yaw
")



(provide :go2arm_gazebo/Command "7ab687a3009a5ba42ab64b770a245c5d")


