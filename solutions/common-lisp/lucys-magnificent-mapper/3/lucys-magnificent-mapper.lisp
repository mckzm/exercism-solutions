(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

(defun make-magnificent-maybe (func numbers) (mapcar func numbers))

(defun only-the-best (filter numbers) (remove-if filter (remove 1 numbers)))
