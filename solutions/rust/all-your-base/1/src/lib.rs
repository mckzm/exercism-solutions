#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit(u32),
}

pub fn convert(number: &[u32], from_base: u32, to_base: u32) -> Result<Vec<u32>, Error> {
    match (from_base >= 2, to_base >= 2) {
        (true, true) => (),
        (false, _) => return Err(Error::InvalidInputBase),
        (_, false) => return Err(Error::InvalidOutputBase),
    }
    if number.is_empty() {
        return Ok(vec![0]);
    }

    Ok(to_digits(from_digits(number, from_base)?, to_base))
}

fn from_digits(digits: &[u32], base: u32) -> Result<u32, Error> {
    let mut number = 0;

    for digit in digits {
        if digit < &0 || digit >= &base {
            return Err(Error::InvalidDigit(*digit));
        }

        number = number * base + digit;
    }
    Ok(number)
}

fn to_digits(mut number: u32, target_base: u32) -> Vec<u32> {
    let mut digits = Vec::<u32>::new();

    while number > 0 {
        digits.push(number % target_base);
        number /= target_base;
    }

    if digits.iter().all(|digit| digit == &0) {
        vec![0]
    } else {
        digits.reverse();
        digits
    }
}
