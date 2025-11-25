use std::collections::HashMap;

pub struct School {
    roster: HashMap<String, u32>,
}

impl School {
    pub fn new() -> School {
        Self {
            roster: HashMap::new(),
        }
    }

    pub fn add(&mut self, grade: u32, student: &str) {
        let student = student.to_owned();
        if self.roster.contains_key(&student) {
            panic!(
                "Student {} is already on the roster in grade {}",
                student,
                self.roster.get(&student).unwrap()
            )
        }
        self.roster.insert(student, grade);
    }

    pub fn grades(&self) -> Vec<u32> {
        let mut grades = self.roster.values().copied().collect::<Vec<u32>>();
        grades.sort();
        grades.dedup();
        grades
    }

    pub fn grade(&self, grade: u32) -> Vec<String> {
        let mut students = self.roster.iter().fold(Vec::new(), |mut v, (s, g)| {
            if g == &grade {
                v.push(s.to_owned());
            }
            v
        });
        students.sort();
        students
    }
}
