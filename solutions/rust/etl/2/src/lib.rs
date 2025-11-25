use std::collections::BTreeMap;

pub fn transform(h: &BTreeMap<i32, Vec<char>>) -> BTreeMap<char, i32> {
    h.iter()
        .fold(vec![], |mut vec, (score, letters)| {
            letters.iter().for_each(|letter| vec.push((letter, score)));
            vec
        })
        .iter()
        .fold(BTreeMap::new(), |mut acc, (letter, score)| {
            acc.insert((**letter).to_ascii_lowercase(), **score);
            acc
        })
}
