(defpackage :reporting-for-duty
  (:use :cl)
  (:export :format-quarter-value :format-two-quarters
           :format-two-quarters-for-reading))

(in-package :reporting-for-duty)

(defun format-quarter-value (quarter value)
  (format nil "The value ~A quarter: ~A" quarter value))

(defun format-two-quarters (output-stream first-quarter first-value second-quarter second-value)
  (format output-stream "~%~A~%~A~%" (format-quarter-value first-quarter first-value) (format-quarter-value second-quarter second-value)))

(defun format-two-quarters-for-reading (output-stream first-quarter first-value second-quarter second-value)
  (format output-stream "(~S ~S)" (format-quarter-value first-quarter first-value) (format-quarter-value second-quarter second-value)))
