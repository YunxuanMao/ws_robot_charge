;; Auto-generated. Do not edit!


(when (boundp 'path_collision_check::IsTraVal)
  (if (not (find-package "PATH_COLLISION_CHECK"))
    (make-package "PATH_COLLISION_CHECK"))
  (shadow 'IsTraVal (find-package "PATH_COLLISION_CHECK")))
(unless (find-package "PATH_COLLISION_CHECK::ISTRAVAL")
  (make-package "PATH_COLLISION_CHECK::ISTRAVAL"))
(unless (find-package "PATH_COLLISION_CHECK::ISTRAVALREQUEST")
  (make-package "PATH_COLLISION_CHECK::ISTRAVALREQUEST"))
(unless (find-package "PATH_COLLISION_CHECK::ISTRAVALRESPONSE")
  (make-package "PATH_COLLISION_CHECK::ISTRAVALRESPONSE"))

(in-package "ROS")





(defclass path_collision_check::IsTraValRequest
  :super ros::object
  :slots (_file_name ))

(defmethod path_collision_check::IsTraValRequest
  (:init
   (&key
    ((:file_name __file_name) "")
    )
   (send-super :init)
   (setq _file_name (string __file_name))
   self)
  (:file_name
   (&optional __file_name)
   (if __file_name (setq _file_name __file_name)) _file_name)
  (:serialization-length
   ()
   (+
    ;; string _file_name
    4 (length _file_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _file_name
       (write-long (length _file_name) s) (princ _file_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _file_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _file_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass path_collision_check::IsTraValResponse
  :super ros::object
  :slots (_IsVal ))

(defmethod path_collision_check::IsTraValResponse
  (:init
   (&key
    ((:IsVal __IsVal) nil)
    )
   (send-super :init)
   (setq _IsVal __IsVal)
   self)
  (:IsVal
   (&optional __IsVal)
   (if __IsVal (setq _IsVal __IsVal)) _IsVal)
  (:serialization-length
   ()
   (+
    ;; bool _IsVal
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _IsVal
       (if _IsVal (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _IsVal
     (setq _IsVal (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass path_collision_check::IsTraVal
  :super ros::object
  :slots ())

(setf (get path_collision_check::IsTraVal :md5sum-) "33c97e92ddfb5fd9eeda43da1e556307")
(setf (get path_collision_check::IsTraVal :datatype-) "path_collision_check/IsTraVal")
(setf (get path_collision_check::IsTraVal :request) path_collision_check::IsTraValRequest)
(setf (get path_collision_check::IsTraVal :response) path_collision_check::IsTraValResponse)

(defmethod path_collision_check::IsTraValRequest
  (:response () (instance path_collision_check::IsTraValResponse :init)))

(setf (get path_collision_check::IsTraValRequest :md5sum-) "33c97e92ddfb5fd9eeda43da1e556307")
(setf (get path_collision_check::IsTraValRequest :datatype-) "path_collision_check/IsTraValRequest")
(setf (get path_collision_check::IsTraValRequest :definition-)
      "string file_name
---
bool IsVal

")

(setf (get path_collision_check::IsTraValResponse :md5sum-) "33c97e92ddfb5fd9eeda43da1e556307")
(setf (get path_collision_check::IsTraValResponse :datatype-) "path_collision_check/IsTraValResponse")
(setf (get path_collision_check::IsTraValResponse :definition-)
      "string file_name
---
bool IsVal

")



(provide :path_collision_check/IsTraVal "33c97e92ddfb5fd9eeda43da1e556307")


