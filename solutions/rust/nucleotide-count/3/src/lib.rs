use std::collections::HashMap;

const NUCLEOTIDES: [char; 4] = ['A', 'C', 'G', 'T'];

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    nucleotide_counts(dna)?
        .remove(&nucleotide)
        .ok_or(nucleotide)
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    let dna_seq_check = |dna: &str| dna.chars().find(|c: &char| !NUCLEOTIDES.contains(c));
    match dna_seq_check(dna) {
        Some(c) => Err(c),
        None => {
            let counts = NUCLEOTIDES.iter().map(|n| (*n, 0)).collect();
            Ok(dna.chars().fold(counts, |mut hm, c| {
                *hm.get_mut(&c).unwrap() += 1;
                hm
            }))
        }
    }
}
