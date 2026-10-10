package grains

Error :: enum {
	None = 0,
	InvalidSquare,
}

// Returns the number of grains on the specified square.
square :: proc(n: int) -> (u64, Error) {
    if n <= 0 || n > 64 {
        return 0, Error.InvalidSquare
    }
	return 1 << (uint(n) - 1), Error.None
}

// Returns the total number of squares on the board.
total :: proc() -> (u64, Error) {
	return ~u64(0), Error.None;
}
