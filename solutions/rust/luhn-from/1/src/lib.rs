use std::fmt::Display;

pub struct Luhn<T: Display> {
    data: T,
}

impl<T: Display> Luhn<T> {
    pub fn is_valid(&self) -> bool {
        let code = self.data.to_string().replace(' ', "");
        if code.len() <= 1 || code.chars().any(|c| !c.is_ascii_digit()) {
            return false;
        }
        code.bytes()
            .enumerate()
            .map(|(i, c)| {
                let a = (c - b'0') as u32;
                if i % 2 == code.len() % 2 {
                    match a {
                        0 | 9 => a,
                        1..=4 => a * 2,
                        _ => (a * 2) - 9,
                    }
                } else {
                    a
                }
            })
            .sum::<u32>()
            % 10
            == 0
    }
}

impl<T: Display> From<T> for Luhn<T> {
    fn from(input: T) -> Self {
        Self { data: input }
    }
}
