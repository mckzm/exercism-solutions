pub fn brackets_are_balanced(s: &str) -> bool {
    let mut brackets_seen = Vec::<char>::new();
    for c in s.chars() {
        match c {
            '[' | '(' | '{' => brackets_seen.push(c),
            ']' => if brackets_seen.pop() != Some('[') { return false },
            ')' => if brackets_seen.pop() != Some('(') { return false },
            '}' => if brackets_seen.pop() != Some('{') { return false },
            _ => (),
        }
    }
    brackets_seen.is_empty()
}
