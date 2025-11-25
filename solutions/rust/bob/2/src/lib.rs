fn is_yelling(msg: &str) -> bool {
    msg.chars().any(|c| c.is_alphabetic())
        && msg
            .chars()
            .filter(|c| c.is_alphabetic())
            .all(|c| c.is_uppercase())
}

pub fn reply(message: &str) -> &str {
    let message = message.trim();

    if message.is_empty() {
        "Fine. Be that way!"
    } else if message.ends_with('?') {
        if is_yelling(message) {
            "Calm down, I know what I'm doing!"
        } else {
            "Sure."
        }
    } else if is_yelling(message) {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}
