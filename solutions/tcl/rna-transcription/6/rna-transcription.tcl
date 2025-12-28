proc to-rna {dna} {
	array set transcriptionMap {G C C G T A A U}
	return [string map [array get transcriptionMap] $dna]
}
