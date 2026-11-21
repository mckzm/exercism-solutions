package armstrong_numbers

is_armstrong_number :: proc(n: u128) -> bool {
    BASE :: 10

    if n == 0 {
        return true
    }

    n_len: u8
    x := n
    for x > 0 {
        x /= BASE
        n_len += 1
    }

    sum: u128
    x = n
    for x > 0 {
        digit := x % BASE
        x /= BASE

        acc: u128 = 1
        for _ in 1..=n_len {
            acc *= digit
        }

        sum += acc
        if sum > n {
            return false
        }
    }

    return sum == n
}
