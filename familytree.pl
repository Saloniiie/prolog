male(papa).
male(nana).
male(dada).
male(bhai).
male(m1).
male(m2).
male(m3).
male(m4).

female(mummy).
female(me).
female(nani).
female(dadi).
female(f1).
female(f2).
female(f3).
female(f4).

parent(papa, me).
parent(mummy, me).
parent(papa, bhai).
parent(mummy, bhai).

parent(nana, mummy).
parent(nani, mummy).

parent(dada, papa).
parent(dadi, papa).

parent(m1, nana).
parent(f1, nana).

parent(m2, nani).
parent(f2, nani).

parent(m3, dada).
parent(f3, dada).

parent(m4, dadi).
parent(f4, dadi).


father(X,Y):- male(X), parent(X,Y).
mother(X,Y):- female(X), parent(X,Y).

husband(X,Y):- father(X,Z), mother(Y,Z).
wife(Y,X):- father(X,Z), mother(Y,Z).

brother(X,Y):- male(X), parent(Z,X), parent(Z,Y), \+(X==Y).
sister(X,Y):- female(X), parent(Z,X), parent(Z,Y), \+(X==Y).

grandfather(X,Y):- male(X), parent(X,Z), parent(Z,Y).
grandmother(X,Y):- female(X), parent(X,Z), parent(Z,Y).

ancestor(X,Y):- grandfather(X,Z), parent(Z,Y).
ancestor(X,Y):- grandmother(X,Z), parent(Z,Y).

has_blue_eyes(mummy).

blue_eyes(X):- parent(Y, X), has_blue_eyes(Y).

% findall(A,blue_eyes(A),Result).