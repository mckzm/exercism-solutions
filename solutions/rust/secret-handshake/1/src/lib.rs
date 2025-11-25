const ACTIONS: [&str; 5] = ["wink", "double blink", "close your eyes", "jump", "reverse"];

pub fn actions(n: u8) -> Vec<&'static str> {
    let mut v = Vec::<&str>::new();
    for (i, action) in ACTIONS.iter().enumerate() {
        let p = 2u8.pow(i as u32);
        match n & p == p {
            true => v.push(action),
            false => (),
        }
    }
    if Some("reverse") == v.last().copied() {
        v.pop();
        v.reverse();
    }
    v
}
