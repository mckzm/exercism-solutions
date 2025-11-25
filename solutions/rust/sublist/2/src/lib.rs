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
    if first.is_empty() {
        return Sublist;
    }
    if second.is_empty() {
        return Superlist;
    }
    stepwise_cmp(first, second)
}

fn stepwise_cmp<T: PartialEq>(first: &[T], second: &[T]) -> Comparison {
    for (i, e1) in first.iter().enumerate() {
        let e_sec = second.iter().position(|e| e == e1);
        match e_sec {
            Some(j) => {
                let candidate = &second[j..];
                if candidate.len() == 1 || i == first.len() - 1 {
                    continue;
                }
                if candidate[1] == first[i + 1] {
                    if second.iter().all(|e| first.contains(e)) {
                        return Superlist;
                    } else if first.iter().all(|e| second.contains(e)) {
                        return Sublist;
                    }
                }
            }
            None => continue,
        }
    }
    Unequal
}
