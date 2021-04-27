
(cl:in-package :asdf)

(defsystem "path_collision_check-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "IsTraVal" :depends-on ("_package_IsTraVal"))
    (:file "_package_IsTraVal" :depends-on ("_package"))
  ))