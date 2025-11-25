use std::collections::HashMap;

pub fn check(candidate: &str) -> bool {
    let mut char_freq: HashMap<char, u32> = HashMap::new();
    candidate
        .chars()
        .filter(|c| !(c.is_whitespace() || *c == '-'))
        .map(|c| c.to_ascii_lowercase())
        .all(|c| char_freq.insert(c, 1).is_none())
}
