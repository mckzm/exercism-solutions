is_alpha(Char, alpha) :-
	char_type(Char, alpha).

isogram(S) :-
	string_lower(S, LC),
	string_chars(LC, L),
	include(is_alpha, L, Filtered),
	is_set(Filtered).
