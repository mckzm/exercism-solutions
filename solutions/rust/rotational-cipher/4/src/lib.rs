pub fn rotate(input: &str, key: u8) -> String {
    const MOD: u8 = 26;
    match key % MOD {
        0 => input.to_string(),
        key => String::from_utf8(
            input
                .bytes()
                .map(|b| match b {
                    b'A'..=b'Z' => (b - b'A' + key) % MOD + b'A',
                    b'a'..=b'z' => (b - b'a' + key) % MOD + b'a',
                    _ => b,
                })
                .collect::<Vec<u8>>(),
        )
        .unwrap(),
    }
}
