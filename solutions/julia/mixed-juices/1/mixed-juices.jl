function time_to_mix_juice(juice)
    juice == "Pure Strawberry Joy" && return 0.5
    juice == "Energizer" && return 1.5
    juice == "Green Garden" && return 1.5
    juice == "Tropical Island" && return 3.0
    juice == "All or Nothing" && return 5.0
    return 2.5
end

function wedges_from_lime(size)
    size == "small" && return 6
    size == "medium" && return 8
    size == "large" && return 10
end

function limes_to_cut(needed, limes)
    wedges_cut = 0
    limes_cut = 0

    while wedges_cut < needed
        length(limes) == 0 && break
        wedges_cut += wedges_from_lime(popfirst!(limes))
        limes_cut += 1
    end

    return limes_cut
end

function order_times(orders)
    times = []

    for order in orders
        push!(times, time_to_mix_juice(order))
    end

    return times
end

function remaining_orders(time_left, orders)
    time_spent = 0

    while time_spent < time_left
        length(orders) == 0 && break
        time_spent += time_to_mix_juice(popfirst!(orders))
    end

    return orders
end
