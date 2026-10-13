module main

fn collatz(number int) !int {
    if number < 1 {
        return error('Invalid input: number must be a positive integer')
    }
    
    mut current := number
    mut count := 0
    for current > 1 {
        if current & 1 == 0 {
            current /= 2
            count++
        } else { 
            current = (current * 3 + 1) / 2
            count +=2
        }
    }
    
    return count
}
