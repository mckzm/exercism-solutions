use ::once_cell::sync::Lazy;
use std::collections::HashMap;

static SCORES: Lazy<HashMap<u8, u8>> = Lazy::new(|| {
    HashMap::from([
        (b'a', 1),
        (b'e', 1),
        (b'i', 1),
        (b'o', 1),
        (b'u', 1),
        (b'l', 1),
        (b'n', 1),
        (b'r', 1),
        (b's', 1),
        (b't', 1),
        (b'd', 2),
        (b'g', 2),
        (b'b', 3),
        (b'c', 3),
        (b'm', 3),
        (b'p', 3),
        (b'f', 4),
        (b'h', 4),
        (b'v', 4),
        (b'w', 4),
        (b'y', 4),
        (b'k', 5),
        (b'j', 8),
        (b'x', 8),
        (b'q', 10),
        (b'z', 10),
    ])
});

pub fn score(word: &str) -> u64 {
    word.to_ascii_lowercase()
        .bytes()
        .map(|b| SCORES.get(&b).copied().unwrap_or(0) as u64)
        .sum()
}
