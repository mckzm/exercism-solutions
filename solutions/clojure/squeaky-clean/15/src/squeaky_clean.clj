(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn- convert-whitespace-to-underscores
  [s]
  (str/replace s #"\s" "_"))

(defn- convert-control-characters-to-CTRL
  [s]
  (str/replace s #"\p{IsControl}" "CTRL"))

(defn- convert-kebab-case-to-camelCase
  [s]
  (str/replace s #"(-)(\p{IsLowercase})" #(str/upper-case (%1 2))))

(defn- keep-letters-and-underscores-only
  [s]
  (str/replace s #"[^\p{IsAlphabetic}_]" ""))

(defn- filter-out-lower-case-greek-letters
  [s]
  (str/replace s #"[α-ω]" ""))

(defn clean
  "Process input string to, in order:
   1) Replace any whitespace chars encountered with underscores
   2) Replace control characters with the upper case string `CTRL`
   3) Convert kebab-case to camelCase
   4) Omit characters that are not letters
   5) Omit Greek lowercase letters"
  [s]
  (-> s
      convert-whitespace-to-underscores
      convert-control-characters-to-CTRL
      convert-kebab-case-to-camelCase
      keep-letters-and-underscores-only
      filter-out-lower-case-greek-letters))
