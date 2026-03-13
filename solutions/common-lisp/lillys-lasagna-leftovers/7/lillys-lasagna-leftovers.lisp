(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

(defconstant +minutes-per-layer+ 19)

(defconstant +default-cooking-time+ 337)

(defun preparation-time (&rest layers)
  (* +minutes-per-layer+ (length layers)))

(defun remaining-minutes-in-oven (&optional (time-adjustment :normal))
  (+ +default-cooking-time+
     (if (not time-adjustment)
       (- 0 +default-cooking-time+)
       (ecase time-adjustment
	 (:shorter -100)
	 (:very-short -200)
	 (:longer 100)
	 (:very-long 200)
	 (:normal 0)))))

(defun split-leftovers
  (&key (weight nil weight-supplied-p) (human 10) (alien 10))
  (cond ((not weight-supplied-p) :just-split-it)
	((not weight) :looks-like-someone-was-hungry)
	(t (- weight human alien))))
