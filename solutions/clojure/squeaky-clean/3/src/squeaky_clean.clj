(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn- convert-spaces-to-underscores
  [s]
  (str/replace s #"[\s]" "_"))

(defn- convert-ctrl-char-to-CTRL
  [s]
  (str/replace s #"[[\x00-\x1F\x7F-\x9F]]" "CTRL"))

(defn- convert-kebab-case-to-camelCase
  [s]
  (str/replace (str/replace s #"(?<=-)." str/upper-case) #"[-]" ""))

(defn- keep-letters-and-underscores-only
  [s]
  (str/replace s #"[^\p{IsAlphabetic}_]" ""))

(defn- filter-out-lower-case-greek-letters
  [s]
  (str/replace s #"[α-ω]" ""))

(defn clean
  "TODO: add docstring"
  [s]
  (-> s
      (convert-spaces-to-underscores)
      (convert-ctrl-char-to-CTRL)
      (convert-kebab-case-to-camelCase)
      (keep-letters-and-underscores-only)
      (filter-out-lower-case-greek-letters)))
