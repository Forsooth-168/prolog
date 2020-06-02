iz5:- write('Введите n: '), read(N), write('Введите k: '), read(K), tell('file.txt'), /*trace,*/ choose_letters1([a,b,c,d,e,f], N, K).
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

/*Построение перестановок с повторениями из выбранных букв*/
perm_p(Word,Letters2,LetterK,K):- perm_p1(Letters2,0,LetterK,K,Word).

perm_p1([],_,[LetterK|_],K,Word):- perm_p2(LetterK,0,K,Word).
perm_p1(_,Counter,_,_,_):- Counter > 2, !, fail.
perm_p1([_|T],2,LetterK,K,Word):- perm_p1(T,0,LetterK,K,Word).
perm_p1([H|T],Counter,LetterK,K,CurWord):- insert_rep_let(H, CurWord, CurWord1), Counter1 is Counter + 1, perm_p1([H|T],Counter1,LetterK,K,CurWord1),!.

perm_p2(_,Counter,K,_):- Counter > K, !, fail.
perm_p2(_,K,K,Word):- write_str(Word), write("\n"), !, fail.
perm_p2(LetterK,Counter,K,Word):- insert_rep_let(LetterK,Word,Word1), Counter1 is Counter+1, perm_p2(LetterK,Counter1,K,Word1).

insert_rep_let(El, [El|T], [El|Result]):- insert_rep_let(El, T, Result), !.
insert_rep_let(El, List, [El|List]).
insert_rep_let(El, [H|T], [H|Result]):- insert_rep_let(El, T, Result).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).



