use std::collections::HashMap;
use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, candidates: &'a [&str]) -> HashSet<&'a str> {
    let to_char_map = |w: &str| {
        w.to_lowercase().chars().fold(HashMap::new(), |mut acc, c| {
            *acc.entry(c).or_insert(0) += 1;
            acc
        })
    };

    let word_char_map = to_char_map(word);
    candidates
        .iter()
        .filter(|w| {
            (word.to_lowercase() != w.to_lowercase())
                && to_char_map(w)
                    .iter()
                    .all(|(k, v)| word_char_map.get(k) == Some(v))
        })
        .copied()
        .collect()
}
