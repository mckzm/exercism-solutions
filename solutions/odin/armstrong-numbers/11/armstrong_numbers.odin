package armstrong_numbers

is_armstrong_number :: proc(n: u128) -> bool {
	BASE :: 10

	n_len: u8 // n has at most log10(2**128 - 1) + 1 = 39 decimal digits
	for m := n; m > 0; m /= BASE do n_len += 1

	sum: u128
	for m := n; m > 0; m /= BASE {
		digit := m % BASE

		acc: u128 = 1
		for _ in 1..=n_len do acc *= digit

		sum += acc
	}

	return sum == n
}
