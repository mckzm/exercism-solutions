module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers minutesInOven =
    let
        expectedMinutesInOven : Int
        expectedMinutesInOven =
            40

        preparationTimeInMinutes : Int
        preparationTimeInMinutes =
            layers * 2
    in
    preparationTimeInMinutes + expectedMinutesInOven - minutesInOven
