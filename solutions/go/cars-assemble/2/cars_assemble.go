// Package cars provides tools to analyze the production in a car factory.
package cars

const (
    percent float64 = 100.0
    minutesPerHour int = 60
    costForSingleCar uint = 10000
    costForSetOfTenCars uint = 95000
)

// CalculateWorkingCarsPerHour calculates how many working cars are
// produced by the assembly line every hour.
func CalculateWorkingCarsPerHour(productionRate int, successRate float64) float64 {
	return float64(productionRate) * successRate / percent
}

// CalculateWorkingCarsPerMinute calculates how many working cars are
// produced by the assembly line every minute.
func CalculateWorkingCarsPerMinute(productionRate int, successRate float64) int {
	return int(CalculateWorkingCarsPerHour(productionRate, successRate)) / minutesPerHour
}

// CalculateCost works out the cost of producing the given number of cars.
func CalculateCost(carsCount int) uint {
	return uint((carsCount / 10)) * costForSetOfTenCars + uint((carsCount % 10)) * costForSingleCar
}
