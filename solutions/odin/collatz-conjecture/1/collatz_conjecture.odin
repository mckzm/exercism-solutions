package collatz_conjecture

steps :: proc(start: int) -> (result: int, ok: bool) {
	if start < 1 do return result, false

    i: int = start
    for i != 1 {
        result += 1
        if i % 2 == 0 { i /= 2; continue }
        i = 3 * i + 1
    }

    return result, true
}
