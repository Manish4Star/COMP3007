/**
q2.pl
Assignment 4, Question 2
The facts are listed below
I also created a cont function that was used in part C
queries and outputs can be found below
Abdul Bin Asif Niazi, 100917191
*/

actor(jonny, depp, gender(male)).
actor(bruce, willis, gender(male)).
actor(glenn, close, gender(female)).
actor(orlando, bloom, gender(male)).
actor(jennifer, lawrence, gender(female)).
actor(sean, bean, gender(male)).
actor(angelina, jolie, gender(female)).
actor(keira, knightley, gender(female)).
actor(benedict, cumberbatch, gender(male)).

movie(year(2003), title([pirates,of,the,carribean]), cast([actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)])).
movie(year(2001), title([lord,of,the,rings]), cast([actor(orlando, bloom), actor(sean, bean)])).
movie(year(1988), title([die,hard]), cast([actor(bruce, willis)])).
movie(year(2014), title([the,imitation,game]), cast([actor(benedict, cumberbatch), actor(keira, knightley)])).
movie(year(2012), title([the,hunger,games]), cast([actor(jennifer,lawrence)])).

aless([],[_|_]).
aless([X|_],[Y|_]):-X<Y.
aless([A|X],[B|Y]):-A=B,aless(X,Y).
aless(X,Y):-name(X,L),name(Y,M),aless(L,M).

cont([H|T],L):-member(H,L).
cont([H|T],L):-cont(T,L).


/**
------------------------------------------------------|
--------------QUERIES AND RESULS----------------------|
------------------------------------------------------|
-----------------------------------------------------------------
a) movie(year(X),Z,_),X>2002.
X = 2003,
Z = title([pirates, of, the, carribean]) ;
X = 2014,
Z = title([the, imitation, game]) ;
X = 2012,
Z = title([the, hunger, games]).
-----------------------------------------------------------------

-----------------------------------------------------------------
b) movie(_,title(X),_),member(of,X).
X = [pirates, of, the, carribean] ;
X = [lord, of, the, rings] ;
-----------------------------------------------------------------

-----------------------------------------------------------------
c) movie(_,title(X),_),movie(_,title(Y),_),X\=Y,cont(X,Y).
	cont([H|T],L):-member(H,L).
	cont([H|T],L):-cont(T,L).
	see line 29 of q2.pl
X = [pirates, of, the, carribean],
Y = [lord, of, the, rings] ;
X = [pirates, of, the, carribean],
Y = [lord, of, the, rings] ;
X = [pirates, of, the, carribean],
Y = [the, imitation, game] ;
X = [pirates, of, the, carribean],
Y = [the, hunger, games] ;
X = [lord, of, the, rings],
Y = [pirates, of, the, carribean] ;
X = [lord, of, the, rings],
Y = [pirates, of, the, carribean] ;
X = [lord, of, the, rings],
Y = [the, imitation, game] ;
X = [lord, of, the, rings],
Y = [the, hunger, games] ;
X = [the, imitation, game],
Y = [pirates, of, the, carribean] ;
X = [the, imitation, game],
Y = [lord, of, the, rings] ;
X = [the, imitation, game],
Y = [the, hunger, games] ;
X = [the, hunger, games],
Y = [pirates, of, the, carribean] ;
X = [the, hunger, games],
Y = [lord, of, the, rings] ;
X = [the, hunger, games],
Y = [the, imitation, game] ;
-----------------------------------------------------------------

-----------------------------------------------------------------
d) actor(X,Y,gender(Z)),Z=female.
X = glenn,
Y = close,
Z = female ;
X = jennifer,
Y = lawrence,
Z = female ;
X = angelina,
Y = jolie,
Z = female ;
X = keira,
Y = knightley,
Z = female ;
-----------------------------------------------------------------

-----------------------------------------------------------------
e) movie(_,T,cast(C)),actor(X,Y,gender(female)),member(actor(X,Y),C).
T = title([pirates, of, the, carribean]),
C = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
X = keira,
Y = knightley ;
T = title([the, imitation, game]),
C = [actor(benedict, cumberbatch), actor(keira, knightley)],
X = keira,
Y = knightley ;
T = title([the, hunger, games]),
C = [actor(jennifer, lawrence)],
X = jennifer,
Y = lawrence ;
-----------------------------------------------------------------

-----------------------------------------------------------------
f) movie(_,T,cast(C)),member(actor(orlando,bloom),C).
movie(_,T,cast(C)),member(actor(orlando,bloom),C).
-----------------------------------------------------------------

-----------------------------------------------------------------
g) movie(_,T,cast(X)),movie(_,Y,cast(Z)),T\=Y,member(actor(A,B),X),member(actor(A,B),Z).
T = title([pirates, of, the, carribean]),
X = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
Y = title([lord, of, the, rings]),
Z = [actor(orlando, bloom), actor(sean, bean)],
A = orlando,
B = bloom ;
T = title([pirates, of, the, carribean]),
X = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
Y = title([the, imitation, game]),
Z = [actor(benedict, cumberbatch), actor(keira, knightley)],
A = keira,
B = knightley ;
T = title([lord, of, the, rings]),
X = [actor(orlando, bloom), actor(sean, bean)],
Y = title([pirates, of, the, carribean]),
Z = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
A = orlando,
B = bloom ;
T = title([the, imitation, game]),
X = [actor(benedict, cumberbatch), actor(keira, knightley)],
Y = title([pirates, of, the, carribean]),
Z = [actor(jonny, depp), actor(keira, knightley), actor(orlando, bloom)],
A = keira,
B = knightley ;
-----------------------------------------------------------------

-----------------------------------------------------------------
h) 
-----------------------------------------------------------------

*/