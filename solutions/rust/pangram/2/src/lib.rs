/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
    use std::collections::HashSet;
    let alphabet = ('a'..='z').collect::<HashSet<char>>();
    let input_chars = sentence
        .to_lowercase()
        .chars()
        .filter(|c| c.is_ascii_alphabetic())
        .collect::<HashSet<char>>();
    alphabet.is_subset(&input_chars)
}
