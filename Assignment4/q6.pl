/**
q6.pl
Assignment 4, Question 6
Test cases can be found below
Abdul Bin Asif Niazi, 100917191
*/

edge(a,b,2).
edge(b,c,2).
edge(c,d,2).
edge(a,d,2).
edge(e,a,2).

connected(X,Y):-edge(X,Y,_).
connected(X,Y):-edge(X,A,_),connected(A,Y).

pathLength(X,Y,R):-edge(X,Y,R).
pathLength(X,Y,R):-edge(X,A,D),pathLength(A,Y,T), R is D+T.

listForPath(X,Y,L):-append([edge(X,Y,T)],[],L),edge(X,Y,T).
listForPath(X,Y,L):-append([edge(X,A,T)],Q,L),edge(X,A,T),listForPath(A,Y,Q).

onPath(X,Y,E):-listForPath(X,Y,L),member(E,L).

/**
------------------------------------------------------------
----------------------Test Cases----------------------------
------------------------------------------------------------

------------------------------------------------------------
connected test cases

test case to check if two connected nodes are connected
connected(a,b) --->expected output true
actual output: true ;

test case to check if two nodes are connected using an intermediary node
connected(a,c) --->expected output true
actual output: true ;

test case to show that more than two paths connected two nodes
connected(a,d) --->expected output true.
actual output:
true ;
true ;
false .
------------------------------------------------------------

------------------------------------------------------------
pathLength test cases

test case for two connected nodes
pathLength(a,b,R), expected output: R = 2;
actual output: R = 2 ;

test case for two node connected by intermediary node
pathLength(a,c,R), expected output: R=4.
actual output: R = 4 ;
------------------------------------------------------------

------------------------------------------------------------
listForPath test cases

test case for connected nodes
listForPath(a,b,R) expected output R  =[edge(a,b,2)].
actual output: R = [edge(a, b, 2)] ;

test case for connected nodes using an intermediary node
listForPath(e,b,2), expected output: R=[edge(e,a,2), edge(a,b,2)].
actual output: R = [edge(e, a, 2), edge(a, b, 2)] ;
------------------------------------------------------------

------------------------------------------------------------
onPath test cases:

test case for an edge that is on the path
onPath(a,c,edge(b,c,_)) ---> expected output true
actual output: true ;

test case for an edge that is not on the path
onPath(a,c,edge(e,a,_)) ---> expected output false
actual output: false
------------------------------------------------------------
*/