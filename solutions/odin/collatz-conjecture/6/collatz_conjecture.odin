package collatz_conjecture

steps :: proc(start: int) -> (result: int, ok: bool) {
    i := start
    
    for i > 1 {
        if i & 1 == 1 { 
            i = (3 * i + 1) >> 1
            result += 2
        } else {
            i >>= 1
            result += 1
        }
    }

    return result, i == 1
}
