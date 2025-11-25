/// Determines whether the supplied string is a valid ISBN number
pub fn is_valid_isbn(isbn: &str) -> bool {
    let digits: Vec<u32> = isbn
        .chars()
        .enumerate()
        .filter_map(|(i, c)| match i == isbn.len() - 1 {
            true => {
                if c.is_ascii_digit() || c == 'X' {
                    if c == 'X' {
                        Some(10)
                    } else {
                        c.to_digit(10)
                    }
                } else {
                    None
                }
            }
            false => {
                if c.is_ascii_digit() {
                    c.to_digit(10)
                } else {
                    None
                }
            }
        })
        .collect();
    if digits.len() != 10 {
        return false;
    }
    (1..=10)
        .rev()
        .zip(digits)
        .fold(0, |acc, (i, d)| i * d + acc)
        % 11
        == 0
}
