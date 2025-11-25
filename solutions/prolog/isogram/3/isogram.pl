% is_alpha: <https://www.swi-prolog.org/pldoc/doc/_SWI_/library/ctypes.pl>

isogram(S) :-
	string_lower(S, LC),
	string_chars(LC, L),
	include(is_alpha, L, Filtered),
	is_set(Filtered).
