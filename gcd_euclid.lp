num(1..100).

gcd(X,X,X) :- X > 1, num(X).
gcd(T,X,Y) :- X < Y, gcd(T,X,Y1), Y = Y1 + X, num(X;Y;Y1).
gcd(T,X,Y) :- X > Y, gcd(T,X1,Y), X = X1 + Y, num(X;Y;X1).

eg(T) :- gcd(T,96,60).

#hide.
#show eg/1.