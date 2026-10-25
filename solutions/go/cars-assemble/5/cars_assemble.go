// Package cars provides tools to analyze the production in a car factory.
package cars

const (
    // percent is used to normalise car production rates per hundred.
    percent = 100.0
    // minutesPerHour is what it says on the tin.
    minutesPerHour = 60
    // costForSingleCar is the $ cost of producing a single car.
    costForSingleCar = 10000
    // costForSetOfCars is the reduced $ cost of producing a set of cars.
    costForSetOfCars = 95000
    // numberOfCarsPerSet is the number of cars that make up a set for cost
    // reduction purposes.
    numberOfCarsPerSet = 10
)

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return float64(productionRate) * successRate / percent
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
    carsPerHour := CalculateWorkingCarsPerHour(productionRate, successRate)
	return int(carsPerHour / minutesPerHour)
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
    costForSingles := uint(carsCount) % numberOfCarsPerSet * costForSingleCar
    costForSets :=  uint(carsCount) / numberOfCarsPerSet * costForSetOfCars
	return costForSingles + costForSets
}
