module main

fn collatz(number int) !int {
    if number < 1 {
        return error('Invalid input: number must be a positive integer')
    }
    
    mut current := number
    mut count := 0
    for current > 1 {
        current = if current % 2 == 0 { current / 2 } else { current * 3 + 1}
        count++
    }
    
    return count
}
