use std::{collections::BTreeMap, str};

pub struct CodonsInfo<'a> {
    map: BTreeMap<&'a str, &'a str>,
}

impl<'a> CodonsInfo<'a> {
    pub fn name_for(&self, codon: &str) -> Option<&'a str> {
        self.map.get(codon).copied()
    }

    pub fn of_rna(&self, rna: &str) -> Option<Vec<&'a str>> {
        let mut proteins = Vec::new();
        for chunk in rna.as_bytes().chunks(3) {
            let codon = str::from_utf8(chunk).unwrap();
            match self.name_for(codon) {
                None => return None,
                Some("stop codon") => break,
                Some(protein) => proteins.push(protein),
            }
        }
        Some(proteins)
    }
}

pub fn parse<'a>(pairs: Vec<(&'a str, &'a str)>) -> CodonsInfo<'a> {
    CodonsInfo {
        map: pairs.into_iter().collect(),
    }
}
