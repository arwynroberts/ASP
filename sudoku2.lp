% sudoku grid generator/solver
% Arwyn Roberts

pos(0..8).                % row/col indexes
box(0..2).		  % valid box indexes
val(1..9).		  % cell entry

inBox(P,P/3) :- pos(P).	  % map pos to box

1 { cell(X,Y,N) : val(N) } 1 :- pos(X), pos(Y).		% create a single sudoku grid
1 { cell(X,Y,N) : pos(X) } 1 :- pos(Y), val(N).		% row constraint
1 { cell(X,Y,N) : pos(Y) } 1 :- pos(X), val(N).		% column constraint
1 { cell(X,Y,N) : inBox(X,BX) : inBox(Y,BY) } 1 	% box constraint
  :- box(BX), box(BY), val(N).

#hide.
#show cell/3.

