module main

fn count_nucleotides(strand string) !map[string]int {
    mut dna_nucleobase_counts := {
        'A': 0
        'C': 0
        'G': 0
        'T': 0
    }
    
    for ch in strand {
        base := ch.ascii_str()
        
        match base in dna_nucleobase_counts {
            false { return error("Invalid character") }
            true { dna_nucleobase_counts[base]++ }
        }
    }

    return dna_nucleobase_counts
}
