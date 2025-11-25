fn extract_digits(num: u32) -> Vec<u32> {
    fn inner(num: u32, xs: &mut Vec<u32>) {
        if num >= 10 {
            inner(num / 10, xs);
        }
        xs.push(num % 10);
    }

    let mut xs = Vec::<u32>::new();
    inner(num, &mut xs);
    xs
}

pub fn is_armstrong_number(num: u32) -> bool {
    let vec: Vec<u32> = extract_digits(num);
    let power = vec.len();
    let mut sum: u32 = 0;

    for e in vec {
        if (e.pow(power.try_into().unwrap())).checked_add(sum) == None {
            return false
        }
        sum += e.pow(power.try_into().unwrap());
    }

    sum == num
}
