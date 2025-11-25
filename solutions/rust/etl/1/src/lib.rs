use std::collections::BTreeMap;

pub fn transform(h: &BTreeMap<i32, Vec<char>>) -> BTreeMap<char, i32> {
    h.iter()
        .fold(vec![], |mut vec, (freq, letters)| {
            letters.iter().for_each(|letter| vec.push((letter, freq)));
            vec
        })
        .iter()
        .fold(BTreeMap::new(), |mut acc, (letter, freq)| {
            acc.insert((**letter).to_ascii_lowercase(), **freq);
            acc
        })
}
