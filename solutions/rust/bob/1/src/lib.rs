pub fn reply(message: &str) -> &str {
    let message = message.trim();

    if message.is_empty() {
        "Fine. Be that way!"
    } else if message.ends_with('?') {
        if message.chars().any(|c| c.is_alphabetic())
            && message
                .chars()
                .filter(|c| c.is_alphabetic())
                .all(|c| c.is_uppercase())
        {
            "Calm down, I know what I'm doing!"
        } else {
            "Sure."
        }
    } else if message.chars().any(|c| c.is_alphabetic())
        && message
            .chars()
            .filter(|c| c.is_alphabetic())
            .all(|c| c.is_uppercase())
    {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}
