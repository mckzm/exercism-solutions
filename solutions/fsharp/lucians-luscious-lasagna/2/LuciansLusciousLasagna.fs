module LuciansLusciousLasagna

let expectedMinutesInOven: int = 40

let remainingMinutesInOven (minutesInOven: int): int =
    expectedMinutesInOven - minutesInOven

let preparationTimeInMinutes(numberOfLayers: int): int =
    2 * numberOfLayers

let elapsedTimeInMinutes (numberOfLayers: int) (minutesInOven: int): int =
    preparationTimeInMinutes(numberOfLayers) + minutesInOven
