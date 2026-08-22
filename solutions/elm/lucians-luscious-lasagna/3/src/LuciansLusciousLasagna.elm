module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)

expectedMinutesInOven = 40
minutesPerLayer = 2

preparationTimeInMinutes layers = layers * minutesPerLayer
elapsedTimeInMinutes layers minutesInOven = 
    preparationTimeInMinutes layers + minutesInOven
