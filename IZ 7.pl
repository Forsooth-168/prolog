:-dynamic country/2, form/2, color/2, whenFounded/2, porous/2.

akinator:- readChocolatesFromFile, q1(A1), q2(A2), q3(A3), q4(A4), q5(A5), determineChocolate(A1, A2, A3, A4, A5), removeFacts.

readChocolatesFromFile:- see("chocolates.txt"), readln(Chocolate), chocolate \= [], readln(Answers), assertFacts(Chocolate, Answers), readChocolatesFromFile.
readChocolatesFromFile:- seen.

/*Добавление фактов в базу данных*/
assertFacts(Chocolate,Answers):- elemByIndex(Answers,1,A1), asserta(country(Chocolate,A1)), elemByIndex(Answers,2,A2), asserta(form(Chocolate,A2)), elemByIndex(Answers,3,A3), asserta(country(Chocolate,A3)), elemByIndex(Answers,4,A4), asserta(country(Chocolate,A4)), elemByIndex(Answers,5,A5), asserta(country(Chocolate,A5)).

elemByIndex(List, Ind, Elem):- elemByIndex(List, 1, Ind, Elem).
elemByIndex([], _, _, _):- write("Слишком большой индекс"), !, fail.
elemByIndex([H|_],Ind, Ind, H):- !.
elemByIndex([_|T], CurInd, Ind, X):- NewInd is CurInd + 1, elemByIndex([T], NewInd, Ind, X).

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
