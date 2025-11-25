// This code is not my choice - that in lib.rs is - but Exercism's remote
// tests blow up on account of the not being able to find the
// unicode_segmentation crate :-(
pub fn reverse(input: &str) -> String {
    let mut esrever = String::new();
    for c in input.chars().rev() {
        esrever.push(c.clone());
    }
    esrever
}
