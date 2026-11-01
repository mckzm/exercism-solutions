module CarsAssemble

let baseProductionRate = 221 // cars per hour

let successRate (speed: int): float =
    match speed with
    | 0 -> 0.0
    | s when s >= 1 && s <= 4 -> 1.0
    | s when s >= 5 && s <= 8 -> 0.9
    | 9 -> 0.8
    | 10 -> 0.77
    | _ -> failwith "Speed must be between 0 and 10!"

let productionRatePerHour (speed: int): float =
    float(baseProductionRate * speed) * successRate speed

let workingItemsPerMinute (speed: int): int =
    int(productionRatePerHour speed) / 60
