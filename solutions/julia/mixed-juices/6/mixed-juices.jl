function time_to_mix_juice(juice)
    return get(Dict(
                    "Pure Strawberry Joy" => 0.5,
                    "Energizer" => 1.5,
                    "Green Garden" => 1.5,
                    "Tropical Island" => 3.0,
                    "All or Nothing" => 5.0,
                   ), juice, 2.5)
end

function wedges_from_lime(size)
    size == "small" && return 6
    size == "medium" && return 8
    size == "large" && return 10
end

function limes_to_cut(needed, limes)
    limes_cut = 0

    while needed > 0
        length(limes) == 0 && break
        needed -= wedges_from_lime(popfirst!(limes))
        limes_cut += 1
    end

    return limes_cut
end

order_times(orders) = [time_to_mix_juice(order) for order in orders]

function remaining_orders(time_left, orders)
    while time_left > 0
        length(orders) == 0 && break
        time_left -= time_to_mix_juice(popfirst!(orders))
    end

    return orders
end
