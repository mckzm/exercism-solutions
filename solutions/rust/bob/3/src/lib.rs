// <https://exercism.org/tracks/rust/exercises/bob/solutions/emsifa> w/ minor mods
pub fn reply(message: &str) -> &str {
    let message = message.trim();

    let is_empty = message.is_empty();
    let is_alphabetic = message.chars().any(char::is_alphabetic);
    let is_all_caps = is_alphabetic && message.to_uppercase().as_str() == message;
    let is_question = message.ends_with('?');

    match (is_empty, is_all_caps, is_question) {
        (true, _, _) => "Fine. Be that way!",
        (_, true, true) => "Calm down, I know what I'm doing!",
        (_, true, false) => "Whoa, chill out!",
        (_, false, true) => "Sure.",
        _ => "Whatever.",
    }
}
