/**
q2.pl
Assignment 4, Question 2
The facts are listed below
I also created a cont function that was used in part C
queries and outputs can be found below
Abdul Bin Asif Niazi, 100917191
*/

male(ahad).
male(majid).
male(jazib).
male(masroor).
male(jehanzeb).
female(huma).
female(sarwar).
female(uzma).
female(seema).
parent(majid,jehanzeb).
parent(sarwar,jehanzeb).
parent(huma,ahad).
parent(seema,jazib).
parent(masroor,jazib).
parent(majid,seema).
parent(majid,huma).
parent(majid,uzma).
parent(sarwar,seema).
parent(sarwar,huma).
parent(sarwar,uzma).
father(majid,jehanzeb).
father(majid,seema).
father(masroor,jazib).
father(majid,huma).
father(majid,uzma).
mother(sarwar,jehanzeb).
mother(sarwar,seema).
mother(sarwar,huma).
mother(sarwar,uzma).
mother(seema,jazib).
mother(huma,ahad).
married(majid,sarwar).
married(masroor,seema).

different(X,Y):- X\=Y.
is_mother(X):- mother(X,Y), female(X).
is_father(X):- father(X,Y).
sister(X,Y):- different(X,Y),female(X),(parent(Z,X),parent(Z,Y)).
brother(X,Y):- different(X,Y),male(X),(parent(Z,X),parent(Z,Y)).
aunt(X,Y):-different(X,Y),female(X),(parent(Z,Y), sister(X,Z)).
uncle(X,Y):-different(X,Y),male(X),(parent(Z,Y), brother(X,Z)).
grandfather(X,Y):-different(X,Y),male(X),(parent(Z,Y), parent(X,Z)).
grandmother(X,Y):-different(X,Y),female(X),(parent(Z,Y), parent(X,Z)).
ancestor(X,Y):-different(X,Y),parent(X,Y).
ancestor(X,Y):-different(X,Y),parent(Z,Y),ancestor(X,Z).

/**
------------------------------------------------------------
----------------------Test Cases----------------------------
------------------------------------------------------------

------------------------------------------------------------
test case different:
X = male(ahad), Y = male(majid), different(X,Y).
expected output: true
actual output:
X = male(ahad),
Y = male(majid).

test for is_mother
is_mother(huma).
expected output: true
actual output: true.

test for is_father
is_father(majid).
expected output: true
actual output: 
true ;
true ;
true ;
true.

test for brother
brother(jehanzeb,huma).
expected output: true
actual output:
true ;
true.

test for sister
sister(huma,uzma).
expected output: true.
actual output: 
true ;
true.

test for aunt
aunt(uzma, ahad).
expected output: true.
actual output: 
true;
true.

test for uncle
uncle(jehanzeb,ahad).
expected outout: true
actual output:
true ;
true.

test for grandfather
grandfather(majid,ahad)
expected output: true.
actual output:
true ;

test for grandmother
grandmother(sarwar,ahad).
expected output: true
actual output:
true ;

test for ancestor:
ancestor(majid,jazib).
expected output: true
actual outut:
true ;

------------------------------------------------------------
*/