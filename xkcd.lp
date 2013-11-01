%
%  http://xkcd.com/287/
%
% Some quantity (or none) of each dish should be ordered to give a 
% total of exactly 15.05.
%
% This was created by Hakan Kjellerstrand, hakank@bonetmail.com
% See also http://www.hakank.org/answer_set_programming/
%
% modified by AR

#const total = 1505.
#const n = 7.									% 7 x 215 = 1505 is a solution, BTW

quantity(0..n).

menu(mixed_fruit, 215).
menu(french_fries, 275).
menu(side_salad, 335).
menu(hot_wings, 355).
menu(mozzarella_sticks, 420).
menu(samples_plate, 580).

1{dish_quantity(D,Q) : quantity(Q)}1 :- menu(D,_).				% each dish has exactly one quantity
total[dish_quantity(D,Q) : menu(D,P) : quantity(Q) = P*Q]total. 		% prices * amounts sum to total

#hide.
#show dish_quantity/2.