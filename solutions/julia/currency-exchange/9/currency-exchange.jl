exchange_money = /
get_change = -
get_value_of_bills = *
get_number_of_bills = ÷
get_leftover_of_bills = %

function exchangeable_value(budget, exchange_rate, spread, denomination)
    return (budget / (exchange_rate * (1 + spread * 0.01)) ÷ denomination) * denomination
end
