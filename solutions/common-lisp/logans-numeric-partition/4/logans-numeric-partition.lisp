(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

(defun categorize-number (odds-and-evens-pair num)
  (destructuring-bind (odds . evens) odds-and-evens-pair
  (if (oddp num)
    (cons (cons num odds) evens)
    (cons odds (cons num evens)))))

(defun partition-numbers (num-list)
  (reduce #'categorize-number num-list :initial-value '(() . ())))
