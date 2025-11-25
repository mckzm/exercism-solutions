use std::collections::{BTreeMap, BTreeSet};

pub struct School<'a> {
    roster: BTreeMap<u32, BTreeSet<&'a str>>,
}

impl<'a> School<'a> {
    pub fn new() -> School<'a> {
        Self {
            roster: BTreeMap::new(),
        }
    }

    pub fn add(&mut self, grade: u32, student: &'a str) {
        self.roster.entry(grade).or_default().insert(student);
    }

    pub fn grades(&self) -> Vec<u32> {
        self.roster.keys().copied().collect()
    }

    pub fn grade(&self, grade: u32) -> Vec<String> {
        self.roster.get(&grade).map_or(Vec::new(), |students| {
            students.iter().map(|s| s.to_string()).collect()
        })
    }
}
