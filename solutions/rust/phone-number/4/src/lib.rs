pub fn number(user_number: &str) -> Option<String> {
    let num = user_number
        .chars()
        .filter(char::is_ascii_digit)
        .skip_while(|&c| c == '1')
        .collect::<String>();

    if num.len() != 10 {
        return None;
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
