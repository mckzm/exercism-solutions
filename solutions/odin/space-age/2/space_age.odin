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

@rodata
ORBITAL_PERIODS := [Planet]f64{
	.Mercury = 0.2408467 * EARTH_YEAR_IN_SECONDS,
	.Venus   = 0.61519726 * EARTH_YEAR_IN_SECONDS,
	.Earth   = 1.0 * EARTH_YEAR_IN_SECONDS,
	.Mars    = 1.8808158 * EARTH_YEAR_IN_SECONDS,
	.Jupiter = 11.862615 * EARTH_YEAR_IN_SECONDS,
	.Saturn  = 29.447498 * EARTH_YEAR_IN_SECONDS,
	.Uranus  = 84.016846 * EARTH_YEAR_IN_SECONDS,
	.Neptune = 164.79132 * EARTH_YEAR_IN_SECONDS,
}

EARTH_YEAR_IN_SECONDS :f64: 31557600

age :: proc(planet: Planet, seconds: int) -> f64 {
    return f64(seconds) / ORBITAL_PERIODS[planet]
}
