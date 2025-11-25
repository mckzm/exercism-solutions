pub fn number(user_number: &str) -> Option<String> {
    let mut num = user_number
        .chars()
        .filter(char::is_ascii_digit)
        .collect::<String>();
    match num.len() {
        11 if num.starts_with('1') => {
            num.remove(0);
        }
        10 => (),
        _ => return None,
    }
    num.chars()
        .enumerate()
        .map(|(i, c)| match c {
            '0'..='9' if i != 0 && i != 3 => Some(c),
            '2'..='9' if i == 0 || i == 3 => Some(c),
            _ => None,
        })
        .collect()
}
