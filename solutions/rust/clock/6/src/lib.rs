use std::fmt::{self, Display, Formatter};

const MIN_PER_DAY: i32 = 24 * 60;
const MIN_PER_HOUR: i32 = 60;

#[derive(Debug, PartialEq)]
pub struct Clock(i32);

impl Display for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        let hours = self.0 / MIN_PER_HOUR;
        let minutes = self.0 % MIN_PER_HOUR;

        write!(f, "{:02}:{:02}", hours, minutes)
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let to_clock_min = |min: i32| (MIN_PER_DAY + (min % MIN_PER_DAY)) % MIN_PER_DAY;
        Self(to_clock_min(hours * MIN_PER_HOUR + minutes))
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self::new(0, self.0 + minutes)
    }
}
