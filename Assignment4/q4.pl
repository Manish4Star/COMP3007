/**
q4.pl
Assignment 4, Question 4
Test cases can be found below
Abdul Bin Asif Niazi, 100917191
*/

mylast(X,[H|T]):-length(T,L),L==0, X=H.
mylast(X,[H|T]):-mylast(X,T).

after(X,[H|T],R):-H==X,R=T.
after(X,[H|T],R):-after(X,T,R).

first(X,[H|T]):-X==H.

nextto(X,Y,[H|T]):-H==X,first(Y,T).
nextto(X,Y,[H|T]):-nextto(X,Y,T).

occurs_at_position(E,L,Pos):-not(var(E)),integer(Pos),occurs1(E,L,Pos).
occurs_at_position(E,L,Pos):-not(var(E)),not(integer(Pos)),occurs2(E,L,Pos).
occurs_at_position(E,L,Pos):-var(E),integer(Pos),occurs3(E,L,Pos).

occurs1(E,[H|T],Pos):-E==H,Pos==0.
occurs1(E,[H|T],Pos):-X is Pos-1,occurs1(E,T,X).

occurs2(E,[H|T],X):-E==H.
occurs2(E,[H|T],X):-occurs_help(E,T,X,1).
occurs_help(E,[H|T],X,R):-E==H,X is R.
occurs_help(E,[H|T],X,R):-occurs_help(E,T,X,R+1).

occurs3(E,[H|T],Pos):-Pos==0,E=H.
occurs3(E,[H|T],Pos):-X is Pos - 1,occurs3(E,T,X).

/**
------------------------------------------------------------
----------------------Test Cases----------------------------
------------------------------------------------------------

------------------------------------------------------------
myLast Test cases:

empty-list test case
myLast(X,[]). --> expected output false
actual output: false

one-element test case
mylast(X,[hello]). ---> expected output: X = hello;
actual output: mylast(X,[hello]) ;

assignment provided test case
myLast(X,[how,are,you,today]). ----->expected output: X=today;
actual output: X = today ;
------------------------------------------------------------

------------------------------------------------------------
after Test cases:

X occurs as first element
after(a,[a,b,d],R). ---> expected output: R = [b,d];
actual output: R = [b, d] ;

X occurs in the middle of the list
after(a,[c,a,b,d],R). ----> expected output: R =[b,d];
actual output -----> R = [b, d] ;

test case provided in example
after(a, [b,a,x,d,a,f,g],R). expected out ---> R = [x,d,a,f,g], R = [f,g].
R = [x, d, a, f, g] ;
R = [f, g] ;
------------------------------------------------------------

------------------------------------------------------------
nextto Test cases:

first two elemets are next to
nextto(a,b,[c,a,b,d]). --->expected output: true

elements are not next to each other
nextto(a,b,[c,a,d,b]) ---> expected out put: false
------------------------------------------------------------

------------------------------------------------------------
occurs_at_position test cases:

?- occurs_at_position(x,[a,b,c,x,x,d,e],4). ---> expected output True
True
?- occurs_at_position(x,[a,b,c,x,x,d,e],Pos). ---> expected output Pos=3,Pos=4
Pos = 3;
Pos = 4;
?- occurs_at_position(X,[a,b,c,x,x,d,e],2). ----> expected output X = c
X = c
------------------------------------------------------------
*/