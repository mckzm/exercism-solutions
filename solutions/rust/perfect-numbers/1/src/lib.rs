#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

pub fn classify(num: u64) -> Option<Classification> {
    use Classification::*;
    if num == 0 {
        return None;
    }
    let res = match factors(num).iter().sum::<u64>() {
        sum if sum == num => Perfect,
        sum if sum < num => Deficient,
        _ => Abundant,
    };
    Some(res)
}

pub fn factors(num: u64) -> Vec<u64> {
    (1..num).fold(Vec::new(), |mut v, n| {
        if num % n == 0 {
            v.push(n)
        };
        v
    })
}
