pub fn egg_count(display_value: u32) -> usize {
    (0u32..32u32).fold(0, |acc, i| {
        acc + match (2u32.pow(i) & display_value) != 0 {
            true => 1,
            false => 0,
        }
    })
}
