extern crate unicode_segmentation;

use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    let mut esrever = String::new();
    for cluster in input.graphemes(true).rev() {
        esrever.push_str(cluster)
    }
    esrever
}
