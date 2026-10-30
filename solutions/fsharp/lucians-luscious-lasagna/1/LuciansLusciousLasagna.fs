module LuciansLusciousLasagna

// TODO: define the 'expectedMinutesInOven' binding
let expectedMinutesInOven: int = 40

// TODO: define the 'remainingMinutesInOven' function
let remainingMinutesInOven (minutesInOven: int): int =
    expectedMinutesInOven - minutesInOven

// TODO: define the 'preparationTimeInMinutes' function
let preparationTimeInMinutes(numberOfLayers: int): int =
    2 * numberOfLayers

// TODO: define the 'elapsedTimeInMinutes' function
let elapsedTimeInMinutes (numberOfLayers: int) (minutesInOven: int): int =
    preparationTimeInMinutes(numberOfLayers) + minutesInOven
