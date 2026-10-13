module main

fn collatz(number int) !int {
    mut current := number
    mut count := 0
    for current > 1 {
        if current & 1 != 0 {
            current = current * 3 + 1
            count++
        }
        current >>= 1
        count++
    }
    
    if current == 1 {
        return count
        } else {
            return error('Invalid input: number must be a positive integer')
        }
}
