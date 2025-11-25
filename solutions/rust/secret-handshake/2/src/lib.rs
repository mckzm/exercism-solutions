const ACTIONS: [&str; 5] = ["wink", "double blink", "close your eyes", "jump", "reverse"];

pub fn actions(n: u8) -> Vec<&'static str> {
    let mut v: Vec<&str> = ACTIONS
        .iter()
        .enumerate()
        .map(|(i, action)| {
            let p = 2u8.pow(i as u32);
            if p & n == p {
                *action
            } else {
                ""
            }
        })
        .filter(|s| !s.is_empty())
        .collect();
    if Some(&"reverse") == v.last() {
        v.pop();
        v.reverse()
    }
    v
}
