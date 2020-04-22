count_sum:- count_sum(3, Sum), write(Sum),!.

count_sum(CurNum, Result):- count_sum(CurNum, 0, Result).
count_sum(10000000, CurSum, CurSum):-!.
count_sum(CurNum, CurSum, Result):- sum_of_fdigits(CurNum, Sum), CurNum = Sum, NewSum is CurSum + CurNum, NewNum is CurNum+1, count_sum(NewNum, NewSum, Result).
count_sum(CurNum, CurSum, Result):- NewNum is CurNum + 1, count_sum(NewNum, CurSum, Result).

sum_of_fdigits(Num, Result):- sum_of_fdigits(Num, 0, Result).
sum_of_fdigits(0, CurSum, CurSum):-!.
sum_of_fdigits(Num, CurSum, Result):- R is Num mod 10, fact(R, F), NewSum is CurSum + F, Num1 is Num div 10, sum_of_fdigits(Num1, NewSum, Result).

fact(0,1).
fact(1,1).
fact(2,2).
fact(3,6).
fact(4,24).
fact(5,120).
fact(6,720).
fact(7,5040).
fact(8,40320).
fact(9,562880).
