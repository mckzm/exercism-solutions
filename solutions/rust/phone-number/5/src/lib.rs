pub fn number(user_number: &str) -> Option<String> {
    let num: Vec<_> = user_number
        .chars()
        .filter(char::is_ascii_digit)
        .skip_while(|&c| c == '1')
        .collect();

    (!(num.len() != 10 || num[0] < '2' || num[3] < '2')).then_some(num.iter().collect())
}
