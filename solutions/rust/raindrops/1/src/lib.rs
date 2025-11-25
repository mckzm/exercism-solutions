pub fn raindrops(n: u32) -> String {
    let mut s = String::new();

    for factor in [3, 5, 7] {
        match n {
            n if n % 3 == 0 && factor == 3 => s.push_str("Pling"),
            n if n % 5 == 0 && factor == 5 => s.push_str("Plang"),
            n if n % 7 == 0 && factor == 7 => s.push_str("Plong"),
            _ => (),
        }
    }
    if s.is_empty() {
        n.to_string()
    } else {
        s
    }
}
