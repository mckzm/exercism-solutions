array set transcriptionMap  {G C C G T A A U}

proc to-rna {dna} {
	global transcriptionMap transcriptionMap
	return [string map [array get transcriptionMap] $dna]
}
