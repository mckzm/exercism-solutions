(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

(defun expected-time-in-oven ()
  "Return expected oven time in minutes"
  337)

(defun remaining-minutes-in-oven (minutes-in-oven)
  "Return remaining oven time given the elapsed oven time, both in minutes"
  (- (expected-time-in-oven) minutes-in-oven))

(defconstant +preparation-time-per-layer+ 19
  "Preparation time in minutes for a single layer")

(defun preparation-time-in-minutes (layers)
  "Return preparation time in minutes given the number of layers"
  (* layers +preparation-time-per-layer+))

(defun  elapsed-time-in-minutes (layers minutes-in-oven)
  "Return elapsed time in minutes given the number of layers\
  and the elapsed oven time in minutes"
  (+ (preparation-time-in-minutes layers) minutes-in-oven))

