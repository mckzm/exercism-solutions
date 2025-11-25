#[derive(Debug, Eq)]
pub struct CustomSet<T: Clone + PartialEq>(Vec<T>);

impl<T: Clone + PartialEq> PartialEq for CustomSet<T> {
    fn eq(&self, other: &Self) -> bool {
        self.is_subset(other) && other.is_subset(self)
    }
}

impl<T: Clone + PartialEq> CustomSet<T> {
    pub fn new(input: &[T]) -> Self {
        let mut v = input.to_vec();
        v.dedup();
        CustomSet(v)
    }

    pub fn contains(&self, element: &T) -> bool {
        self.0.iter().any(|e| e == element)
    }

    pub fn add(&mut self, element: T) {
        if !self.contains(&element) {
            self.0.push(element)
        }
    }

    pub fn is_subset(&self, other: &Self) -> bool {
        self.0.len() <= other.0.len() && self.0.iter().all(|e| other.contains(e))
    }

    pub fn is_empty(&self) -> bool {
        self.0.is_empty()
    }

    pub fn is_disjoint(&self, other: &Self) -> bool {
        other.0.iter().all(|e| !self.contains(e))
    }

    #[must_use]
    pub fn intersection(&self, other: &Self) -> Self {
        self.0.iter().fold(Self::new(&[]), |mut acc, e| {
            if other.contains(e) {
                acc.0.push(e.clone())
            };
            acc
        })
    }

    pub fn difference(&self, other: &Self) -> Self {
        self.0.iter().fold(Self::new(&[]), |mut acc, e| {
            if !other.contains(e) {
                acc.0.push(e.clone())
            };
            acc
        })
    }

    pub fn union(&self, other: &Self) -> Self {
        match (self.is_empty(), other.is_empty()) {
            (true, _) => other.difference(self),
            (_, true) => self.difference(other),
            _ => Self::new(&self.0.iter().zip(other.0.iter()).fold(
                Vec::new(),
                |mut acc, (e1, e2)| {
                    acc.push(e1.clone());
                    acc.push(e2.clone());
                    acc
                },
            )),
        }
    }
}
