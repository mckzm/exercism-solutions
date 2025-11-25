// Commenting out the code below as Exercism's remote tests blow up on account
// of not being able to find the `unicode_segmentation` crate.
// Otherwise this would be my submission - passes all 8 tests locally, incl.
// that for the `graphemes` feature.
//
//extern crate unicode_segmentation;
//
//use unicode_segmentation::UnicodeSegmentation;
//
//pub fn reverse(input: &str) -> String {
//    let mut esrever = String::new();
//    for cluster in input.graphemes(true).rev() {
//        esrever.push_str(cluster)
//    }
//    esrever
//}

// Short and easy but space-hungry.
pub fn reverse(input: &str) -> String {
    let mut esrever = String::new();
    for c in input.chars().rev() {
        esrever.push(c.clone());
    }
    esrever
}
