package collatz_conjecture

steps :: proc(start: int) -> (result: int, ok: bool) {
	if start < 1 do return result, false

    i := start
    for i != 1 {
        if i % 2 != 0 { 
            i = (3 * i + 1) / 2
            result += 2
        } else {
            i /= 2
            result += 1
        }
    }

    return result, true
}
