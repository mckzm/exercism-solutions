(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

;; Define make-magnificent-maybe function
(defun make-magnificent-maybe (send-to numbers) (mapcar send-to numbers))

;; Define only-the-best function
(defun only-the-best (filter numbers) (remove-if filter (remove 1 numbers)))
