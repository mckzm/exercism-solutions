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

pub fn factors(num: u64) -> Vec<u64> {
    (1..num).fold(Vec::new(), |mut v, n| {
        if num % n == 0 {
            v.push(n)
        };
        v
    })
}
