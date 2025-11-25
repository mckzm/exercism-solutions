pub fn series(digits: &str, len: usize) -> Vec<String> {
    let size = digits.len();
    if len == 0 {
        return vec!["".to_string(); size + 1];
    }

    let mut v = Vec::new();

    for (i, _) in digits.chars().enumerate() {
        let last = i + len;
        if last > size {
            break;
        }
        let substr = digits[i..i + len].to_string();
        v.push(substr);
    }
    v
}
