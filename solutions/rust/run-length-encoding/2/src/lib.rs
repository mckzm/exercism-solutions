pub fn encode(source: &str) -> String {
    let mut ret = String::new();
    let mut count = 0;
    let mut iter = source.chars().peekable();

    while let Some(c) = iter.next() {
        match iter.peek() {
            Some(n) if n == &c => {
                count += 1;
            }
            _ if count > 0 => {
                (count + 1).to_string().chars().for_each(|d| ret.push(d));
                ret.push(c);
                count = 0;
            }
            _ => {
                ret.push(c);
            }
        }
    }
    ret
}

pub fn decode(source: &str) -> String {
    source
        .chars()
        .fold(
            (String::new(), String::new()),
            |(mut ret, mut digits), c| {
                match c.is_ascii_digit() {
                    true => {
                        digits.push(c);
                    }
                    false => {
                        if !digits.is_empty() {
                            (0..digits.parse().unwrap()).for_each(|_| ret.push(c));
                            digits.truncate(0);
                        } else {
                            ret.push(c);
                        }
                    }
                }
                (ret, digits)
            },
        )
        .0
}
