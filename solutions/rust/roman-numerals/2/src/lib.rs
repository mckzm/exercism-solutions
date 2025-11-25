use std::fmt::{Display, Formatter, Result};

const UNITS: [&str; 9] = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"];
const TENS: [&str; 9] = ["X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"];
const HUNDREDS: [&str; 9] = ["C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"];
pub struct Roman(String);

impl Display for Roman {
    fn fmt(&self, _f: &mut Formatter<'_>) -> Result {
        write!(_f, "{}", self.0)
    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        Self(Roman::romanise(num))
    }
}

impl Roman {
    fn romanise(num: u32) -> String {
        let mut roman = String::new();
        if num > 3999 {
            panic!("We only accept numbers up to 3999")
        }
        let mut num = num;
        while num > 0 {
            if num >= 1000 {
                let thousands = num / 1000;
                for _ in 0..thousands {
                    roman.push('M')
                }
                num -= thousands * 1000
            } else if num >= 100 {
                let hundreds = num / 100;
                roman.push_str(HUNDREDS[hundreds as usize - 1]);
                num -= hundreds * 100
            } else if num >= 10 {
                let tens = num / 10;
                roman.push_str(TENS[tens as usize - 1]);
                num -= tens * 10
            } else {
                roman.push_str(UNITS[num as usize - 1]);
                num = 0
            }
        }
        roman
    }
}
