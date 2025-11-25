use std::ops::Add;

pub struct Triangle<T> {
    a: T,
    b: T,
    c: T,
}

impl<T> Triangle<T>
where
    T: Copy + Default + Add<Output = T> + PartialOrd,
{
    pub fn build(sides: [T; 3]) -> Option<Triangle<T>> {
        let (a, b, c) = sides.into();
        if a <= Default::default() || b <= Default::default() || c <= Default::default() {
            return None;
        }
        if !(a + b >= c && b + c >= a && a + c >= b) {
            return None;
        }
        Some(Self { a, b, c })
    }

    pub fn is_equilateral(&self) -> bool {
        self.a == self.b && self.b == self.c
    }

    pub fn is_scalene(&self) -> bool {
        self.a != self.b && self.b != self.c && self.c != self.a
    }

    pub fn is_isosceles(&self) -> bool {
        self.a == self.b || self.b == self.c || self.c == self.a
    }
}
