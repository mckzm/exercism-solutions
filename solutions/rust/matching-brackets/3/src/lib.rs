pub fn brackets_are_balanced(s: &str) -> bool {
    let mut valid_closers = Vec::<char>::new();
    for c in s.chars() {
        match c {
            '[' => valid_closers.push(']'),
            '(' => valid_closers.push(')'),
            '{' => valid_closers.push('}'),
            ']' | ')' | '}' => {
                if valid_closers.pop() != Some(c) { return false }
            },
            _ => (),
        }
    }
    valid_closers.is_empty()
}

