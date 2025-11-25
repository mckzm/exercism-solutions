pub fn egg_count(display_value: u32) -> usize {
    let mut count: usize = 0;
    for i in 0u32..32u32 {
        if 2u32.pow(i) & display_value != 0 {
            count += 1
        }
    }
    count
}
