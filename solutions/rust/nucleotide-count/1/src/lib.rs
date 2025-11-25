use std::collections::HashMap;

const NUCLEOTIDES: [char; 4] = ['A', 'C', 'G', 'T'];

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    if !NUCLEOTIDES.contains(&nucleotide) {
        return Err(nucleotide);
    };

    if dna.is_empty() {
        return Ok(0);
    }

    match dna_seq_check(dna) {
        Some(c) => Err(c),
        None => Ok(dna.chars().filter(|c: &char| c == &nucleotide).count()),
    }
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    match dna_seq_check(dna) {
        Some(c) => Err(c),
        None => Ok(NUCLEOTIDES.iter().map(|n| (n.clone(), count(*n, dna).unwrap())).collect()),
    }
}

pub fn dna_seq_check(dna: &str) -> Option<char> {
    dna.chars().find(|c: &char| !NUCLEOTIDES.contains(c))
}
