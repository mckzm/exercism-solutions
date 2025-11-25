pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut multiples: Vec<u32> = Vec::new();

    for factor in factors {
        for i in 1.. {
            let multiple = factor * i;
            match multiple {
                0 => {
                    multiples.push(multiple);
                    break;
                }
                multiple if multiple < limit => multiples.push(multiple),
                _ => break,
            }
        }
    }

    if multiples.is_empty() {
        0
    } else {
        multiples.sort();
        multiples.dedup();
        multiples.iter().sum()
    }
}
