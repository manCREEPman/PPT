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

% Предикат, возвращающий true, если переданный элемент есть в списке,
% false иначе
isElemInList([], _):- !, fail.
isElemInList([Elem|_], Elem):- !, true.
isElemInList([_|T], Elem):- isElemInList(T, Elem).

% Предикат, возвращающий список, где элементы не повторяются
getUniqueElemsList(List, ResultList):- getUniqueElemsList(List, [], ResultList).
getUniqueElemsList([], ResultList, ResultList):- !.
getUniqueElemsList([H|T], NewList, ResultList):-
    isElemInList(NewList, H), !,
    getUniqueElemsList(T, NewList, ResultList).
getUniqueElemsList([H|T], NewList, ResultList):-
    append(NewList, [H], NewList1),
    getUniqueElemsList(T, NewList1, ResultList).


% Предикат, принимающий список и возвращающий список без элементов,
% которые повторялись
getListWithoutRepeat(List, ResultList):- getListWithoutRepeat(List, [], ResultList).
getListWithoutRepeat([], ResultList, ResultList):- !.
getListWithoutRepeat([H|T], NewList, ResultList):-
    checkNoRepeating([H|T], H),
    append(NewList, [H], NewList1), !,
    getListWithoutRepeat(T, NewList1, ResultList).
getListWithoutRepeat([H|T], NewList, ResultList):-
    delete([H|T], H, CutedList),
    getListWithoutRepeat(CutedList, NewList, ResultList).


ind2:- writeln('Size of 1st list'),read(Size1),
    writeln('Enter 1st list'), readList(List1, Size1),
    writeln('Size of 2nd list'), read(Size2),
    writeln('Enter 2nd list'), readList(List2, Size2),
    getListWithoutRepeat(List1, WRList1),
    getListWithoutRepeat(List2, WRList2),
    append(WRList1, WRList2, PreResultList),
    getUniqueElemsList(PreResultList, ResultList),
    writeln(ResultList).

























