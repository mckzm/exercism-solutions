(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

(defun categorize-number (odd-even-pair num)
  (if (oddp num) (cons (cons num (car odd-even-pair)) (cdr odd-even-pair))
    (cons (car odd-even-pair) (cons num (cdr odd-even-pair)))))

(defun partition-numbers (num-list)
  (reduce #'categorize-number num-list :initial-value '(() . ())))
