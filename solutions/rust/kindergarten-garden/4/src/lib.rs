const CHILDREN: [&str; 12] = [
    "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
    "Kincaid", "Larry",
];

pub fn plants(diagram: &str, student: &str) -> Vec<&'static str> {
    let child_idx = CHILDREN.iter().position(|child| *child == student).unwrap() * 2;

    diagram
        .lines()
        .flat_map(|line| {
            line[child_idx..=child_idx + 1]
                .split("")
                .filter(|s| !s.is_empty()) // split("")'s first two elts are ""
                .map(|plant| match plant {
                    "C" => "clover",
                    "G" => "grass",
                    "R" => "radishes",
                    _ => "violets",
                })
        })
        .collect()
}
