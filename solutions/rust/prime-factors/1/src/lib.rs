pub fn factors(n: u64) -> Vec<u64> {
    let mut n = n;
    let mut factors: Vec<u64> = Vec::new();

    loop {
        match n {
            1 => break,
            _ => {
                for i in 2.. {
                    if n % i == 0 {
                        factors.push(i);
                        n = n / i;
                        break;
                    }
                }
            }
        }
    }
        factors
}
