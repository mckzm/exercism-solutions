module main

fn collatz(number int) !int {
    mut current := number
    mut count := 0
    for current > 1 {
        current = if current % 2 == 0 { current / 2 } else { current * 3 + 1}
        count++
    }
    if current == 1 { return count } else { return error('Invalid input')}
}
