% Предикат ввода списка с клавиатуры. Принимает переменную, в которую
% сохраняется список и его размерность
readList([], 0):- !.
readList([H|List], N):- read(H), N1 is N-1, readList(List, N1).

% Предикат, принимающий список и элемент. Если элемент не повторяется в
% списке, то возвращает true, иначе false
checkNoRepeating([], _):- !, fail.
checkNoRepeating([H|T], Elem):- checkNoRepeating([H|T], Elem, 0), !.
checkNoRepeating(_, _, 2):- !,fail.
checkNoRepeating([],_,_):-!.
checkNoRepeating([Elem|T], Elem, Count):-
    Count1 is Count + 1,!,
    checkNoRepeating(T, Elem, Count1).
checkNoRepeating([_|T], Elem, Count):-
    checkNoRepeating(T, Elem, Count).

% Предикат, принимающий список и возвращающий список без элементов,
% которые повторялись
getListWithoutRepeat(List, ResultList):-
    getListWithoutRepeat(List, [], ResultList).
getListWithoutRepeat([], ResultList, ResultList):- !.
getListWithoutRepeat([H|T], NewList, ResultList):-
    checkNoRepeating([H|T], H),
    append(NewList, [H], NewList1), !,
    getListWithoutRepeat(T, NewList1, ResultList).
getListWithoutRepeat([H|T], NewList, ResultList):-
    delete([H|T], H, CuttedList),
    getListWithoutRepeat(CuttedList, NewList, ResultList).


ind2:- writeln('Size of 1st list'),read(Size1),
    writeln('Enter 1st list'), readList(List1, Size1),
    writeln('Size of 2nd list'), read(Size2),
    writeln('Enter 2nd list'), readList(List2, Size2),
    append(List1, List2, ListUnion),
    getListWithoutRepeat(ListUnion, ResultList),
    writeln(ResultList).

























