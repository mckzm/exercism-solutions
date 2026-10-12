package collatz_conjecture

steps :: proc(start: int) -> (result: int, ok: bool) {
    i := start
    for i > 1 {
        if i % 2 != 0 { 
            i = (3 * i + 1) / 2
            result += 2
        } else {
            i /= 2
            result += 1
        }
    }

    return result, i == 1
}
