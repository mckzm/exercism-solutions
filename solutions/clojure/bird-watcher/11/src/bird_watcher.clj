(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4]
  )

(def birds-in-busy-day
  5
  )

(defn today [birds]
  (peek birds)
  )

(defn inc-bird [birds]
  (conj (pop birds) (inc (today birds)))
  )

(defn day-without-birds? [birds]
  (some? (some zero? birds))
  )

(defn n-days-count [birds n]
  (reduce + (take n birds))
  )

(defn busy-days [birds]
  (count (filter #(<= birds-in-busy-day %) birds))
  )

(defn odd-week? [birds]
  (= birds [1 0 1 0 1 0 1])
  )
