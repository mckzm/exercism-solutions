triangle(A, B, C, Type) :-
	number(A), number(B), number(C),
	A > 0, B > 0, C > 0,
	A + B >= C,
	B + C >= A,
	A + C >= B,
	((A = B, B = C, Type = "equilateral"), !; ((A = B, !; B = C, !; A = C), Type = "isosceles"), !; Type = "scalene").
