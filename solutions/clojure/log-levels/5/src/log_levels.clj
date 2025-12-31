(ns log-levels
  (:require [clojure.string :as str]))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [log-line]
  (str/trim (last (str/split log-line #":"))))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [log-line]
  (str/lower-case (last (re-find #"\[([A-Z]+)\]" log-line))))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [log-line]
  (let [new-log-format "%s (%s)"]
  (format new-log-format (message log-line) (log-level log-line))))
