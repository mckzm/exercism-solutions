module main

fn grains_on_square(square int) !u64 {
    if square <= 0 || square > 64 { return error("square must be > 0 and <= 64")}
    return u64(1) << (square - 1)
}

fn total_grains_on_board() u64 {
    return u64(18_446_744_073_709_551_615)
}
