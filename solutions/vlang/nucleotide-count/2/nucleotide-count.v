module main

fn count_nucleotides(strand string) !map[string]int {
    dna_nucleobases := ['A', 'C', 'G', 'T']
    mut base_counts := map[string]int{}
    for base in dna_nucleobases { base_counts[base] = 0 }
    
    for c in strand {
        match c.ascii_str() in dna_nucleobases {
            false { return error("Invalid character") }
            true { base_counts[c.ascii_str()]++ }
        }
    }

    return base_counts
}
