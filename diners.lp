%-*-Prolog-*-
% Diners puzzle

% Mr and Mrs Astor, Mr and Mrs Blake, Mr and Mrs Crane, and Mr and Mrs Davis were seated around a circular table. 
% Mrs Astor was insulted by Mr Blake, who sat next to her on her left. 
% Mr Blake was insulted by Mrs Crane, who sat opposite him across the center of the table.
% Mrs Crane was insulted by the hostess, who was the only person to sit next to each one of a married couple.
% The hostess was insulted by the only person to sit next to each one of two men.
% Who insulted the hostess?
% Mrs Davis was the hostess and she was seated in chair 0.

person(mrA; mrsA; mrB; mrsB; mrC; mrsC; mrD; mrsD).	   % variables P, P1, P2
chair(0..7). 	    	    	       	      	           % variables C, C1, C2

1{place(P,C) : chair(C)}1 :- person(P).			   % put everyone in a chair
1{place(P,C) : person(P)}1 :- chair(C).			   % one person per chair

leftOf(P1,P2) :- place(P1,C1), place(P2,C2), C1=(C2+1)\8.  % define 'P1 to the left of P2'

:- not leftOf(mrB,mrsA). 	                           % Mr Blake is on the left of Mrs Astor

opposite(P1,P2) :- place(P1,C1), place(P2,C2), C2=(C1+4)\8.% define opposite

:- not opposite(mrsC,mrB).	                           % Mrs Crane is opposite Mr Blake

couple(mrA, mrsA).					   % specify who's married to whom
couple(mrB, mrsB).
couple(mrC, mrsC).
couple(mrD, mrsD).
couple(P2,P1) :- couple(P1,P2).				   % couple is symmetric

between(P,P1,P2) :- leftOf(P,P1), leftOf(P2,P).            % define relation 'between'                     

betweenCouple(P) :- between(P,P1,P2), couple(P1,P2).	   % define predicate 'between a married couple'

:- not 1{betweenCouple(_)}1.		      		   % only 1 person is sat between a couple
:- betweenCouple(P), not hostess(P).			   % that person is the hostess

man(mrA; mrB; mrC; mrD).				   % specify who are the men
between2Men(P) :- between(P,P1,P2), man(P1;P2).		   % define predicate 'between 2 men'

:- not 1{between2Men(_)}1.	   			   % only 1 person seated between 2 men

hostess(mrsD).                                             % Mrs Davis is the hostess
place(mrsD,0).                                             % she is in chair 0

#hide.
#show between2Men/1.
#show place/2.





