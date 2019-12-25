
(cl:in-package :asdf)

(defsystem "servo_control-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "HandGrasp" :depends-on ("_package_HandGrasp"))
    (:file "_package_HandGrasp" :depends-on ("_package"))
  ))