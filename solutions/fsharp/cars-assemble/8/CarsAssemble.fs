module CarsAssemble

let baseProductionRate = 221 // cars per hour

let (|InRange|_|) (min: int, max: int) (value: int) : unit option =
    if value >= min && value <= max then Some() else None

let successRate (speed: int): float =
    match speed with
    | 0 -> 0.0
    | InRange (1, 4) -> 1.0
    | InRange (5, 8) -> 0.9
    | 9 -> 0.8
    | 10 -> 0.77
    | _ -> failwith (sprintf "<%i> is not between 0 and 10!" speed)

let productionRatePerHour (speed: int): float =
    float(baseProductionRate * speed) * successRate speed

let workingItemsPerMinute (speed: int): int =
    int(productionRatePerHour speed / 60.0)
