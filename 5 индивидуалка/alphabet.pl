% set_prolog_flag(stack_limit, 8_589_934_592).
% Предикат, принимающий список и выводящий его в текущий output поток
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

% Предикат принимает список списков, поочерёдно выводя каждый из них в
% текущий output поток
write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

% Предикат принимает список и возвращает список, элементами которого
% являются все возможные перестановки элементов начального списка
makePermutations(List, PermutationsList):-
    findall(Permutation, permutation(List, Permutation), PermutationsList).

% Предикат принимает список, создаёт список его возможных перестановок,
% а затем делает из него множество, удаляя повторяющиеся элементы
makePermutationsSet(List, Set):-
    makePermutations(List, PermutationsList),
    list_to_set(PermutationsList, Set).

% Предикат принимает 2 числа: N - длина слова, K - количество повторений
% одной из букв в слове (1 <= K <= n - 6). Возвращает значения двух
% оставшихся букв алфавита
lastTwoValues(N, K, 0, 0):- N - 6 - K =:= 0, !.
lastTwoValues(N, K, 1, 0):- N - 6 - K =:= 1, !.
lastTwoValues(N, K, 1, 1):- N - 6 - K =:= 2, !.

% Предикат принимает 2 числа: N, K и возвращает список, содержащий
% КОЛИЧЕСТВА повторений букв в словах
makeRepetitionsList(N, K, ResList):-
    lastTwoValues(N, K, Value1, Value2),
    TempList = [2, 2, 2],
    append(TempList, [Value1], TR),
    append(TR, [Value2], TR1),
    append(TR1, [K], ResList).

% Предикат принимает 2 числа: N, K и возвращает множество перестановок
% КОЛИЧЕСТВА ПОВТОРЕНИЙ букв в слове
makeAlphasRepetitionsSet(N, K, Set):-
    makeRepetitionsList(N, K, List),
    makePermutationsSet(List, Set).

% Предикат принимает элемент Item, дополняемый список List и количество
% - число добавления Item в List. Возвращает список с добавленными N
% элементами
pushItemInListNTimes(_, List, List, 0):- !.
pushItemInListNTimes(Item, AdditingList, List, N):-
    N1 is N - 1,
    append(AdditingList, [Item], AdditingList1),
    pushItemInListNTimes(Item, AdditingList1, List, N1).

% Предикат принимает список с количествами повторений букв и формирует
% слово путём добавления букв от a до f количество раз, переданное в
% списке. Возвращает слово, состоящее из букв, количество которых в
% списке не было 0
formWord(Word, RepetitionList):- formWord(Word, [], RepetitionList, 97).
formWord(Word, Word, [], _):- !.
formWord(Word, AdditingWord, [CurrentRepetition|Rest], Item):-
    pushItemInListNTimes(Item, AdditingWord, AdditingWord1, CurrentRepetition),
    Item1 is Item + 1,
    formWord(Word, AdditingWord1, Rest, Item1).

% Предикат принимает слово и возвращает множество его перестановок
makeWordPermutationsSet(Word,Set):- makePermutationsSet(Word, Set).

% Предикат принимает список перестановок списка ПОВТОРЕНИЙ букв,
% формирует слово, затем множество его перестановок, а затем записывает
% эти перестановки в файл
wordsFileWrite([]):- !.
wordsFileWrite([CurRepetitions|Rest]):-
    formWord(Word, CurRepetitions),
    makeWordPermutationsSet(Word, WordPermSet),
    append('D:/Андрей/1.txt'),
    write_list_str(WordPermSet),
    told,
    wordsFileWrite(Rest).


ind5:- read(N), read(K),
    makeAlphasRepetitionsSet(N, K, RepSet),
    wordsFileWrite(RepSet).
