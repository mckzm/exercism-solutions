(ns interest-is-interesting)

(defn- percentage-to-decimal
  [num]
  (/ num 100))

(defn interest-rate
  "Returns the interest rate based on the specified balance."
  [balance]
  (double (condp <= balance
            5000.0M 2.475
            1000.0M 1.621
            0.0M    0.5
                   -3.213)))

(defn annual-balance-update
  "Returns the annual balance update, taking into account the interest rate."
  [balance]
  (* balance (+ 1 (abs (percentage-to-decimal (bigdec (interest-rate balance)))))))

(defn amount-to-donate
  "Returns how much money to donate based on the balance and the tax-free percentage."
  [balance tax-free-percentage]
  (int (if (pos? balance) (* balance 2 (percentage-to-decimal tax-free-percentage)) 0)))
