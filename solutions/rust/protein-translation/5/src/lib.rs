use std::{collections::BTreeMap, str};

pub struct CodonsInfo<'a> {
    map: BTreeMap<&'a str, &'a str>,
}

impl<'a> CodonsInfo<'a> {
    pub fn name_for(&self, codon: &str) -> Option<&'a str> {
        self.map.get(codon).copied()
    }

    pub fn of_rna(&self, rna: &str) -> Option<Vec<&'a str>> {
        rna.as_bytes()
            .chunks(3)
            .map_while(
                |chunk| match self.name_for(str::from_utf8(chunk).unwrap()) {
                    Some("stop codon") => None,
                    x => Some(x),
                },
            )
            .collect()
    }
}

pub fn parse<'a>(pairs: Vec<(&'a str, &'a str)>) -> CodonsInfo<'a> {
    CodonsInfo {
        map: pairs.into_iter().collect(),
    }
}
