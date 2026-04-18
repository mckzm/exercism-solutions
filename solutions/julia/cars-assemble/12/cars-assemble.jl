const base_prod_rate = 221

function success_rate(speed)
    return if speed ≤ 0
        0.00
    elseif speed ≤ 4
        1.00
    elseif speed ≤ 8
        0.90
    elseif speed == 9
        0.80
    else
        0.77
    end
end

production_rate_per_hour(speed) = base_prod_rate * speed * success_rate(speed)

working_items_per_minute(speed) = Int(production_rate_per_hour(speed) ÷ 60)
