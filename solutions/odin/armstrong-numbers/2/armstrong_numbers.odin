package armstrong_numbers

is_armstrong_number :: proc(n: u128) -> bool {
    digits := to_digits(n)
    n_len := u128(len(digits))
    sum: u128

    for digit in digits {
            acc: u128 = 1
            for i in 1..=n_len {
                acc *= digit
            }
            sum += acc
    }

    return sum == n
}

to_digits :: proc(n: u128) -> []u128 {
    BASE :: 10
    digits: [dynamic]u128
    
    if n == 0 {
        append(&digits, 0)
    } else {
        x := n
        for x > 0 {
            append(&digits, x % BASE)
            x /= BASE
        }
    }

    return digits[:]
}
