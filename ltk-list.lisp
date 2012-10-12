
(in-package ltk-list)

(defclass tclist ()
  ((name :initform (gentemp "LTKLIST") :reader tc-name)
   (value :initform nil :reader tc-value)))

(defmethod (setf tc-value) (new-value (obj tclist))
  (format-wish "global ~a; set ~a [list~{ ~S~}]"
               (string-downcase (symbol-name (tc-name obj)))
               (string-downcase (symbol-name (tc-name obj))) new-value)
  (setf (slot-value obj 'value) new-value))

(defun make-tclist ()
  (make-instance 'tclist))

(defun sample-list ()
            (let* ((f (make-instance 'frame))
                   (l (make-instance 'tclist))
                   (b1 (make-instance 'button
                                      :master f
                                      :text "Button 1"
                                      :command (lambda ()
                                                 (setf (tc-value l)
                                                       (cons (symbol-name (gentemp)) (tc-value l))))))
                   (b2 (make-instance 'listbox
                                      :master f
                                      :listvariable (tc-name l)
                                      :selectmode :extended))
                   (b3 (make-instance 'scrollbar
                                      :master f
                                      :orientation :vertical)))
              (pack f)
              (pack b1 :side :left)
              (pack b2 :side :left)
              (pack b3 :side :left :fill :y)
              (configure b2 :yscrollcommand (format nil "~a set" (widget-path b3)))
              (configure b3 "command" (format nil "~a yview" (widget-path b2)))
              (configure f :borderwidth 3)
              (configure f :relief :sunken)
              ))

