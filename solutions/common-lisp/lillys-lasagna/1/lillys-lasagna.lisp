(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

;; Define function expected-time-in-oven
(defun expected-time-in-oven () "Return expected oven time in minutes" 337)

;; Define function remaining-minutes-in-oven
(defun remaining-minutes-in-oven (minutes-in-oven) "Return remaining oven time in minutes given the elapsed oven time" (- (expected-time-in-oven) minutes-in-oven))

;; Define function preparation-time-in-minutes
(defun preparation-time-in-minutes (layers) "Return preparation time in minutes given the number of layers" (* layers 19))

;; Define function elapsed-time-in-minutes
(defun  elapsed-time-in-minutes (layers minutes-in-oven) "Return elapsed time in minutes given the number of layers and the elapsed oven time" (+ (preparation-time-in-minutes layers) minutes-in-oven))

