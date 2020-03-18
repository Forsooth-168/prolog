sum:- read(N), read_list(A,N), sum_list(A,S), write(S).
read_list(A,N):- r_l([],A,0,N).
r_l(A,A,N,N):-!.
r_l(B,A,I,N):- I1 is I+1, read(X), append(B,[X],B1), r_l(B1,A,I1,N).

sum_list([],0):-!.
sum_list([Head|Tail],S):-sum_list(Tail,S1), S is S1+Head.

write_list([]):-!.
write_list([Head|Tail]):- write(Head), write_list(Tail).

leng(A,N):- len(A,0).
len([],L):- ,!.
len([_|Tail],A):-N1 is A+1, len(Tail,N1).
