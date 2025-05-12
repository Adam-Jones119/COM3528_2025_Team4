;; Auto-generated. Do not edit!


(when (boundp 'mp_test::gesture)
  (if (not (find-package "MP_TEST"))
    (make-package "MP_TEST"))
  (shadow 'gesture (find-package "MP_TEST")))
(unless (find-package "MP_TEST::GESTURE")
  (make-package "MP_TEST::GESTURE"))

(in-package "ROS")
;;//! \htmlinclude gesture.msg.html


(defclass mp_test::gesture
  :super ros::object
  :slots (_gesture ))

(defmethod mp_test::gesture
  (:init
   (&key
    ((:gesture __gesture) "")
    )
   (send-super :init)
   (setq _gesture (string __gesture))
   self)
  (:gesture
   (&optional __gesture)
   (if __gesture (setq _gesture __gesture)) _gesture)
  (:serialization-length
   ()
   (+
    ;; string _gesture
    4 (length _gesture)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _gesture
       (write-long (length _gesture) s) (princ _gesture s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _gesture
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _gesture (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mp_test::gesture :md5sum-) "61f2a41b9e73483e6fa26641a58eaf74")
(setf (get mp_test::gesture :datatype-) "mp_test/gesture")
(setf (get mp_test::gesture :definition-)
      "string gesture
")



(provide :mp_test/gesture "61f2a41b9e73483e6fa26641a58eaf74")


