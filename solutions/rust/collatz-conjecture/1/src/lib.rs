pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 {
        return None;
    }

    let mut n = n;
    let mut steps = 0;

    loop {
        if n == 1 {
            return Some(steps);
        }

        n = match n % 2 {
            0 => n / 2,
            _ => match n.overflowing_mul(3) {
                (res, false) => {
                    if res == u64::MAX {
                        return None;
                    } else {
                        res + 1
                    }
                }
                (_, true) => return None,
            },
        };

        // Making the foolish assumption steps will never overflow before n does
        steps += 1;
    }
}
