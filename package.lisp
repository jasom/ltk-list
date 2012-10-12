;;;; package.lisp

(defpackage #:ltk-list
  (:use #:cl))
(defpackage #:ltk-list
  (:use #:cl
        :ltk)
  (:export
        #:TCLIST
        #:TC-VALUE
        #:TC-NAME
	#:MAKE-TCLIST
        ;"(SETF TC-VALUE)"
        #:SAMPLE-LIST))

