pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 {
        None
    } else if n == 1 {
        Some(0)
    } else {
        collatz_rec(n, 0)
    }
}

fn collatz_rec(n: u64, steps: u64) -> Option<u64> {
    if n == 1 {
        Some(steps)
    } else {
        match n % 2 {
            0 => collatz_rec(n / 2, steps + 1),
            _ => match n.overflowing_mul(3) {
                (res, false) => {
                    if res == u64::MAX {
                        None
                    } else {
                        collatz_rec(res + 1, steps + 1)
                    }
                }
                (_, true) => None,
            },
        }
    }
}
