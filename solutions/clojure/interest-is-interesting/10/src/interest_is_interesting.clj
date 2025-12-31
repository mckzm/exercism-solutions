(ns interest-is-interesting)

(defn- percentage-to-decimal
  [num]
  (bigdec (* num 0.01M)))

(defn interest-rate
  "Returns the interest rate based on the specified balance."
  [balance]
  (condp <= balance
    5000.0M 2.475
    1000.0M 1.621
    0.0M    0.5
           -3.213))

(defn annual-balance-update
  "Returns the annual balance update, taking into account the interest rate."
  [balance]
  (* balance (+ 1.0M (abs (percentage-to-decimal (interest-rate balance))))))

(defn amount-to-donate
  "Returns how much money to donate based on the balance and the tax-free percentage."
  [balance tax-free-percentage]
  (if (pos? balance) (int (* balance 2.0M (percentage-to-decimal tax-free-percentage))) 0))
