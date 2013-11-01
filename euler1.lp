% Project Euler problem 1 in AnsProlog
% Find the sum of all the multiples of 3 or 5 below 1000.
% by Arwyn Roberts

num(1..999).
div(3;5).

divisible(X) :- X #mod Y == 0, num(X), div(Y).
sum(S) :- S := #sum[divisible(X) : num(X) = X].

#hide.
#show sum/1.
