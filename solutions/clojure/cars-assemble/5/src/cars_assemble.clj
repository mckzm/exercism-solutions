(ns cars-assemble)

(def base-rate 221)
(def minutes-per-hour 60)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (cond (= 10 speed) (* base-rate speed 0.77)
        (= 9 speed) (* base-rate speed 0.8)
        (< 4 speed) (* base-rate speed 0.9)
        :else (* base-rate speed))
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) minutes-per-hour))
  )
