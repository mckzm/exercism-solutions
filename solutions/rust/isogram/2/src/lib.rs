use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let mut chars_seen: HashSet<char> = HashSet::new();
    candidate
        .chars()
        .filter(|c| !(c.is_whitespace() || *c == '-'))
        .map(|c| c.to_ascii_lowercase())
        .all(|c| chars_seen.insert(c))
}
