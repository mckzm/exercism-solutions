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
        sides.sort_by(|a, b| a.partial_cmp(b).unwrap());
        if sides[0] + sides[1] >= sides[2] {
            let (a, b, c) = sides.into();
            Some(Self { a, b, c })
        } else {
            None
        }
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
