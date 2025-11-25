const ACTIONS: [&str; 5] = ["wink", "double blink", "close your eyes", "jump", "reverse"];

pub fn actions(n: u8) -> Vec<&'static str> {
    ACTIONS
        .iter()
        .enumerate()
        .fold(Vec::new(), |mut v, (i, action)| {
            let p = 2u8.pow(i as u32);
            match p & n == p {
                true => {
                    if action == &"reverse" {
                        v.reverse()
                    } else {
                        v.push(action)
                    }
                }
                false => (),
            }
            v
        })
}
