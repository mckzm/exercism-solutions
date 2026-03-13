(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

(defun preparation-time (&rest layers)
  (* 19 (length layers)))

(defun remaining-minutes-in-oven (&optional (time-adjustment nil time-adjustment-supplied-p))
  (if time-adjustment-supplied-p
    (ecase time-adjustment
      (:normal 337)
      (:shorter 237)
      (:very-short 137)
      (:longer 437)
      (:very-long 537)
      ('nil 0))
    337))

(defun split-leftovers (&key (weight nil weight-supplied-p) (human 10) (alien 10))
  (if weight-supplied-p
    (case weight
      ('nil :looks-like-someone-was-hungry)
      (otherwise (- weight human alien)))
    :just-split-it))
