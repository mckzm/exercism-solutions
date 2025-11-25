use Comparison::*;

#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first: &[T], second: &[T]) -> Comparison {
    if first.len() == second.len() && first.iter().zip(second.iter()).all(|(a, b)| a == b) {
        return Equal;
    }
    if first.len() > second.len() && is_sublist(second, first) {
        return Superlist;
    }
    if first.len() < second.len() && is_sublist(first, second) {
        return Sublist;
    }
    Unequal
}

pub fn is_sublist<T: PartialEq>(smaller: &[T], bigger: &[T]) -> bool {
    if smaller.is_empty() {
        return true;
    }
    if !smaller.iter().all(|e| bigger.contains(e)) {
        return false;
    }
    let candidates = smaller
        .iter()
        .flat_map(|e| {
            bigger
                .iter()
                .enumerate()
                .filter_map(|(i, x)| if *x == *e { Some(i) } else { None })
        })
        .collect::<Vec<usize>>();
    candidates.iter().any(|e| {
        let sub = &bigger[*e..];
        sub.len() >= smaller.len() && sub.iter().zip(smaller.iter()).all(|(e1, e2)| e1 == e2)
    })
}
