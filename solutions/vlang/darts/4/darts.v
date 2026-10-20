module main

import math

fn score(x f64, y f64) int {
	r := math.hypot(x, y)

	return match true {
		r <= 1.0 { 10 }
		r <= 5.0 { 5 }
		r <= 10.0 { 1 }
		else { 0 }
	}
}
