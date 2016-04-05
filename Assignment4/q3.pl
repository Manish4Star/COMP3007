/**
q4.pl
Assignment 4, Question 4
Test cases can be found below
Abdul Bin Asif Niazi, 100917191
*/

%base case
hanoi(1,Left,Right,Centre) :-  
    write('Pick top disk from '), 
    write(Left), 
    write(' and place on '), 
    write(Right), 
    nl.

%recursive cases 
hanoi(N,Left,Right,Centre) :- 
    N>1, 
    M is N-1, 
    hanoi(M,Left,Centre,Right), 
    hanoi(1,Left,Right,_), 
    hanoi(M,Centre,Right,Left).

/**
------------------------------------------------------------
----------------------Test Cases----------------------------
------------------------------------------------------------

------------------------------------------------------------
test case for base case, N = 1
hanoi(1,l,r,c)
expected output: pick top from l and place or r
actual output: Pick top disk from l and place on r
true .

test case for n = 2
hanoi(2,left,right,centre)
expected output:
- pick top from left and place on centre
- pick top from left and place on right
- pick top from centre and placen on right
actual output:
Pick top disk from left and place on centre
Pick top disk from left and place on right
Pick top disk from centre and place on right
true 

test case for n = 3
hanoi(3,left,right,centre).
expected output:
- pick top from left, place on right
- pick top from left and place on centre
- pick top from right and place on centre
- pick top from left and place on right
- pick top from centre and place on left
- pick top from centre and place on right
- pick top from left and place on right

actual output:
Pick top disk from left and place on right
Pick top disk from left and place on centre
Pick top disk from right and place on centre
Pick top disk from left and place on right
Pick top disk from centre and place on left
Pick top disk from centre and place on right
Pick top disk from left and place on right
true ;
false.
------------------------------------------------------------
*/