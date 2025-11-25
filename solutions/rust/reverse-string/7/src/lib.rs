// Not using the unicode-segmentation crate as this causes
// Exercism's remote tests to fail.
pub fn reverse(input: &str) -> String {
    input.rsplit("").collect()
}
