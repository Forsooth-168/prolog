build_list:- write('Количество элементов первого списка: '),read(N1), write('Введите элементы первого списка'), read_list(List1, N1), write('Количество элементов второго списка: '), read(N2), write('Введите элементы второго списка'), read_list(List2, N2), filter(List1, ResList1), filter(List2, ResList2), main(ResList1, ResList2, Result1), main(ResList2, ResList1, Result2), append(Result1, Result2, List), write(List).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X),append(List,[X],List1),
						read_list(List1,A,I1,N).

main(List1, List2, ResultList):- main(List1, List2, [], ResultList).
main([], _, CurList, CurList):-!.
main([H|T], List2, CurList, ResultList):- not(contains(List2, H)), append([H], CurList, NewList), main(T, List2, NewList, ResultList),!.
main([_|T], List2, CurList, ResultList):- main(T, List2, CurList, ResultList).


filter(List, ResultList):- unique_elems(List,ResultList).
unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):- not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList), !.
unique_elems([H|T], List, CurList):- remove_from_list(CurList, H, NewList), unique_elems(T, List, NewList).

remove_from_list([], _, []):-!.
remove_from_list(List, Elem, ResultList):- remove_from_list(List, Elem, [], ResultList).
remove_from_list([], _, CurList, CurList):- !.
remove_from_list([H|T], H, CurList, ResultList):- append(CurList, T, ResultList),!.
remove_from_list([H|T], Elem, CurList, ResultList):- append(CurList, H, NewList), remove_from_list(T, Elem, NewList, ResultList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).
