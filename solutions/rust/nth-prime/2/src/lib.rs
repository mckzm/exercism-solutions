pub fn nth(n: u32) -> u32 {
    (2u32..).filter(|i| is_prime(*i)).nth(n as usize).unwrap()
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
