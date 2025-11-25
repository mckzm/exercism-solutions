#[derive(Debug, Eq)]
pub struct CustomSet<T: Clone + PartialEq>(Vec<T>);

impl<T: Clone + PartialEq> PartialEq for CustomSet<T> {
    fn eq(&self, other: &Self) -> bool {
        self.is_subset(other) && other.is_subset(self)
    }
}

impl<T: Clone + PartialEq> CustomSet<T> {
    pub fn new(input: &[T]) -> Self {
        CustomSet(input.iter().fold(Vec::new(), |mut acc, e| {
            if !acc.contains(e) {
                acc.push(e.clone())
            };
            acc
        }))
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
        self.0.iter().all(|e| other.contains(e))
    }

    pub fn is_empty(&self) -> bool {
        self.0.is_empty()
    }

    pub fn is_disjoint(&self, other: &Self) -> bool {
        other.0.iter().all(|e| !self.contains(e))
    }

    pub fn intersection(&self, other: &Self) -> Self {
        Self::new(
            &(self
                .0
                .iter()
                .filter(|e| other.contains(e))
                .cloned()
                .collect::<Vec<T>>()),
        )
    }

    pub fn difference(&self, other: &Self) -> Self {
        Self::new(
            &(self
                .0
                .iter()
                .filter(|e| !other.contains(e))
                .cloned()
                .collect::<Vec<T>>()),
        )
    }

    pub fn union(&self, other: &Self) -> Self {
        Self::new(
            &self
                .0
                .iter()
                .chain(other.0.iter())
                .cloned()
                .collect::<Vec<T>>(),
        )
    }
}
