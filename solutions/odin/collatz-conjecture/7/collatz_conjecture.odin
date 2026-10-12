package collatz_conjecture

steps :: proc(start: int) -> (result: int, ok: bool) {
    current := start
    
    for current > 1 {
        if current & 1 == 1 { 
            current = (3 * current + 1) >> 1
            result += 2
        } else {
            current >>= 1
            result += 1
        }
    }

    return result, current == 1
}
