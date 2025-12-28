array set transcriptionMap  {G C C G T A A U}

proc to-rna {dna} {
	upvar transcriptionMap transcriptionMap
	return [string map [array get transcriptionMap] $dna]
}
