use std::cmp::Ordering;

pub fn find<T: Ord, U: AsRef<[T]>>(array: U, key: T) -> Option<usize> {
    let (mut right_shift, mut slice) = (0, array.as_ref());
    while !slice.is_empty() {
        let mid = slice.len() / 2;
        match key.cmp(&slice[mid]) {
            Ordering::Equal => return Some(right_shift + mid),
            Ordering::Less => slice = &slice[..mid],
            Ordering::Greater => (right_shift, slice) = (right_shift + mid + 1, &slice[mid + 1..]),
        }
    }
    None
}
