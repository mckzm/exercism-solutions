proc to-rna {dna} {
	const TRANSCRIPTION_MAP {G C C G T A A U}
	return [string map $TRANSCRIPTION_MAP $dna]
}
