(ns cars-assemble)

(def base-rate 221)
(def minutes-per-hour 60)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (cond (= speed 0) 0
        (and (<= 1 speed) (>= 4 speed)) (* base-rate speed)
        (and (<= 5 speed) (>= 8 speed)) (- (* base-rate speed) (* base-rate speed 0.1))
        (= 9 speed) (- (* base-rate speed) (* base-rate speed 0.2))
        (= 10 speed) (- (* base-rate speed) (* base-rate speed 0.23))
        )
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) minutes-per-hour))
  )
