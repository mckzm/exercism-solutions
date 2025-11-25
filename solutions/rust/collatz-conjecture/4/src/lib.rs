pub fn collatz(n: u64) -> Option<u64> {
    match n {
        0 => None,
        _ => collatz_rec(n, 0),
    }
}

fn collatz_rec(n: u64, steps: u64) -> Option<u64> {
    match n {
        1 => Some(steps),
        _even if n % 2 == 0 => collatz_rec(n / 2, steps + 1),
        _ => collatz_rec(n.checked_mul(3)?.checked_add(1)?, steps + 1),
    }
}
