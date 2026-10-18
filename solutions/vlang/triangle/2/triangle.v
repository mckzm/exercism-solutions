module main

fn is_isosceles(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && (a == b || b == c || a == c)
}

fn is_equilateral(a f64, b f64, c f64) bool {
	return is_isosceles(a, b, c) && (a == b || b == c)
}

fn is_scalene(a f64, b f64, c f64) bool {
	return is_triangle(a, b, c) && !is_isosceles(a, b, c)
}

fn is_triangle(a f64, b f64, c f64) bool {
	if a == 0 || b == 0 || c == 0 { return false }
	return a + b >= c && b + c >= a && a + c >= b
}
