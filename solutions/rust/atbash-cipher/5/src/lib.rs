struct Atbash;

impl Atbash {
    pub fn encode_decode(s: &str) -> String {
        String::from_utf8(
            s.to_ascii_lowercase()
                .split_ascii_whitespace()
                .flat_map(|s| {
                    s.bytes()
                        .filter(|b| b.is_ascii_alphanumeric())
                        .map(|b| match b {
                            b'0'..=b'9' => b,
                            _ => b'z' - b + b'a',
                        })
                })
                .collect::<Vec<u8>>(),
        )
        .unwrap()
    }
}

/// "Encipher" with the Atbash cipher.
pub fn encode(plain: &str) -> String {
    Atbash::encode_decode(plain)
        .chars()
        .enumerate()
        .fold(String::new(), |mut acc, (i, c)| {
            acc.push(c);
            if i % 5 == 4 {
                acc.push(' ')
            };
            acc
        })
        .trim_end()
        .to_string()
}

/// "Decipher" with the Atbash cipher.
pub fn decode(cipher: &str) -> String {
    Atbash::encode_decode(cipher)
}
