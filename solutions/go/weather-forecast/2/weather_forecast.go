// Package weather provides tools to forecast the current weather
// condition of various cities in Goblinicus.
package weather

var (
    // CurrentCondition represents the current weather condition for
    // the city specified by CurrentLocation.
	CurrentCondition string
    // CurrentLocation represents the current city for which the weather
    // is being forecast.
	CurrentLocation  string
)

// Forecast takes the string representations of a city and a current weather
// condition, and return a string representation of the forecast for that
// city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
