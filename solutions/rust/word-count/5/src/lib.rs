use std::collections::HashMap;

const APOSTROPHE: char = '\'';

pub fn word_count(words: &str) -> HashMap<String, u32> {
    words
        .split(|c: char| !c.is_alphanumeric() && c != APOSTROPHE)
        .map(|s| s.trim_matches(APOSTROPHE))
        .filter(|s| !s.is_empty())
        .fold(HashMap::new(), |mut hm, w| {
            *hm.entry(w.to_ascii_lowercase()).or_insert(0) += 1;
            hm
        })
}
