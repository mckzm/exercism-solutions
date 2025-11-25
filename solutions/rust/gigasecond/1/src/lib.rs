use time::{PrimitiveDateTime as DateTime, Duration};
use std::ops::Add;

// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    let gigasec = Duration::new(1_000_000_000, 0);
    start.add(gigasec)
}
