const DNA_NUCLEOTIDES: [char; 4] = ['A', 'C', 'G', 'T'];
const RNA_NUCLEOTIDES: [char; 4] = ['A', 'C', 'G', 'U'];

#[derive(Debug, PartialEq, Eq)]
pub struct Dna {
    seq: String,
}

#[derive(Debug, PartialEq, Eq)]
pub struct Rna {
    seq: String,
}

fn validate_seq(seq: &str, nucleotides: [char; 4]) -> Result<String, usize> {
    seq.chars()
        .enumerate()
        .try_for_each(|(i, c)| match nucleotides.contains(&c) {
            false => Err(i),
            true => Ok(()),
        })
        .map(|_| seq.to_string())
}

impl Dna {
    pub fn new(dna: &str) -> Result<Dna, usize> {
        validate_seq(dna, DNA_NUCLEOTIDES).map(|seq| Dna { seq })
    }

    pub fn into_rna(self) -> Rna {
        Rna::new(
            &self
                .seq
                .chars()
                .map(|c| match c {
                    'G' => 'C',
                    'C' => 'G',
                    'T' => 'A',
                    'A' => 'U',
                    _ => panic!("Invalid DNA nucleotide - how?"),
                })
                .collect::<String>(),
        )
        .unwrap()
    }
}

impl Rna {
    pub fn new(rna: &str) -> Result<Rna, usize> {
        validate_seq(rna, RNA_NUCLEOTIDES).map(|seq| Rna { seq })
    }
}
