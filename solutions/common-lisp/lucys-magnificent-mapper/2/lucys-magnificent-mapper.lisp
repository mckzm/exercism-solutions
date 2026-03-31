(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

(defun make-magnificent-maybe (send-to numbers) (mapcar send-to numbers))

(defun only-the-best (filter numbers) (remove-if filter (remove 1 numbers)))
