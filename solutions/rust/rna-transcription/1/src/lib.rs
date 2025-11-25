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

impl Dna {
    pub fn new(dna: &str) -> Result<Dna, usize> {
        dna.chars()
            .enumerate()
            .try_for_each(|(i, c)| match DNA_NUCLEOTIDES.contains(&c) {
                false => Err(i),
                true => Ok(()),
            })
            .map(|_| Dna {
                seq: dna.to_string(),
            })
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
        rna.chars()
            .enumerate()
            .try_for_each(|(i, c)| match RNA_NUCLEOTIDES.contains(&c) {
                false => Err(i),
                true => Ok(()),
            })
            .map(|_| Rna {
                seq: rna.to_string(),
            })
    }
}
