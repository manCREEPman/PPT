fact(N, _):- N < 0, !.
fact(0, 1).
fact(1, 1).
fact(N, X):- fact(N, 1, 1, X).
fact(N, N, Mul, Mul):-!.
fact(N, I, Mul, X):- Mul1 is Mul * (I + 1), I1 is I + 1, fact(N, I1, Mul1, X).


sumEachNumberFact(Value, _):- Value < 3, !.
sumEachNumberFact(Value, Res):- sumEachNumberFact(Value, 0, Res).
sumEachNumberFact(0, Sum, Sum):-!.
sumEachNumberFact(Value, Sum, Res):-
    CurNum is Value mod 10,
    fact(CurNum, TempFact),
    Sum1 is Sum + TempFact,
    Value1 is Value div 10,
    sumEachNumberFact(Value1, Sum1, Res).

%2540160




