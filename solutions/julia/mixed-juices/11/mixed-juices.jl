const MIXING_TIMES = Dict(
    "Pure Strawberry Joy" => 0.5,
    "Energizer" => 1.5,
    "Green Garden" => 1.5,
    "Tropical Island" => 3.0,
    "All or Nothing" => 5.0,
)
const DEFAULT_MIXING_TIMES = 2.5

function time_to_mix_juice(juice)
    return get(MIXING_TIMES, juice, DEFAULT_MIXING_TIMES)
end

function wedges_from_lime(size)
    return get(Dict(
                    "small" => 6,
                    "medium" => 8,
                    "large" => 10,
                   ), size, 0)
end

function limes_to_cut(needed, limes)
    needed == 0 && return 0

    cut_limes = findfirst(>=(needed), cumsum(wedges_from_lime.(limes)))
    return cut_limes == nothing ? length(limes) : cut_limes
end

order_times(orders) = time_to_mix_juice.(orders)

function remaining_orders(time_left, orders)
     orders[[0; cumsum(order_times(orders))[1:end-1]] .>= time_left]
end
