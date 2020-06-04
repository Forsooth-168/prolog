:-dynamic country/2, form/2, color/2, whenFounded/2, porous/2.

akinator:- readChocolatesFromFile, q1(A1), q2(A2), q3(A3), q4(A4), q5(A5), determineChocolate(A1,A2,A3,A4,A5), removeFacts, !.

readChocolatesFromFile:- see('chocolates.txt'), rcff, seen.
rcff:-  readln(Chocolate), Chocolate \= [], readln(Answers), assertFacts(Chocolate, Answers), rcff.
rcff:- !.

/*Добавление фактов в базу данных*/
assertFacts(Chocolate,Answers):- elemByIndex(Answers,1,A1), asserta(country(Chocolate,A1)), elemByIndex(Answers,2,A2), asserta(form(Chocolate,A2)), elemByIndex(Answers,3,A3), asserta(color(Chocolate,A3)), elemByIndex(Answers,4,A4), asserta(whenFounded(Chocolate,A4)), elemByIndex(Answers,5,A5), asserta(porous(Chocolate,A5)).

elemByIndex(List, Ind, Elem):- elemByIndex(List, 1, Ind, Elem).
elemByIndex([], _, _, _):- !, fail.
elemByIndex([H|_],Ind, Ind, H):- !.
elemByIndex([_|T], CurInd, Ind, X):- NewInd is CurInd + 1, elemByIndex(T, NewInd, Ind, X).

q1(A1):- write("1.Какой стране принадлежит данный бренд?"),
    nl, write("1.Германии"),
    nl, write("2.России"),
    nl, write("3.Швейцарии"),
    nl, write("4.Америке"),
    nl, write("5.Украине"),
    nl, write("6.Британии"),
    nl, read(A1).

q2(A2):- write("2.Какова форма плитки?"),
    nl, write("1.Квадратная"),
    nl, write("2.Прямоугольная"),
    nl, write("3.Ни один из вышеперечисленных вариантов"),
    nl, read(A2).

q3(A3):- write("3.Какой(-ие) основной(-ые) цвет(а) обертки?"),
    nl, write("1.Может быть любым в зависимости от вкуса"),
    nl, write("2.Фиолетовый"),
    nl, write("3.Шоколадный"),
    nl, write("4.Голубой"),
    nl, write("5.Красный"),
    nl, write("6.Желтый"),
    nl, write("7.Желтый и черный"),
    nl, write("8.Белый"),
    nl, write("9.Ни один из перечисленных вариантов"),
    nl, read(A3).

q4(A4):- write("4.Когда появился данный бренд?"),
    nl, write("1.В первой половине 19-го века"),
    nl, write("2.Во второй половине 19-го века"),
    nl, write("3.В первой половине 20-го века"),
    nl, write("4.Во второй половине 20-го века"),
    nl, write("5.В 2000-х"),
    nl, read(A4).

q5(A5):- write("5.Ваш шоколад может быть пористым?"),
    nl, write("1.Да"),
    nl, write("2.Нет"),
    nl, read(A5).

/*Проверка ответов пользователя*/
determineChocolate(A1,A2,A3,A4,A5):- country(Chocolate,A1), form(Chocolate,A2), color(Chocolate,A3), whenFounded(Chocolate,A4), porous(Chocolate,A5), write("Вы загадали "), write_str(Chocolate), !.
determineChocolate(A1,A2,A3,A4,A5):-write("Объект не был найден в базе данных. Хотите добавить?\n1.Да\n2.Нет\n"), read(A), checkAnswer(A,[A1,A2,A3,A4,A5]).

/*Проверка, хочет ли пользователь добавить объект*/
checkAnswer(1,List):- write("Введите название бренда: "), read_str(Chocolate), addChocolate(Chocolate,List).
checkAnswer(_,_):- !.

addChocolate(Chocolate,List):- append('chocolates.txt'), nl, name(Choc,Chocolate), write(Choc), nl, write_list(List), told.

/*Удаление фактов*/
removeFacts:- removeCountry, removeForm, removeColor, removeWhenFounded, removePorous.

removeCountry:- repeat,(country(X,Y) -> retract(country(X,Y)), fail;X=nil,Y=nil, !).

removeForm:- repeat,(form(X,Y) -> retract(form(X,Y)), fail;X=nil,Y=nil, !).

removeColor:- repeat,(color(X,Y) -> retract(color(X,Y)), fail;X=nil,Y=nil, !).

removeWhenFounded:- repeat,(whenFounded(X,Y) -> retract(whenFounded(X,Y)), fail;X=nil,Y=nil, !).

removePorous:-  repeat,(porous(X,Y) -> retract(porous(X,Y)), fail;X=nil,Y=nil, !).

write_list([]):-!.
write_list([H|T]):- write(H), write(" "), write_list(T).

read_str(A):-get0(X),get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).


write_str([]):-!.
write_str([H|T]):- write(H), write(" "), write_str(T).
