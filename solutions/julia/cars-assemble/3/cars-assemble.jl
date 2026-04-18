const base_prod_rate = 221

function success_rate(speed)
    denom = if speed <= 0
        0
    elseif 1 <= speed <= 4
        100
    elseif 5 <= speed <= 8
        90
    elseif speed == 9
        80
    else
        77
    end

    return denom / 100
end

production_rate_per_hour(speed) = base_prod_rate * speed * success_rate(speed)

working_items_per_minute(speed) = return Int(floor(production_rate_per_hour(speed) / 60))
