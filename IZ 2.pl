build_list:- write('Количество элементов первого списка: '),read(N1), write('Введите элементы первого списка'), read_list(List1, N1),
write('Количество элементов второго списка: '), read(N2), write('Введите элементы второго списка'), read_list(List2, N2),
unique_elems(List1, List2, ResList1, ResList2), unique_elems(ResList2, ResList1, ResList3, ResList4),
main(ResList3, ResList4, Result1), main(ResList4, ResList3, Result2), append(Result1, Result2, List), write(List).

read_list(A,N):-read_list([],A,0,N).
read_list(A,A,N,N):-!.
read_list(List,A,I,N):-	I1 is I+1,read(X),append(List,[X],List1),read_list(List1,A,I1,N).
main(List1, List2, ResultList):- main(List1, List2, [], ResultList).
main([], _, CurList, CurList):-!.
main([H|T], List2, CurList, ResultList):- not(contains(List2, H)), append([H], CurList, NewList), main(T, List2, NewList, ResultList),!.
main([_|T], List2, CurList, ResultList):- main(T, List2, CurList, ResultList).

unique_elems([], List2, [], List2):- !.
unique_elems(List1, List2, ResultList1, ResultList2):- unique_elems(List1, [], List2, ResultList1, ResultList2).
unique_elems([], CurList1, CurList2, CurList1, CurList2):- !.
unique_elems([H|T], [], CurList2, ResultList1, ResultList2):- unique_elems(T, [H], CurList2, ResultList1, ResultList2), !.
unique_elems([H|T], CurList1, CurList2, ResultList1, ResultList2):- not(contains(CurList1, H)), append(CurList1, [H], NewList), unique_elems(T, NewList, CurList2, ResultList1, ResultList2), !.
unique_elems([H|T], CurList1, CurList2, ResultList1, ResultList2):- remove_from_list(CurList1, H, NewList), remove_from_list(T, H, NewTail), remove_from_list(CurList2, H, NewList2), unique_elems(NewTail, NewList, NewList2, ResultList1, ResultList2).

remove_from_list([], _, []):-!.
remove_from_list(List, Elem, ResultList):- remove_from_list(List, Elem, [], ResultList).
remove_from_list([], _, CurList, CurList):- !.
remove_from_list([H|T], H, CurList, ResultList):- remove_from_list(T, H, CurList, ResultList),!.
remove_from_list([H|T], Elem, CurList, ResultList):- append(CurList, [H], NewList), remove_from_list(T, Elem, NewList, ResultList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

