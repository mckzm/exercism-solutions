package hamming

Error :: enum {
	None,
	UnequalLengths,
}

distance :: proc(strand1, strand2: string) -> (int, Error) {
    if len(strand1) != len(strand2) do return 0, .UnequalLengths
    
    
    diff: int = 0
    
    for i in 0..<len(strand1) {
        if strand1[i] != strand2[i] do diff += 1
    }

    return diff, .None
}
