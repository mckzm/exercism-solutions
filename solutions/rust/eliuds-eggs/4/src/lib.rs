pub fn egg_count(display_value: u32) -> usize {
    (0..32).filter(|&i| (1 << i) & display_value != 0).count()
}
