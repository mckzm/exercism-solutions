(ns coordinate-transformation)

(defn translate2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (fn [x y] (vector (+ x dx) (+ y dy))))

(defn scale2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (fn [x y] (vector (* x sx) (* y sy))))

(defn compose-transform
  "Create a composition function that returns a function that 
   combines two functions to perform a repeatable transformation."
  [f g]
  (fn [x y] (let [res-f (f x y)] (g (get res-f 0) (get res-f 1)))))

(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [memo (atom [[] []])] (fn [x y] (if (and (= x (get (get @memo 0) 0)) (= y (get (get @memo 0) 1))) (get @memo 1) (get (reset! memo [[x y] (f x y)]) 1)))))
