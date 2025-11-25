#[derive(PartialEq, Eq, Debug)]
pub enum Direction {
    North,
    East,
    South,
    West,
}
use Direction::*;

pub struct Robot {
    x: i32,
    y: i32,
    d: Direction,
}

impl Robot {
    pub fn new(x: i32, y: i32, d: Direction) -> Self {
        Self { x, y, d }
    }

    #[must_use]
    pub fn turn_right(self) -> Self {
        Self {
            x: self.x,
            y: self.y,
            d: match self.d {
                North => East,
                East => South,
                South => West,
                West => North,
            },
        }
    }

    #[must_use]
    pub fn turn_left(self) -> Self {
        Self {
            x: self.x,
            y: self.y,
            d: match self.d {
                North => West,
                East => North,
                South => East,
                West => South,
            },
        }
    }

    #[must_use]
    pub fn advance(self) -> Self {
        match self.d {
            North => Self {
                x: self.x,
                y: self.y + 1,
                d: self.d,
            },
            South => Self {
                x: self.x,
                y: self.y - 1,
                d: self.d,
            },
            East => Self {
                x: self.x + 1,
                y: self.y,
                d: self.d,
            },
            West => Self {
                x: self.x - 1,
                y: self.y,
                d: self.d,
            },
        }
    }

    #[must_use]
    pub fn instructions(self, instructions: &str) -> Self {
        instructions.bytes().fold(self, |robot, b| match b {
            b'A' => robot.advance(),
            b'L' => robot.turn_left(),
            b'R' => robot.turn_right(),
            _ => panic!("Illegal instruction given!"),
        })
    }

    pub fn position(&self) -> (i32, i32) {
        (self.x, self.y)
    }

    pub fn direction(&self) -> &Direction {
        &self.d
    }
}
