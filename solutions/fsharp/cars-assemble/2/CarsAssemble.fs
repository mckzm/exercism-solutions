module CarsAssemble

let baseProductionRate = 221 // cars per hour

let successRate (speed: int): float =
    match speed with
    | s when s <= 0 -> 0.0
    | s when s <= 4 -> 1.0
    | s when s <= 8 -> 0.9
    | 9 -> 0.8
    | _ -> 0.77

let productionRatePerHour (speed: int): float =
    float(baseProductionRate * speed) * successRate speed

let workingItemsPerMinute (speed: int): int =
    int(productionRatePerHour speed) / 60
