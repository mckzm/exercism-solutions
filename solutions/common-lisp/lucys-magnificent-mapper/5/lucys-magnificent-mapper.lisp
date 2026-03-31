(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

(defun make-magnificent-maybe (func numbers-list)
  (mapcar func numbers-list))

(defun only-the-best (filter numbers-list)
  (remove-if filter (remove 1 numbers-list)))
