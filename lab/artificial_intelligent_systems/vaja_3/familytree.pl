% Male members
male(gasper).
male(andrej).
male(jakob).
male(gidio).
male(nikola).
male(gino).

% Female members
female(suzana).
female(urska).
female(daniela).
female(palma).
female(zoja).
female(ela).
female(erzika).

% Moji starsi
parent(andrej, gasper).
parent(andrej, jakob).
parent(suzana, gasper).
parent(suzana, jakob).
%strici-sestricne
parent(nikola, zoja).
parent(nikola, ela).
parent(urska, zoja).
parent(urska, ela).
% nonoti
parent(gidio, andrej).
parent(gidio, nikola).
parent(palma, andrej).
parent(palma, nikola).
parent(gino, suzana).
parent(gino, daniela).
parent(erzika, suzana).
parent(erzika, daniela).

%relacije
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2).
    
grandparent(GP, GC) :-
    parent(GP, P),
    parent(P, GC).

grandmother(GM, GC) :-
    female(GM),
    grandparent(GM, GC).

grandfather(GF, GC) :-
    male(GF),
    grandparent(GF, GC).

aunt(A, N) :-
    female(A),
    sibling(A, P),
    parent(P, N).

uncle(U, N) :-
    male(U),
    sibling(U, P),
    parent(P, N).

nephew(N, A) :-
    male(N),
    sibling(P, A),
    parent(P, N).

niece(N, A) :-
    female(N),
    sibling(P, A),
    parent(P, N).
     

