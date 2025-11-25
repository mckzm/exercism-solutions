/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
    use std::collections::HashSet;
    let alphabet = ('a'..='z').collect::<HashSet<char>>();
    let input_chars = sentence
        .chars()
        .map(|c| c.to_ascii_lowercase())
        .collect::<HashSet<char>>();
    alphabet.is_subset(&input_chars)
}
