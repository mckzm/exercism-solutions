(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defun log-message (log-string) (subseq log-string 8))

(defun log-severity (log-string)
  (let ((log-level (string-downcase (subseq log-string 1 5))))
    (cond
      ((string= log-level "info") :everything-ok)
      ((string= log-level "warn") :getting-worried)
      ((string= log-level "ohno") :run-for-cover)
      (t (error (format nil "Illegal log level: ~A" log-level))))))

(defun log-format (log-string)
  (ecase (log-severity log-string)
    (:everything-ok (string-downcase (log-message log-string)))
    (:getting-worried (string-capitalize (log-message log-string)))
    (:run-for-cover (string-upcase (log-message log-string)))))
