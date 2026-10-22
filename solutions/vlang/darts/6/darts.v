module main

import math

struct Point {
    x f64
    y f64
}
fn (p Point) radius() f64 {
    return math.hypot(p.x, p.y)
}

struct Circle {
    r f64
    score int
}

struct Target { circles []Circle }
fn (t Target) score_throw(p Point) int {
    for circle in t.circles {
        if p.radius() <= circle.r { return circle.score }
    }

    return 0
}

fn score(x f64, y f64) int {
	p := Point { x, y }
    t := Target {
        [
            Circle { 1.0, 10 },
            Circle { 5.0, 5 },
            Circle { 10.0, 1 },
        ]
    }

	return t.score_throw(p)
}