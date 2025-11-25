#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

pub fn classify(num: u64) -> Option<Classification> {
    use Classification::*;
    (num > 0).then_some(
        match (1..=(num / 2)).filter(|n| num % n == 0).sum::<u64>() {
            sum if sum == num => Perfect,
            sum if sum < num => Deficient,
            _ => Abundant,
        },
    )
}
