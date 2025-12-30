(ns cars-assemble)

(def ^:private base-rate 221)
(def ^:private minutes-per-hour 60)

(defn- success-rate
  [speed]
  (condp <= speed
    10 0.77
     9 0.8
     5 0.9
       1.0)
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
