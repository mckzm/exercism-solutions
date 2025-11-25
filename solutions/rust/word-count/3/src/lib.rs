use std::collections::HashMap;

const APOSTROPHE: char = '\'';

pub fn word_count(words: &str) -> HashMap<String, u32> {
    words
        .to_ascii_lowercase()
        .split(|c: char| !c.is_alphanumeric() && c != APOSTROPHE)
        .map(|s| s.trim_matches(APOSTROPHE))
        .filter(|s| !s.is_empty())
        .fold(HashMap::new(), |mut hm, w| {
            hm.entry(w.to_string())
                .and_modify(|count| *count += 1)
                .or_insert(1);
            hm
        })
}
