use rand::prelude::*;

const MOD: u8 = 26;

pub fn encode(key: &str, s: &str) -> Option<String> {
    if key.is_empty() {
        return None;
    }

    let mut key = key.to_owned();
    while key.len() < s.len() {
        key = key.repeat(2);
    }

    s.bytes()
        .zip(key.bytes())
        .map(|(b, k)| match k.is_ascii_lowercase() {
            true => Some(((b - b'a' + k - b'a') % MOD + b'a') as char),
            false => None,
        })
        .collect()
}

pub fn decode(key: &str, s: &str) -> Option<String> {
    if key.bytes().any(|b| !b.is_ascii_lowercase()) {
        return None;
    }
    let key: String = key
        .bytes()
        .map(|b: u8| (((MOD - (b - b'a')) % MOD) + b'a') as char)
        .collect();
    encode(&key, s)
}

pub fn encode_random(s: &str) -> (String, String) {
    let mut rng = thread_rng();
    let mut v: Vec<u8> = Vec::with_capacity(100);
    for _ in 0..v.capacity() {
        v.push(rng.gen_range(b'a'..=b'z'));
    }
    let key = String::from_utf8(v).unwrap();
    (key.clone(), encode(&key, s).unwrap())
}
