pub trait Luhn {
    fn valid_luhn(&self) -> bool;
}

impl<T: std::fmt::Display> Luhn for T {
    fn valid_luhn(&self) -> bool {
        let code = self.to_string().replace(' ', "");
        if code.len() <= 1 || code.chars().any(|c| !c.is_ascii_digit()) {
            return false;
        }
        code.bytes()
            .enumerate()
            .map(|(i, c)| {
                let a: u32 = (c - b'0') as u32;
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
