left_shift(Bit, CurrAcc, NewAcc) :-
	Bit = '0', NewAcc is CurrAcc << 1, !;
	Bit = '1', NewAcc is CurrAcc << 1 + 1.

binary(Str, Dec) :-
	string_chars(Str, Bits),
	foldl(left_shift, Bits, 0, Dec).
