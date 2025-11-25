use std::collections::{HashMap, HashSet};

pub fn anagrams_for<'a>(word: &str, candidates: &'a [&str]) -> HashSet<&'a str> {
    let to_char_map = |w: &str| {
        w.chars().fold(HashMap::new(), |mut acc, c| {
            *acc.entry(c).or_insert(0) += 1;
            acc
        })
    };
    let word = word.to_lowercase();
    let word_char_map = to_char_map(&word);

    candidates
        .iter()
        .filter(|w| {
            let w_lc = w.to_lowercase();
            word != w_lc && word_char_map == to_char_map(&w_lc)
        })
        .copied()
        .collect()
}
