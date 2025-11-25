pub fn brackets_are_balanced(s: &str) -> bool {
    if s.is_empty() {
        return true;
    }
    let mut closers = vec!['\0'];

    for c in s.chars() {
        match c {
            ']' | ')' | '}' => {
                if c != closers[closers.len() - 1] {
                    return false;
                }
                closers.pop();
            }
            '[' => closers.push(']'),
            '(' => closers.push(')'),
            '{' => closers.push('}'),
            _ => (),
        }
    }

    closers.len() == 1
}
