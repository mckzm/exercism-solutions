use std::ops::Add;

pub struct Triangle<T> {
    a: T,
    b: T,
    c: T,
}

impl<T> Triangle<T>
where
    T: Add<Output = T> + Copy + Default + PartialOrd,
{
    pub fn build(sides: [T; 3]) -> Option<Triangle<T>> {
        if sides.iter().any(|&side| side <= T::default()) {
            return None;
        }

        let mut sides = sides;
        sides.sort_unstable_by(|a, b| a.partial_cmp(b).unwrap());
        if sides[2] > sides[0] + sides[1] {
            return None;
        }

        let [a, b, c] = sides;
        Some(Self { a, b, c })
    }

    pub fn is_equilateral(&self) -> bool {
        self.a == self.c
    }

    pub fn is_scalene(&self) -> bool {
        self.a != self.b && self.b != self.c
    }

    pub fn is_isosceles(&self) -> bool {
        self.a == self.b || self.b == self.c
    }
}
