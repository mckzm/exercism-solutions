(ns log-levels
  (:require [clojure.string :as str]))

(defn- parse-log
  [log-line]
  (let [[level msg] (str/split log-line #":")]
    (-> level
        str/lower-case
        (str/replace #"[\[\]]" "")
        (vector (str/trim msg)))))

(def message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  (comp second parse-log))

(def log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  (comp first parse-log))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [log-line]
  (let [new-log-format "%s (%s)"]
    (apply format new-log-format (reverse (parse-log log-line)))))
