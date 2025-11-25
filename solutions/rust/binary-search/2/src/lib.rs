use std::cmp::Ordering;

pub fn find<T: Ord, U: AsRef<[T]>>(array: U, key: T) -> Option<usize> {
    let slice = array.as_ref();
    acc(slice, key, slice.len() / 2, 0)
}

fn acc<T: Ord>(slice: &[T], key: T, mid: usize, offset: usize) -> Option<usize> {
    match key.cmp(slice.get(mid)?) {
        Ordering::Equal => Some(mid + offset),
        Ordering::Less => {
            let slice = &slice[0..mid];
            acc(slice, key, slice.len() / 2, offset)
        }
        Ordering::Greater => {
            let slice = &slice[(mid + 1)..];
            acc(slice, key, slice.len() / 2, offset + mid + 1)
        }
    }
}
