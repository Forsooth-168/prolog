iz5:- write('Введите n: '), read(N), write('Введите k: '), read(K), tell('file.txt'), choose_letters1([a,b,c,d,e,f], N, K).
iz5:- told.

/*Выбор трех букв, которые будут повторятся по 2 раза*/
choose_letters1(List, N, K):- sochet(ResList1, 3, List), append(ResList1, ResList2, List), choose_letters2(ResList1,ResList2,N,K).

/*Выбор буквы, которая будет повторяться K раз*/
choose_letters2(ChosenLetters,RestLetters,N,K):- sochet(LetterK,1,RestLetters), append(LetterK,RestLetters2,RestLetters), build_all_razm(N,K,RestLetters2,ChosenLetters,LetterK).

/*Выбор букв, которые встречаются не более 1 раза*/
build_all_razm(N,K,Letters,Letters2,LetterK):- NewN is N - K - 6, b_a_r(Letters,0, NewN,[],K,Letters2,LetterK).
b_a_r(_,N1,N1,Razm,K,Letters2,LetterK):- perm_p(Razm,Letters2,LetterK,K).
b_a_r([],_,_,_,_,_,_):- !,fail.
b_a_r(Letters,Counter,N1,CurRazm,K,Letters2,LetterK):- in_list_exlude(Letters,El,Letters1), Counter1 is Counter + 1, b_a_r(Letters1,Counter1,N1,[El|CurRazm],K,Letters2,LetterK).

sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).

perm_p(Word,Letters2,LetterK,K):- perm_p1(Letters2,0,LetterK,K,Word).

perm_p1([],_,LetterK,K,Word):- perm_p2(LetterK,0,K,Word).
perm_p1([_|T],2,LetterK,K,Word):- perm_p1(T,0,LetterK,K,Word).
perm_p1([H|_],Counter,LetterK,K,CurWord):- insert_rep_let(H, CurList, CurList1), NewCounter2 is Counter2 + 1, perm_p(_, N1, N1, Char2, NewCounter2, N2, CurList1), !.
perm_p(Char1, Counter1, N1, Char2, 0, N2, CurList):- insert_rep_let(Char1, CurList, CurList1), NewCounter1 is Counter1 + 1, perm_p(Char1, NewCounter1, N1, Char2, 0, N2, CurList1).

insert_rep_let(El, [El|T], [El|Result]):- insert_rep_let(El, T, Result), !.
insert_rep_let(El, List, [El|List]).
insert_rep_let(El, [H|T], [H|Result]):- insert_rep_let(El, T, Result).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).


write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).



