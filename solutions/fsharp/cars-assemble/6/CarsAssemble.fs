module CarsAssemble

let baseProductionRate = 221 // cars per hour
let minutesPerHour = 60.0

let successRate (speed: int): float =
    if speed = 0 then 0.0
    elif speed >= 1 && speed <= 4 then 1.0
    elif speed >= 5 && speed <= 8 then 0.9
    elif speed = 9 then 0.8
    elif speed = 10 then 0.77
    else failwith (sprintf "<%i> is not between 0 and 10!" speed)

let productionRatePerHour (speed: int): float =
    float(baseProductionRate * speed) * successRate speed

let workingItemsPerMinute (speed: int): int =
    int(productionRatePerHour speed / minutesPerHour)
