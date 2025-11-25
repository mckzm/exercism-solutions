pub fn square_of_sum(n: u32) -> u32 {
    match (1..=n).sum::<u32>().checked_pow(2) {
        Some(i) => i,
        None => panic!("square_of_sum({}): overflow", n),
    }
}

pub fn sum_of_squares(n: u32) -> u32 {
    (1..=n).fold(0, |acc, i| match i.checked_pow(2) {
        Some(sq) => sq + acc,
        None => panic!("square of {}: overflow", i),
    })
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
