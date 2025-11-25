use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let mut chars_seen: HashSet<char> = HashSet::new();
    candidate
        .to_lowercase()
        .chars()
        .filter(|c| !(c.is_whitespace() || *c == '-'))
        .all(|c| chars_seen.insert(c))
}
