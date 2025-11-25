use once_cell::sync::Lazy;
use rand::prelude::*;

const LC_ASCII: std::ops::RangeInclusive<u8> = b'a'..=b'z';
static LC_ASCII_START: u8 = *LC_ASCII.start();
static LC_ASCII_COUNT: Lazy<u8> = Lazy::new(|| LC_ASCII.count() as u8);

pub fn encode(key: &str, s: &str) -> Option<String> {
    if !is_valid(key) {
        return None;
    }

    Some(
        s.bytes()
            .zip(key.bytes().cycle())
            .map(|(b, k)| {
                (((b + k - 2 * LC_ASCII_START) % *LC_ASCII_COUNT) + LC_ASCII_START) as char
            })
            .collect(),
    )
}

pub fn decode(key: &str, s: &str) -> Option<String> {
    if !is_valid(key) {
        return None;
    }

    Some(
        s.bytes()
            .zip(key.bytes().cycle())
            .map(|(b, k)| {
                (((*LC_ASCII_COUNT + (b - LC_ASCII_START) - (k - LC_ASCII_START))
                    % *LC_ASCII_COUNT)
                    + LC_ASCII_START) as char
            })
            .collect(),
    )
}

pub fn encode_random(s: &str) -> (String, String) {
    let mut rng = thread_rng();
    let mut v: Vec<u8> = Vec::with_capacity(100);

    for _ in 0..v.capacity() {
        v.push(rng.gen_range(LC_ASCII));
    }

    let key = String::from_utf8(v).unwrap();
    let encoded = encode(&key, s).unwrap();

    (key, encoded)
}

fn is_valid(key: &str) -> bool {
    !(key.is_empty() || key.bytes().any(|b| !b.is_ascii_lowercase()))
}
