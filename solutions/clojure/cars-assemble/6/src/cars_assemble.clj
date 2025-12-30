(ns cars-assemble)

(def base-rate 221)
(def minutes-per-hour 60)

(defn success-rate
  [speed]
  (cond (= 10 speed) 0.77
        (= 9 speed) 0.8
        (< 4 speed) 0.9
        :else 1.0)
  )

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (* base-rate speed (success-rate speed))
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) minutes-per-hour))
  )
