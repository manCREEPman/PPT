% set_prolog_flag(stack_limit, 8_589_934_592).
% ��������, ����������� ������ � ��������� ��� � ������� output �����
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

% �������� ��������� ������ �������, ��������� ������ ������ �� ��� �
% ������� output �����
write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

% �������� ��������� ������ � ���������� ������, ���������� ��������
% �������� ��� ��������� ������������ ��������� ���������� ������
makePermutations(List, PermutationsList):-
    findall(Permutation, permutation(List, Permutation), PermutationsList).

% �������� ��������� ������, ������ ������ ��� ��������� ������������,
% � ����� ������ �� ���� ���������, ������ ������������� ��������
makePermutationsSet(List, Set):-
    makePermutations(List, PermutationsList),
    list_to_set(PermutationsList, Set).

% �������� ��������� 2 �����: N - ����� �����, K - ���������� ����������
% ����� �� ���� � ����� (1 <= K <= n - 6). ���������� �������� ����
% ���������� ���� ��������
lastTwoValues(N, K, 0, 0):- N - 6 - K =:= 0, !.
lastTwoValues(N, K, 1, 0):- N - 6 - K =:= 1, !.
lastTwoValues(N, K, 1, 1):- N - 6 - K =:= 2, !.

% �������� ��������� 2 �����: N, K � ���������� ������, ����������
% ���������� ���������� ���� � ������
makeRepetitionsList(N, K, ResList):-
    lastTwoValues(N, K, Value1, Value2),
    TempList = [2, 2, 2],
    append(TempList, [Value1], TR),
    append(TR, [Value2], TR1),
    append(TR1, [K], ResList).

% �������� ��������� 2 �����: N, K � ���������� ��������� ������������
% ���������� ���������� ���� � �����
makeAlphasRepetitionsSet(N, K, Set):-
    makeRepetitionsList(N, K, List),
    makePermutationsSet(List, Set).

% �������� ��������� ������� Item, ����������� ������ List � ����������
% - ����� ���������� Item � List. ���������� ������ � ������������ N
% ����������
pushItemInListNTimes(_, List, List, 0):- !.
pushItemInListNTimes(Item, AdditingList, List, N):-
    N1 is N - 1,
    append(AdditingList, [Item], AdditingList1),
    pushItemInListNTimes(Item, AdditingList1, List, N1).

% �������� ��������� ������ � ������������ ���������� ���� � ���������
% ����� ���� ���������� ���� �� a �� f ���������� ���, ���������� �
% ������. ���������� �����, ��������� �� ����, ���������� ������� �
% ������ �� ���� 0
formWord(Word, RepetitionList):- formWord(Word, [], RepetitionList, 97).
formWord(Word, Word, [], _):- !.
formWord(Word, AdditingWord, [CurrentRepetition|Rest], Item):-
    pushItemInListNTimes(Item, AdditingWord, AdditingWord1, CurrentRepetition),
    Item1 is Item + 1,
    formWord(Word, AdditingWord1, Rest, Item1).

% �������� ��������� ����� � ���������� ��������� ��� ������������
makeWordPermutationsSet(Word,Set):- makePermutationsSet(Word, Set).

% �������� ��������� ������ ������������ ������ ���������� ����,
% ��������� �����, ����� ��������� ��� ������������, � ����� ����������
% ��� ������������ � ����
wordsFileWrite([]):- !.
wordsFileWrite([CurRepetitions|Rest]):-
    formWord(Word, CurRepetitions),
    makeWordPermutationsSet(Word, WordPermSet),
    append('D:/������/1.txt'),
    write_list_str(WordPermSet),
    told,
    wordsFileWrite(Rest).


ind5:- read(N), read(K),
    makeAlphasRepetitionsSet(N, K, RepSet),
    wordsFileWrite(RepSet).
