(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string) (subseq log-string 8))

(defun log-level (log-string) (string-downcase (subseq log-string 1 5)))

(defun log-severity (log-string)
    (cond ((string-equal (log-level log-string) "info") :everything-ok)
    ((string-equal (log-level log-string) "warn") :getting-worried)
    ((string-equal (log-level log-string) "ohno") :run-for-cover)
    (t (error "Illegal log level"))))

(defun log-format (log-string)
  (ecase (log-severity log-string)
    (:everything-ok (string-downcase (log-message log-string)))
    (:getting-worried (string-capitalize (log-message log-string)))
    (:run-for-cover (string-upcase (log-message log-string)))))
