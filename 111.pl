pr_list(A,Pr):-pr_list(A,Pr,1).
pr_list([],Pr,Pr).
pr_list([Head|Tail],Pr,P):-P1 is P*Head,pr_list(Tail,Pr,P1).
f(0,1):-!.
f(X,Y):-not(X=<0),X1 is X-1,f(X1,Y1),Y is Y1*X.
no(P):-P,!,fail.
no(_).
append1([],X,X).
append1([H|T],X,[H |Z]):-append1(T,X,Z).

w_list([H]):-write(H),!.
w_list([H|T]):-write(H),write(", "),w_list(T).

read_word(A):-get0(X),r_w(X,A,[]).
r_w(32,A,A):-!.
r_w(X,A,B):-append(B,[X],B1),get0(X1),r_w(X1,A,B1).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr_lec3_1:-read_str(A,N),write("vsego "),write(N),nl,w_list(A).

pr5_1:- read_str(A,N),write_str(A),write(', '),write_str(A),write(', '),write_str(A),write(', '),write(N).
write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

pr5_2:- read_str(A,_), find_words_count(A,0,C,0), write(C),!.
find_words_count([],I,I,_):-!.
find_words_count([32|T],I,C,_):-find_words_count(T,I,C,0),!.
find_words_count([_|T],I,C,1):-find_words_count(T,I,C,1),!.
find_words_count([_|T],I,C,0):-I1 is I+1,find_words_count(T,I1,C,1),!.































