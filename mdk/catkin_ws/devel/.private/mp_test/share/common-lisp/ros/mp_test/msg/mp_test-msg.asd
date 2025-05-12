
(cl:in-package :asdf)

(defsystem "mp_test-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "gesture" :depends-on ("_package_gesture"))
    (:file "_package_gesture" :depends-on ("_package"))
  ))