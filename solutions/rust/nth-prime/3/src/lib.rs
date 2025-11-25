pub fn nth(n: u32) -> u32 {
    (2u32..).filter(|i| is_prime(*i)).nth(n as usize).unwrap()
}

fn is_prime(n: u32) -> bool {
    !(2..((n as f32).sqrt() as u32) + 1).any(|i| n % i == 0)
}
