pub struct Matcher<T> {
    rule: fn(T) -> bool,
    output: String,
}

impl<T> Matcher<T> {
    pub fn new(matcher: fn(T) -> bool, subs: &str) -> Matcher<T> {
        Self {
            rule: matcher,
            output: subs.to_owned(),
        }
    }
}

pub struct Fizzy<T> {
    matchers: Vec<Matcher<T>>,
}

impl<T: Copy + std::fmt::Display> Fizzy<T> {
    pub fn new() -> Self {
        Self {
            matchers: Vec::new(),
        }
    }

    pub fn add_matcher(mut self, matcher: Matcher<T>) -> Self {
        self.matchers.push(matcher);
        self
    }

    pub fn apply(self, iter: impl Iterator<Item = T>) -> impl Iterator<Item = String> {
        iter.map(move |e| {
            let res: String = self
                .matchers
                .iter()
                .filter(|m| (m.rule)(e))
                .map(|m| m.output.clone())
                .collect();

            if res.is_empty() {
                e.to_string()
            } else {
                res
            }
        })
    }
}

pub fn fizz_buzz<T: Copy + From<u8> + PartialEq + std::fmt::Display + std::ops::Rem<Output = T>>(
) -> Fizzy<T> {
    Fizzy::new()
        .add_matcher(Matcher::new(|n: T| n % 3.into() == 0.into(), "fizz"))
        .add_matcher(Matcher::new(|n| n % 5.into() == 0.into(), "buzz"))
}
