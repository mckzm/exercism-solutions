(defpackage :gigasecond-anniversary
  (:use :cl)
  (:export :from))
(in-package :gigasecond-anniversary)

(defun from (year month day hour minute second)
  (multiple-value-bind
    (second minute hour day month year)
    (decode-universal-time
      (+
	(encode-universal-time second minute hour day month year)
	(expt 10 9))
      )
    (list year month day hour minute second)))
