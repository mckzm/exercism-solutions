package hamming

Error :: enum {
	None,
	UnequalLengths,
}

distance :: proc(strand1, strand2: string) -> (int, Error) {
    strand1_size: int = len(strand1)
    if strand1_size != len(strand2) do return 0, .UnequalLengths
    
    diff: int = 0
    for i := 0; i < strand1_size; i += 1 {
        if strand1[i] != strand2[i] do diff += 1
    }

    return diff, .None
}
