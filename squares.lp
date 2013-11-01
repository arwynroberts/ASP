% find Pythagorean triples x, y, z such that x < y, z = y+1

num(1..100).
squares(X,Y,Z) :- XX := X*X, YY := Y*Y, ZZ := XX+YY, Z := Y+1,
		 Z*Z == ZZ, num(X), num(Y), num(Z), X < Y.

#hide.
#show squares/3.
