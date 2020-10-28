% 2540160 - верхн€€ граница числа, когда сумма факториалов цифр будет
% меньше самого числа

% ‘унктор, считающий факториал числа положительного числа.
fact(N, _):- N < 0, !.
fact(0, 1).
fact(1, 1).
fact(N, X):- fact(N, 1, 1, X).
fact(N, N, Mul, Mul):-!.
fact(N, I, Mul, X):- Mul1 is Mul * (I + 1), I1 is I + 1, fact(N, I1, Mul1, X).

% ‘унктор, считающий сумму факториалов цифр числа.
% Ќа вход подаЄтс€ число, затем последовательно выдел€ютс€ его цифры,
% вычисл€ютс€ их факториалы и суммируютс€.
sumEachNumberFact(Value, Res):- Value < 3, Res is 0.
sumEachNumberFact(Value, Res):- sumEachNumberFact(Value, 0, Res).
sumEachNumberFact(0, Sum, Sum):-!.
sumEachNumberFact(Value, Sum, Res):-
    CurNum is Value mod 10,
    fact(CurNum, TempFact),
    Sum1 is Sum + TempFact,
    Value1 is Value div 10,
    sumEachNumberFact(Value1, Sum1, Res).


inc(X, Res):- Res is X + 1, !.


sumOfFactorions(X, Sum):- sumOfFactorions(X, 0, Sum).
sumOfFactorions(5, Sum, Sum):-!.
sumOfFactorions(X, CurSum, Sum):-
    sumEachNumberFact(X, SumFactX),
    SumFactX = X,
    CurSum1 is CurSum + X,
    inc(X, X1),
    sumOfFactorions(X1, CurSum1, Sum).
sumOfFactorions(X, CurSum, Sum):-
    inc(X, X1),
    sumOfFactorions(X1, CurSum, Sum).


ind1:- sumOfFactorions(3, Sum).

