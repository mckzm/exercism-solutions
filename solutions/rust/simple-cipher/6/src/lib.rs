use rand::prelude::*;

const LC_ASCII: std::ops::RangeInclusive<u8> = b'a'..=b'z';

pub fn encode(key: &str, s: &str) -> Option<String> {
    if !is_valid(key) {
        return None;
    }

    Some(
        s.bytes()
            .zip(key.bytes().cycle())
            .map(|(b, k)| {
                (((b + k - 2 * LC_ASCII.start()) % LC_ASCII.count() as u8) + LC_ASCII.start())
                    as char
            })
            .collect(),
    )
}

pub fn decode(key: &str, s: &str) -> Option<String> {
    if !is_valid(key) {
        return None;
    }

    let key: String = key
        .bytes()
        .map(|b: u8| {
            (((LC_ASCII.count() as u8 - (b - LC_ASCII.start())) % LC_ASCII.count() as u8)
                + LC_ASCII.start()) as char
        })
        .collect();

    encode(&key, s)
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
