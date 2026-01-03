(ns coordinate-transformation)

(defn translate2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (fn [x y] (mapv + [dx dy] [x y])))

(defn scale2d 
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (fn [x y] (mapv * [sx sy] [x y])))

(defn compose-transform
  "Create a composition function that returns a function that 
   combines two functions to perform a repeatable transformation."
  [f g]
  #(apply g (f %1 %2)))

(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [previous-args (atom nil) previous-result (atom nil)]
    (fn [x y]
      (when (not= @previous-args [x y])
        (reset! previous-args [x y])
        (reset! previous-result (f x y)))
      @previous-result)))
