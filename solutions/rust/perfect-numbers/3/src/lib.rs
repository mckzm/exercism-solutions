#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

pub fn classify(num: u64) -> Option<Classification> {
    use Classification::*;
    if num == 0 {
        None
    } else {
        match (1..=(num / 2)).filter(|n| num % n == 0).sum::<u64>() {
            sum if sum == num => Some(Perfect),
            sum if sum < num => Some(Deficient),
            _ => Some(Abundant),
        }
    }
}
