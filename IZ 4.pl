iz4:- List = [_, _, _, _],
    (    in_list(List, [tocarev, slesar]); in_list(List, [tocarev, rezchik]); in_list(List, [tocarev, kuznec])),
    (   in_list(List, [rezchikov, kuznec]); in_list(List, [rezchikov, tocar]); in_list(List, [rezchikov, slesar])),
    ( in_list(List, [kuznecov, tocar]);  in_list(List, [kuznecov, rezchik]); in_list(List, [kuznecov, slesar])),
    (   in_list(List, [slesarev, rezchik]); in_list(List, [slesarev, tocar]); in_list(List, [slesarev, kuznec])),
    opposite(List, [kuznecov, _], [_, slesar]),
    opposite(List, [rezchikov, _], [_, rezchik]),
    on_right(List, [slesarev, _], [_, tocar]),
    on_left(List, [_, kuznec], [Who, Prof]),
    write(Who), write(','), write(Prof).

in_list([El|_], El).
in_list([_|T], El):- in_list(T, El).

opposite(List, El, OpposEl):- indexOf(List, El, Index), find_opposite(List, Index, OpposEl).

indexOf(List, El, Index):- indexOf(List, El, 0, Index).
indexOf([], _, _, -1).
indexOf([H|_], H, CurIndex, CurIndex):- !.
indexOf([_|T],El, CurIndex, Index):- NI is CurIndex + 1, indexOf(T, El, NI, Index).

find_opposite(List, 0, OpposEl):- elementByInd(List, 2, OpposEl), !.
find_opposite(List, 1, OpposEl):- elementByInd(List, 3, OpposEl), !.
find_opposite(List, 2, OpposEl):- elementByInd(List, 0, OpposEl), !.
find_opposite(List, 3, OpposEl):- elementByInd(List, 1, OpposEl).

elementByInd(List, Ind, Elem):- elementByInd(List, 0, Ind, Elem).
elementByInd([], _, _, _):- !, fail.
elementByInd([H|_],Ind, Ind, H):- !.
elementByInd(_, CurInd, Ind, _):- CurInd > Ind, !, fail.
elementByInd([_|T], CurInd, Ind, X):- NewInd is CurInd + 1, elementByInd(T, NewInd, Ind, X).

on_right([El|T], El, RightEl):- headOf(T, RightEl).
on_right([H|T], El, RightEl):- on_right(T, H, El, RightEl).
on_right([], Head, _, Head):-!.
on_right([El|T], _, El, RightEl):- headOf(T, RightEl), !.
on_right([_|T], Head, El, RightEl):- on_right(T, Head, El, RightEl).

headOf([H|_], H).

on_left([El|T], El, LeftElem):- last_elem(T, LeftElem).
on_left([H|T], El, LeftElem):- on_left(T, H, El, LeftElem).
on_left([El|_], PrevElem, El, PrevElem):- !.
on_left([H|T], _, El, LeftElem):- on_left(T, H, El, LeftElem).

last_elem([H|T], Elem):- last_elem(T, H, Elem).
last_elem([], LastElem, LastElem):-!.
last_elem([H|T], _, Elem):- last_elem(T, H, Elem).
