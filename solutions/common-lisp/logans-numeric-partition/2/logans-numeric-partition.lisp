(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

(defun categorize-number (odd-even-pair num)
  (destructuring-bind (odds . evens) odd-even-pair
  (if (oddp num) (cons (cons num odds) evens)
    (cons odds (cons num evens)))))

(defun partition-numbers (num-list)
  (reduce #'categorize-number num-list :initial-value '(() . ())))
