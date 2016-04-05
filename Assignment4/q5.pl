/**
q5.pl
Assignment 4, Question 5
Test cases can be found below
Abdul Bin Asif Niazi, 100917191
*/

myAppend([],L,L). 
myAppend([H|T],L2,[H|L3]):-myAppend(T,L2,L3).

myLast(X,L):-myAppend(_,X,L).

nextTo(X,Y,L):-myAppend(_,[X,Y|_],L).

myReverse([],[]).
myReverse([H|T],R1):- myReverse(T,R2), myAppend(R2,[H],R1). 

/**
------------------------------------------------------------
----------------------Test Cases----------------------------
------------------------------------------------------------

------------------------------------------------------------
myAppend Test cases:

append empty-list test case
myAppend([a,b],[],L) ----> expected output: L=[a,b];
actual output: L = [a, b].

append 2 lists test case
myAppend([a,b],[c,d],L) ---> expected output:L=[a,b,c,d]
L = [a, b, c, d].
------------------------------------------------------------

------------------------------------------------------------
myLast Test cases:

myLast(X,[how,are,you,today]) --->expected output: X=today;
actual output:
X = [how, are, you, today] ;
X = [are, you, today] ;
X = [you, today] ;
X = [today] ;
X = [] ;
------------------------------------------------------------

------------------------------------------------------------
nextto test cases

nextto(a,b, [c,a,b,d]) ---> expected output true
actual output true ;
------------------------------------------------------------

------------------------------------------------------------
myReverse test cases

myReverse([1,2,3,4,5],L) --->expected output L = [5,4,3,2,1]
actual output L = [5, 4, 3, 2, 1].
------------------------------------------------------------

*/