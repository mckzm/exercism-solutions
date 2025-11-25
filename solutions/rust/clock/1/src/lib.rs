use std::fmt::{self, Display, Formatter};

#[derive(Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Display for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        let mut hours = self.hours % 24;
        let mut minutes = self.minutes;

        (hours, minutes) = match (hours >= 0, minutes >= 0) {
            (true, true) => (hours, minutes),
            (true, false) => (if hours == 0 { 23 } else { hours - 1 }, 60 - minutes.abs()),
            (false, true) => (24 - hours.abs(), minutes),
            (false, false) => (24 - hours.abs() - 1, 60 - minutes.abs()),
        };

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
        Self {
            hours: hours + (minutes / 60),
            minutes: minutes % 60,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let minutes = self.minutes + minutes;
        Self::new(self.hours + (minutes / 60), minutes % 60)
    }
}
