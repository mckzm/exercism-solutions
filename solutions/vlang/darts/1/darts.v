module main

fn score(x f64, y f64) int {
    r_squared := (x * x) + (y * y)

    if r_squared <= 1.0 { return 10 }
    if r_squared <= 25.0 { return 5 }
    if r_squared <= 100.0 { return 1 }
    return 0
}
