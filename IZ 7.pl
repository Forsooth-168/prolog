:-dynamic country/2, form/2, color/2, whenFounded/2, porous/2.

akinator:- readChocolatesFromFile, q1(A1), q2(A2), q3(A3), q4(A4), q5(A5), determineChocolate(A1,A2,A3,A4,A5), removeFacts, !.

readChocolatesFromFile:- see('chocolates.txt'), rcff, seen.
rcff:- readln(Chocolate), Chocolate \= [], readln(Answers), assertFacts(Chocolate, Answers), rcff.
rcff:- !.

/*���������� ������ � ���� ������*/
assertFacts(Chocolate,Answers):- elemByIndex(Answers,1,A1), asserta(country(Chocolate,A1)), elemByIndex(Answers,2,A2), asserta(form(Chocolate,A2)), elemByIndex(Answers,3,A3), asserta(color(Chocolate,A3)), elemByIndex(Answers,4,A4), asserta(whenFounded(Chocolate,A4)), elemByIndex(Answers,5,A5), asserta(porous(Chocolate,A5)).

elemByIndex(List, Ind, Elem):- elemByIndex(List, 1, Ind, Elem).
elemByIndex([], _, _, _):- !, fail.
elemByIndex([H|_],Ind, Ind, H):- !.
elemByIndex([_|T], CurInd, Ind, X):- NewInd is CurInd + 1, elemByIndex(T, NewInd, Ind, X).

q1(A1):- write("1.����� ������ ����������� ������ �����?"),
nl, write("1.��������"),
nl, write("2.������"),
nl, write("3.���������"),
nl, write("4.�������"),
nl, write("5.�������"),
nl, write("6.��������"),
nl, read(A1).

q2(A2):- write("2.������ ����� ������?"),
nl, write("1.����������"),
nl, write("2.�������������"),
nl, write("3.�� ���� �� ����������������� ���������"),
nl, read(A2).

q3(A3):- write("3.�����(-��) ��������(-��) ����(�) �������?"),
nl, write("1.����� ���� ����� � ����������� �� �����"),
nl, write("2.����������"),
nl, write("3.����������"),
nl, write("4.�������"),
nl, write("5.�������"),
nl, write("6.������"),
nl, write("7.������ � ������"),
nl, write("8.�����"),
nl, write("9.�� ���� �� ������������� ���������"),
nl, read(A3).

q4(A4):- write("4.����� �������� ������ �����?"),
nl, write("1.� ������ �������� 19-�� ����"),
nl, write("2.�� ������ �������� 19-�� ����"),
nl, write("3.� ������ �������� 20-�� ����"),
nl, write("4.�� ������ �������� 20-�� ����"),
nl, write("5.� 2000-�"),
nl, read(A4).

q5(A5):- write("5.��� ������� ����� ���� ��������?"),
nl, write("1.��"),
nl, write("2.���"),
nl, read(A5).

/*�������� ������� ������������*/
determineChocolate(A1,A2,A3,A4,A5):- country(Chocolate,A1), form(Chocolate,A2), color(Chocolate,A3), whenFounded(Chocolate,A4), porous(Chocolate,A5), write("�� �������� "), write_str(Chocolate), !.
determineChocolate(A1,A2,A3,A4,A5):-write("������ �� ��� ������ � ���� ������. ������ ��������?\n1.��\n2.���\n"), read(A), checkAnswer(A,[A1,A2,A3,A4,A5]).

/*��������, ����� �� ������������ �������� ������*/
checkAnswer(1,List):- write("������� �������� ������: "), read_str(Chocolate), addChocolate(Chocolate,List).
checkAnswer(_,_):- !.

addChocolate(Chocolate,List):- append('chocolates.txt'), nl, name(Choc,Chocolate), write(Choc), nl, write_list(List), told.

/*�������� ������*/
removeFacts:- removeCountry, removeForm, removeColor, removeWhenFounded, removePorous.

removeCountry:- repeat,(country(X,Y) -> retract(country(X,Y)), fail;X=nil,Y=nil, !).

removeForm:- repeat,(form(X,Y) -> retract(form(X,Y)), fail;X=nil,Y=nil, !).

removeColor:- repeat,(color(X,Y) -> retract(color(X,Y)), fail;X=nil,Y=nil, !).

removeWhenFounded:- repeat,(whenFounded(X,Y) -> retract(whenFounded(X,Y)), fail;X=nil,Y=nil, !).

removePorous:- repeat,(porous(X,Y) -> retract(porous(X,Y)), fail;X=nil,Y=nil, !).

write_list([]):-!.
write_list([H|T]):- write(H), write(" "), write_list(T).

read_str(A):-get0(X),get0(X1),r_str(X1,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).


write_str([]):-!.
write_str([H|T]):- write(H), write(" "), write_str(T).
