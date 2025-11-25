left_shift(Char, CurrAcc, NewAcc) :-
	atom_number(Char, Bit),
	(Bit > 1 -> false; NewAcc is CurrAcc << 1 + Bit).

binary(Str, Dec) :-
	string_chars(Str, Chars),
	foldl(left_shift, Chars, 0, Dec).
