const ASCII_A: u8 = 97;
const ASCII_Z: u8 = 122;
const ASCII_0: u8 = 48;
const ASCII_9: u8 = 57;
const MODULUS: u8 = 25;

struct Atbash;

impl Atbash {
    pub fn encode_decode(s: &str) -> String {
        String::from_utf8(
            s.to_ascii_lowercase()
                .split_ascii_whitespace()
                .flat_map(|s| {
                    s.bytes()
                        .filter(|b| {
                            (*b >= ASCII_A && *b <= ASCII_Z) || (*b >= ASCII_0 && *b <= ASCII_9)
                        })
                        .map(|b| match b {
                            ASCII_0..=ASCII_9 => b,
                            _ => b.abs_diff(ASCII_A + MODULUS) + ASCII_A,
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
