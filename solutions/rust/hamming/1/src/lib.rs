/// Return the Hamming distance between the strings,
/// or None if the lengths are mismatched.
pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    if s1.len() != s2.len() { return None }
    let mut dist: usize = 0;
    match s1 == s2 {
        true => (),
        false => {
            let iter_s1 = s1.chars();
            let mut iter_s2 = s2.chars();
            for c in iter_s1 {
                if c != iter_s2.next().unwrap() { dist += 1 }
            }
        }
    }
    Some(dist)
}
