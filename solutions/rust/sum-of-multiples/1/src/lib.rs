pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    let mut multiples: Vec<u32> = Vec::new();

    for factor in factors {
        if *factor == 0 {
            multiples.push(0);
            break
        }
        for i in 1.. {
            let multiple = factor * i;
            if multiple < limit {
                multiples.push(multiple);
            } else {
                break;
            }
        }
    }

    if multiples.is_empty() {
        return 0;
    } else {
        multiples.sort();
        multiples.dedup();
        multiples.iter().sum()
    }
}
