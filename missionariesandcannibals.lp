% Solve the missionaries and cannibals problem: 
% There are 3 missionaries and 3 cannibals on one side of a river
% They all want to get across to the other side
% There is a boat but it only carries 2 people
% Anywhere the number of cannibals exceeds the number of missionaries, the missionaries get eaten.
% What sequence of boat journeys achieves the goal? 

#base.

state(1,3,3,1,0).					% side, missionaries, cannibals, boats, time
state(2,0,0,0,0).

#cumulative t.

% generate

1{move(M,C,t) : M = 0..3 : C = 0..3}1.	                % 1 move per time step

% test

:- move(M,C,t), state(S,M1,C1,1,t-1), M > M1. 		% can only take as many missionaries as are present
:- move(M,C,t), state(S,M1,C1,1,t-1), C > C1.		% ditto cannibals
:- move(M,C,t), M + C > 2.	      	  		% boat only holds 2 people
:- move(M,C,t), M + C < 1.				% someone has to row 

state(S,M1-M2,C1-C2,0,t) :- move(M2,C2,t), state(S,M1,C1,1,t-1).	% update the source state
state(S,M1+M2,C1+C2,1,t) :- move(M2,C2,t), state(S,M1,C1,0,t-1).	% update the destination state

:- state(_,M,C,_,_), M > 0, C > M.  % cannot have more cannibals than missionaries on any bank

#volatile t.

:- not state(2,3,3,1,t).

#hide.
#show move/3.

