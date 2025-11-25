use rand::{thread_rng, Rng};

pub fn private_key(p: u64) -> u64 {
    thread_rng().gen_range(2..p)
}

pub fn public_key(p: u64, g: u64, a: u64) -> u64 {
    modular_pow(g, a, p)
}

pub fn secret(p: u64, b_pub: u64, a: u64) -> u64 {
    modular_pow(b_pub, a, p)
}

fn modular_pow(b: u64, e: u64, m: u64) -> u64 {
    let (mut b, mut e, m) = (b as u128, e as u128, m as u128);
    let mut res = 1;
    b %= m;
    while e > 0 {
        if e % 2 == 1 {
            res = res * b % m;
        }
        e >>= 1;
        b = b * b % m;
    }
    res as u64
}
