use std::collections::HashMap;

const CHILDREN: [&str; 12] = [
    "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
    "Kincaid", "Larry",
];

pub fn plants(_diagram: &str, _student: &str) -> Vec<&'static str> {
    let plant_dict = HashMap::from([
        ("C", "clover"),
        ("G", "grass"),
        ("R", "radishes"),
        ("V", "violets"),
    ]);
    let mut plants = Vec::<&'static str>::new();

    let (child_idx, _) = CHILDREN
        .iter()
        .enumerate()
        .find(|(_, child)| child.to_string() == _student)
        .unwrap();
    // * 2 : each child has 2 plants per row
    // +1 : String.split("")'s first element is the empty string
    let child_offset = child_idx * 2 + 1;

    for line in _diagram.lines() {
        for t in line
            .split("")
            .enumerate()
            .filter(|(i, _)| *i == child_offset || *i == child_offset + 1)
        {
            let (_, plant_sym) = t;
            plants.push(plant_dict.get(plant_sym).unwrap());
        }
    }

    plants
}
