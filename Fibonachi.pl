fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N1-1,fib(N1,X1),fib(N2,X2),X is X1+X2.
