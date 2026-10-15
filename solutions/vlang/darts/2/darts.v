module main

fn score(x f64, y f64) int {
    r_squared := (x * x) + (y * y)

    return match true {
        r_squared <=   1.0 { 10 }
        r_squared <=  25.0 {  5 }
        r_squared <= 100.0 {  1 }
        else               {  0 }
    }
}
