pub fn abbreviate(phrase: &str) -> String {
    phrase
        .split(|c: char| c.is_whitespace() || c == '-')
        .fold(String::new(), |mut res, word| {
            word.chars()
                .filter(|c| c.is_ascii_alphabetic())
                .for_each(|c| {
                    let all_caps = word.chars().all(|c: char| c.is_ascii_uppercase());
                    if word.starts_with(c) || (c.is_ascii_uppercase() && !all_caps) {
                        res.push(c)
                    }
                });
            res
        })
        .to_ascii_uppercase()
}
