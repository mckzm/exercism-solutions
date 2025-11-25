// (Mostly) Imperative Take One
pub fn encode(source: &str) -> String {
    let len = source.len();
    let mut ret = String::new();
    let mut prev: char = '\0';
    let mut count: u32 = 0;

    for (i, c) in source.chars().enumerate() {
        if c == prev {
            count += 1;
            if i != len - 1 {
                continue;
            }
        }
        if count > 1 {
            count.to_string().chars().for_each(|d| ret.push(d));
        }
        if prev != '\0' {
            ret.push(prev);
        }

        if i == len - 1 && c != prev {
            ret.push(c);
        } else {
            prev = c;
            count = 1;
        }
    }
    ret
}

pub fn decode(source: &str) -> String {
    let mut ret = String::new();
    let mut digits = String::new();

    for c in source.chars() {
        if c.is_ascii_digit() {
            digits.push(c);
            continue;
        } else if !digits.is_empty() {
            (0..digits.parse().unwrap()).for_each(|_| ret.push(c));
            digits.truncate(0);
        } else {
            ret.push(c);
        }
    }
    ret
}
