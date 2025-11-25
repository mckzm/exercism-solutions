pub fn abbreviate(phrase: &str) -> String {
    phrase
        .split(|c: char| c.is_whitespace() || c == '-' || c == '_')
        .flat_map(|word| {
            word.chars().filter(|c| {
                c.is_ascii_alphabetic()
                    && (word.starts_with(*c)
                        || (c.is_ascii_uppercase()
                            && !word.chars().all(|c: char| c.is_ascii_uppercase())))
            })
        })
        .collect::<String>()
        .to_ascii_uppercase()
}
