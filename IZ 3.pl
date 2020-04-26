count_permutations(Path):- write('Введите слово: '), read(Word), see(Path), num_of_perms_in_file(Word, N), seen, write(N).

num_of_perms_in_file(Word, N):- readln(Str), num_of_perms_in_file(Word, Str, 0, N).
num_of_perms_in_file(_, [], CurN, CurN):- !.
num_of_perms_in_file(Word, CurStr, CurN, ResultN):- num_of_perms_in_str(Word, CurStr, N), NewN is CurN + N, readln(NewStr), num_of_perms_in_file(Word, NewStr, NewN, ResultN).

num_of_perms_in_str(_, [], 0):- !.
num_of_perms_in_str(Word, Str, ResultN):- num_of_perms_in_str(Word, Str, 0, ResultN).
num_of_perms_in_str(_, [], CurN, CurN):- !.
num_of_perms_in_str(Word, [H|T], CurN, ResultN):- is_permutation(Word, H), NewN is CurN + 1, num_of_perms_in_str(Word, T, NewN, ResultN), !.
num_of_perms_in_str(Word, [_|T], CurN, ResultN):- num_of_perms_in_str(Word, T, CurN, ResultN).

/*Проверка, является ли слово Word2 перестановкой слова Word1*/
is_permutation(Word1, Word2):- name(Word1, List1), name(Word2, List2), length(List1, Length1), length(List2, Length2), Length1 = Length2, are_same_chars(List1, List2).

are_same_chars(_,[]):- !.
are_same_chars([H|T], List2):- contains(List2, H), remove_from_list(List2, H, NewList2), are_same_chars(T, NewList2).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

remove_from_list([], _, []):-!.
remove_from_list(List, Elem, ResultList):- remove_from_list(List, Elem, [], ResultList).
remove_from_list([], _, CurList, CurList):- !.
remove_from_list([H|T], H, CurList, ResultList):- append(CurList, T, ResultList),!.
remove_from_list([H|T], Elem, CurList, ResultList):- append(CurList, [H], NewList), remove_from_list(T, Elem, NewList, ResultList).

