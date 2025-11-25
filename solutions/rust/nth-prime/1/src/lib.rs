pub fn nth(n: u32) -> u32 {
    let mut primes_seen: u32 = 0;
    let mut i = 2;

    loop {
        if is_prime(i) {
            if primes_seen == n {
                return i;
            }
            primes_seen += 1;
        }
        i += 1;
    }
}

fn is_prime(n: u32) -> bool {
    match n {
        0 | 1 => false,
        2 => true,
        _ => {
            for i in 2..n {
                if n % i == 0 {
                    return false;
                }
            }
            true
        }
    }
}
