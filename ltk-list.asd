;;;; ltk-list.asd

(asdf:defsystem #:ltk-list
  :serial t
  :depends-on (#:ltk)
  :components ((:file "package")
               (:file "ltk-list")))

