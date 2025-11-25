pub struct Matcher<T> {
    rule: fn(T) -> bool,
    output: String,
}

impl<T: Copy + std::fmt::Display> Matcher<T> {
    pub fn new(_matcher: fn(T) -> bool, _subs: &str) -> Matcher<T> {
        Self {
            rule: _matcher,
            output: _subs.to_owned(),
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

    #[must_use]
    pub fn add_matcher(mut self, _matcher: Matcher<T>) -> Self {
        self.matchers.push(_matcher);
        self
    }

    pub fn apply<I: IntoIterator<Item = T>>(self, _iter: I) -> impl Iterator<Item = String> {
        _iter.into_iter().map(move |i| {
            let applied = self.matchers.iter().fold(String::new(), |mut s, matcher| {
                if (matcher.rule)(i) {
                    s.push_str(&matcher.output);
                }
                s
            });
            if applied.is_empty() {
                i.to_string()
            } else {
                applied.to_string()
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
