% 2540160 - верхняя граница числа, когда сумма факториалов цифр будет
% меньше самого числа

% Предикат, считающий факториал числа положительного числа.
fact(N, _):- N < 0, !.
fact(0, 1).
fact(1, 1).
fact(N, X):- fact(N, 1, 1, X).
fact(N, N, Mul, Mul):-!.
fact(N, I, Mul, X):- Mul1 is Mul * (I + 1), I1 is I + 1, fact(N, I1, Mul1, X).

% Предикат, считающий сумму факториалов цифр числа.
% На вход подаётся число, затем последовательно выделяются его цифры,
% вычисляются их факториалы и суммируются.
sumEachNumberFact(Value, Res):- Value < 3, Res is 0, !.
sumEachNumberFact(Value, Res):- sumEachNumberFact(Value, 0, Res).
sumEachNumberFact(0, Sum, Sum):-!.
sumEachNumberFact(Value, Sum, Res):-
    CurNum is Value mod 10,
    fact(CurNum, TempFact),
    Sum1 is Sum + TempFact,
    Value1 is Value div 10,
    sumEachNumberFact(Value1, Sum1, Res), !.

% Предикат, инкрементирующий число.
inc(X, Res):- Res is X + 1, !.

% Предикат, перебирающий числа от стартового до 2540160 и суммирующий
% числа, являющиеся факторионами.
sumOfFactorions(X, Sum):- sumOfFactorions(X, 0, Sum).
sumOfFactorions(2540160, Sum, Sum):-!.
sumOfFactorions(X, CurSum, Sum):-
    sumEachNumberFact(X, SumFactX),
    SumFactX = X,
    CurSum1 is CurSum + X,
    inc(X, X1),
    sumOfFactorions(X1, CurSum1, Sum), !.
sumOfFactorions(X, CurSum, Sum):-
    inc(X, X1),
    sumOfFactorions(X1, CurSum, Sum), !.


ind1:- writeln("Факторион - число, равное сумме факториалов своих цифр."),
    writeln("Верхняя граница - 2540160"),
    sumOfFactorions(3, Sum), write(Sum).

