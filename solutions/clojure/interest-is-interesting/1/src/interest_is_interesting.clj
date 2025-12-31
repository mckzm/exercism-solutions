(ns interest-is-interesting)

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
  (* balance (+ 1 (abs (/ (bigdec (interest-rate balance)) 100)))))

(defn amount-to-donate
  "Returns how much money to donate based on the balance and the tax-free percentage."
  [balance tax-free-percentage]
  (int (if (> balance 0) (* balance 2 (/ tax-free-percentage 100)) 0)))
