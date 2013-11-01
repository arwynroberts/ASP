% Greatest Common Divisor in "natural" ASP

num(1..100).

divisor(T,N) :- N \ T == 0, num(T;N).
cd(T,N1,N2) :- divisor(T,N1), divisor(T,N2).
greater_cd(T1,N1,N2) :- cd(T1,N1,N2), cd(T2,N1,N2), T2 > T1.
gcd(T,N1,N2) :- cd(T,N1,N2), not greater_cd(T,N1,N2), num(T).

eg(T) :- gcd(T,60,96).

#hide.
#show eg/1.
