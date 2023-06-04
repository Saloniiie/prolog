% sum of two numbers
sum(X,Y,Z):- Z is X+Y.

% max of three numbers
max(A,B,C,X):- A>B, A>C, X is A; B>C, X is B; X is C.

% min of three numbers
min(A,B,C,X):- A<B, A<C, X is A; B<C, X is B; X is C.


% fibonacci series
fib(1,0).
fib(2,1).
fib(N,X):- N1 is N-1,N2 is N-2,fib(N1,X1),fib(N2,X2),X is X1+X2.


% gcd of two numbers
gcd(0,A,A).
gcd(A,0,A).
gcd(A,B,R):-B1 is mod(A,B),gcd(B,B1,R).


% power
power(Num,Pow,Ans):-Ans is Num^Pow.

% power loop
powerr(_,0,1).
powerr(N,P,R):- P1 is P-1, powerr(N,P1,R1), R is R1*N.


% multiply two numbers
multi(N1,N2,R):- R is N1*N2.


% factorial of a number
fact(0,1).
fact(M,N):- M1 is M-1, fact(M1,N1), N is M*N1.


% ==============================================================================================


% sum of the elements of a list
suml([], 0).
suml([H|T], N):- suml(T, N1), N is N1+H.


% length of a list
len([], 0).
len([_|T], N):- len(T, N1), N is N1 + 1.


% is member of list?
member([X|_], X).
member([_|T], X):- member(T, X).


% concat two lists
list_concat([],L,L).
list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3).


% reverse the list
rev([],[]).
rev([H|T],Rev):- rev(T,Rev1), list_concat(Rev1,[H],Rev).


% is palindome?
palindrome(L):- rev(L,L).


% length of a string is even or odd?
evenl(L):- len(L,N), 0 is N mod 2.
oddl(L):- len(L,N), 1 is N mod 2.


% same length of 2 lists
same_length([],[]).
same_length([_|L1],[_|L2]) :- same_length(L1, L2).


% nth element of a list
nth_element(0,[H|T],H).
nth_element(N,[H|T],X):- N1 is N-1,nth_element(N1,T,X).


% maximum element of a list
max_of_two(A,B,M) :- A>B, M is A; M is B.
list_max_elem([X],X).
list_max_elem([X,Y|Rest],Max) :- list_max_elem([Y|Rest],MaxRest), max_of_two(X,MaxRest,Max).


% insert an element at nth index in a list
insert_nth(E,L,0,[E|L]).
insert_nth(E,[H|L],N,[H|R]):- N1 is N-1, insert_nth(E,L,N1,R).


% delete an element from a list
list_delete(X, [X], []).
list_delete(X,[X|L1], L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).


% merge two sorted lists
merge(L, [], L).
merge([], L, L).
merge([H1|T1], [H2|T2], [H1|R]) :- H1 =< H2, merge(T1, [H2|T2], R).
merge([H1|T1], [H2|T2], [H2|R]) :- merge([H1|T1], T2, R).


% remove duplicate
remove_dup(L,M):-dupacc(L,[],M).
dupacc([],A,A).
dupacc([H|T],A,L):-member(A,H),dupacc(T,A,L),!.
dupacc([H|T],A,L):-dupacc(T,[H|A],L).


% sublist(L,S)
sublist([],[]).
sublist([First|Rest],[First|Sub]):- sublist(Rest,Sub).
sublist([_|Rest],Sub):-sublist(Rest,Sub).


% append (Let A is an element, L1 is a list, the output will be L1 also, when L1 has A already. Otherwise new list will be L2 = [A|L1].)
list_append(A,T,T) :- member(T,A),!.
list_append(A,T,[A|T]).


% permutation
list_perm([],[]).
list_perm(L,[X|P]) :- list_delete(X,L,L1),list_perm(L1,P).


% shift
list_shift([Head|Tail],Shifted) :- list_concat(Tail, [Head],Shifted).


% order operation
list_order([X, Y | Tail]) :- X =< Y, list_order([Y|Tail]).
list_order([X]).


% generate subsets
list_subset([],[]).
list_subset([Head|Tail],[Head|Subset]) :- list_subset(Tail,Subset).
list_subset([Head|Tail],Subset) :- list_subset(Tail,Subset).


% union
list_union([X|Y],Z,W) :- member(Z,X),list_union(Y,Z,W).
list_union([X|Y],Z,[X|W]) :- \+ member(Z,X), list_union(Y,Z,W).
list_union([],Z,Z).


% intersection
list_intersect([X|Y],Z,[X|W]) :- member(Z,X), list_intersect(Y,Z,W).
list_intersect([X|Y],Z,W) :- \+ member(Z,X), list_intersect(Y,Z,W).
list_intersect([],Z,[]).


% divide list (This operation divides a list into two lists, and these lists are of approximately same length. So if the given list is [a,b,c,d,e], then the result will be [a,c,e],[b,d]. This will place all of the odd placed elements into one list, and all even placed elements into another list.) 
list_divide([],[],[]).
list_divide([X],[X],[]).
list_divide([X,Y|Tail], [X|List1],[Y|List2]) :- list_divide(Tail,List1,List2).