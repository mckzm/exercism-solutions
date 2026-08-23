module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers minutesInOven =
    let
        expectedMinutesInOven =
            40

        minutesPerLayer =
            2

        preparationTimeInMinutes =
            layers * minutesPerLayer
    in
    preparationTimeInMinutes + expectedMinutesInOven - minutesInOven
