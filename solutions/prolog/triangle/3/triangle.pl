is_triangle(A, B, C) :-
	A > 0, B > 0, C > 0,
	A + B >= C,
	B + C >= A,
	A + C >= B.

scalene(A, B, C) :-
	A \== B, B \== C, A \== C.

isosceles(A, A, _).
isosceles(A, _, A).
isosceles(_, A, A).

equilateral(A, A, A).

triangle(A, B, C, Type) :-
	is_triangle(A, B, C),
	(equilateral(A, B, C), Type = "equilateral", !;
	isosceles(A, B, C), Type = "isosceles", !;
	scalene(A, B, C), Type = "scalene").
