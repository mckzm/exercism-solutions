module main

fn count_nucleotides(strand string) !map[string]int {
	mut dna_nucleobase_counts := {
		'A': 0
		'C': 0
		'G': 0
		'T': 0
	}

	for r in strand.runes() {
		rs := r.str()

		if rs !in dna_nucleobase_counts { return error('Invalid character: ${rs}') }
		dna_nucleobase_counts[rs]++
	}

	return dna_nucleobase_counts
}
