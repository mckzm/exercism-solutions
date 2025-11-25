use ::once_cell::sync::Lazy;
use std::collections::HashMap;

static SCORES: Lazy<HashMap<u8, u8>> = Lazy::new(|| {
    [
        ("A, E, I, O, U, L, N, R, S, T", 1),
        ("D, G", 2),
        ("B, C, M, P", 3),
        ("F, H, V, W, Y", 4),
        ("K", 5),
        ("J, X", 8),
        ("Q, Z", 10),
    ]
    .iter()
    .fold(
        HashMap::new(),
        |mut hm: HashMap<u8, u8>, (s, i): &(&str, u8)| {
            s.to_ascii_lowercase().bytes().for_each(|b| {
                hm.insert(b, *i);
            });
            hm
        },
    )
});

pub fn score(word: &str) -> u64 {
    word.to_ascii_lowercase()
        .bytes()
        .map(|b| SCORES.get(&b).copied().unwrap_or(0) as u64)
        .sum()
}
