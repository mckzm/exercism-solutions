use std::ops::{Add, Div, Mul, Rem};

#[derive(Debug, PartialEq, Eq)]
pub enum Error<T> {
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit(T),
}

pub fn convert<T>(number: &[T], from_base: T, to_base: T) -> Result<Vec<T>, Error<T>>
where
    T: Add<Output = T>
        + Copy
        + Div<Output = T>
        + From<u8>
        + Mul<Output = T>
        + PartialOrd
        + Rem<Output = T>,
{
    match (from_base >= 2u8.into(), to_base >= 2u8.into()) {
        (true, true) => (),
        (false, _) => return Err(Error::InvalidInputBase),
        (_, false) => return Err(Error::InvalidOutputBase),
    }
    if number.is_empty() {
        return Ok(vec![0u8.into()]);
    }

    Ok(to_digits(from_digits(number, from_base)?, to_base))
}

fn from_digits<T>(digits: &[T], base: T) -> Result<T, Error<T>>
where
    T: Add<Output = T>
        + Copy
        + Div<Output = T>
        + From<u8>
        + Mul<Output = T>
        + PartialOrd
        + Rem<Output = T>,
{
    let mut number = 0u8.into();

    for digit in digits {
        if digit < &0u8.into() || digit >= &base {
            return Err(Error::InvalidDigit(*digit));
        }

        number = number * base + *digit;
    }
    Ok(number)
}

fn to_digits<T>(mut number: T, target_base: T) -> Vec<T>
where
    T: Add<Output = T>
        + Copy
        + Div<Output = T>
        + From<u8>
        + Mul<Output = T>
        + PartialOrd
        + Rem<Output = T>,
{
    let mut digits = Vec::<T>::new();

    while number > 0u8.into() {
        digits.push(number % target_base);
        number = number / target_base;
    }

    if digits.iter().all(|digit| digit == &0u8.into()) {
        vec![0u8.into()]
    } else {
        digits.reverse();
        digits
    }
}
