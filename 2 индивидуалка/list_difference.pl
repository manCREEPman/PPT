% Предикат вывода списка на экран. Принимает список.
writeList([]):- !.
writeList([H|T]):- writeln(H), writeList(T).

% Предикат ввода списка с клавиатуры. Принимает переменную, в которую
% сохраняется список и его размерность
readList([], 0):- !.
readList([H|List], N):- read(H), N1 is N-1, readList(List, N1).

% Предикат проверки, повторяется ли элемент в списке
checkRepeating(List, Elem):- checkRepeating(List, Elem, 0).
checkRepeating([_|_], _, RepeatingCount):- RepeatingCount > 1, !.
checkRepeating([], _, 0):- fail.
checkRepeating([H|T], Elem, RepeatingCount):-
    checkRepeating(T, Elem, RepeatingCount).
checkRepeating([Elem|T], Elem, RepeatingCount):-
    RPC is RepeatingCount + 1,
    checkRepeating(T, Elem, RPC).



