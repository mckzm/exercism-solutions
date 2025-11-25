use std::fmt::{self, Display, Formatter};

#[derive(Debug)]
pub struct Clock(i32);

impl Display for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        let mut hours = (self.0 / 60) % 24;
        let mut minutes = self.0 % 60;

        if hours < 0 {
            hours = 24 - hours.abs();
        }

        if minutes < 0 {
            hours = if hours == 0 { 23 } else { hours - 1 };
            minutes = 60 - minutes.abs();
        }

        write!(f, "{:02}:{:02}", hours, minutes)
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.to_string() == other.to_string()
    }
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Self(hours * 60 + minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self(self.0 + minutes)
    }
}
