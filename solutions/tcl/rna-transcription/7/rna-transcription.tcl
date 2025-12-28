const TRANSCRIPTION_MAP {G C C G T A A U}

proc to-rna {dna} {
	variable TRANSCRIPTION_MAP
	return [string map $TRANSCRIPTION_MAP $dna]
}
