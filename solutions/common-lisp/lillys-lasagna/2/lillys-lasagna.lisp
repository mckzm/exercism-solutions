(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

(defun expected-time-in-oven () "Return expected oven time in minutes" 337)

(defun remaining-minutes-in-oven (minutes-in-oven) "Return remaining oven time in minutes given the elapsed oven time" (- (expected-time-in-oven) minutes-in-oven))

(defun preparation-time-in-minutes (layers) "Return preparation time in minutes given the number of layers" (* layers 19))

(defun  elapsed-time-in-minutes (layers minutes-in-oven) "Return elapsed time in minutes given the number of layers and the elapsed oven time" (+ (preparation-time-in-minutes layers) minutes-in-oven))

