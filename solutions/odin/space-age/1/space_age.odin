package space_age

Planet :: enum {
	Mercury,
	Venus,
	Earth,
	Mars,
	Jupiter,
	Saturn,
	Uranus,
	Neptune,
}

EARTH_YEAR_IN_SECONDS :f64: 31557600

age :: proc(planet: Planet, seconds: int) -> f64 {
    seconds := f64(seconds)
    years: f64
    
	switch planet {
        case .Mercury:
            years = seconds / (0.2408467 * EARTH_YEAR_IN_SECONDS)
        case .Venus:
            years = seconds / (0.61519726 * EARTH_YEAR_IN_SECONDS)
        case .Earth:
            years = seconds / (EARTH_YEAR_IN_SECONDS)
        case .Mars:
            years = seconds / (1.8808158 * EARTH_YEAR_IN_SECONDS)
        case .Jupiter:
            years = seconds / (11.862615 * EARTH_YEAR_IN_SECONDS)
        case .Saturn:
            years = seconds / (29.447498 * EARTH_YEAR_IN_SECONDS)
        case .Uranus:
            years = seconds / (84.016846 * EARTH_YEAR_IN_SECONDS)
        case .Neptune:
            years = seconds / (164.79132 * EARTH_YEAR_IN_SECONDS)
    }

    return years
}
