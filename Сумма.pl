sumOfDigits(N,N):- X is N div 10, X = 0,!.
sumOfDigits(N,Sum):- C is N div 10, X is N mod 10, sumOfDigits(C,Z), Sum is X + Z,!.
