#[derive(Debug, Eq)]
pub struct CustomSet<T: Clone + PartialEq>(Vec<T>);

impl<T: Clone + PartialEq> FromIterator<T> for CustomSet<T> {
    fn from_iter<I: IntoIterator<Item = T>>(iter: I) -> Self {
        Self(iter.into_iter().collect())
    }
}

impl<T: Clone + PartialEq> PartialEq for CustomSet<T> {
    fn eq(&self, other: &Self) -> bool {
        self.is_subset(other) && other.is_subset(self)
    }
}

impl<T: Clone + PartialEq> CustomSet<T> {
    pub fn new(input: &[T]) -> Self {
        input.iter().fold(Self(Vec::new()), |mut acc, e| {
            acc.add(e.clone());
            acc
        })
    }

    pub fn contains(&self, element: &T) -> bool {
        self.0.contains(element)
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
        self.0
            .iter()
            .filter(|e| other.contains(e))
            .cloned()
            .collect()
    }

    pub fn difference(&self, other: &Self) -> Self {
        self.0
            .iter()
            .filter(|e| !other.contains(e))
            .cloned()
            .collect()
    }

    pub fn union(&self, other: &Self) -> Self {
        self.0.iter().chain(other.0.iter()).cloned().collect()
    }
}
