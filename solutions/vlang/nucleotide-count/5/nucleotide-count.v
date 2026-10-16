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
        
        if base !in dna_nucleobase_counts { return error("Invalid character") }
        dna_nucleobase_counts[base]++
    }

    return dna_nucleobase_counts
}
