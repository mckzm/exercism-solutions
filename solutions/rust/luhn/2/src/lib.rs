/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let code = code.replace(' ', "");
    if code.len() <= 1 || code.chars().any(|c| !c.is_ascii_digit()) {
        return false;
    }
    let mut v = code
        .split("")
        .filter(|s| !s.is_empty())
        .map(|s| s.parse::<u32>().unwrap())
        .collect::<Vec<_>>();
    for i in (0..(v.len() - 1)).rev().step_by(2) {
        let double = v[i] * 2;
        let j = match double {
            _ if double <= 9 => double,
            _ => double - 9,
        };
        v[i] = j;
    }
    v.iter().sum::<u32>() % 10 == 0
}
