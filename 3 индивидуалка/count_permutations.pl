% ��������, �������� N ��������	�� ������
read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

% ��������, �������������� ���� ������ � ���������� �� ������� ��������
% ������
readUserWord(X):- get0(S),
	readUserWord([], X, S).
readUserWord(X, X, 10):- !.
readUserWord(Tail, X, S):- get0(S1),
	append(Tail, [S], NewStr),
	readUserWord(NewStr, X, S1).

% ��������, �������� ������ �������� �� ������
read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).

% ��������, ������������ ����� ����������� ������
listLen([], 0):- !.
listLen(List, Len):- listLen(List, 0, Len).
listLen([], Len, Len):- !.
listLen([_|Tail],CurLen, Len):-
	CurLen1 is CurLen + 1,
	listLen(Tail, CurLen1, Len).

% ���� �������� ���������� ���������
bubbleSort([], _):-!.
bubbleSort(List, SortedList):- bubbleSort(List, [], SortedList).
bubbleSort([], SortedList, SortedList):- !.
bubbleSort([H|[S|Tail]], NewList, SortedList):-
	H > S,
	append(NewList, [S], NewList1),
	append(NewList1, [H], NewList2), !,
	bubbleSort(Tail, NewList2, SortedList).
bubbleSort([H|[S|Tail]], NewList, SortedList):-
	append(NewList, [H], NewList1),
	bubbleSort([S|Tail], NewList1, SortedList).
bubbleSort([H], NewList, SortedList):-
	append(NewList, [H], NewList1),
	bubbleSort([], NewList1, SortedList).

% ����������� n-������� ���������� ���������
sortList([], []):-!.
sortList(List, SortedList):-
	listLen(List, Len),
	sortList(List, 0, Len, SortedList).
sortList(SortedList, Len, Len, SortedList):- !.
sortList(List, CurLen, Len, SortedList):-
	bubbleSort(List, TempSortedList),
	CurLen1 is CurLen + 1,
	sortList(TempSortedList, CurLen1, Len, SortedList), !.

% ��������, ����������� ��������� �������
equalLists([], []):- !.
equalLists([H1|_], [H2|_]):- H1 \= H2, !, fail.
equalLists([H|Tail], [H|Tail]):- !.

% ��������, ����������� ����� ������ � ������������ ����� �� ������� ���
% ����� ���� �����
getWordFromStringPiece([], [], []):- !.
getWordFromStringPiece(StrPiece, Word, RestStr):-
	getWordFromStringPiece(StrPiece,
			       [], Word,
			       [], RestStr).
getWordFromStringPiece([], Word, Word, RestStr, RestStr):- !.
getWordFromStringPiece([32|_], Word, Word, RestStr, RestStr):- !.
getWordFromStringPiece([H|[32|Tail]], CurrentWord, Word, _, RestStr):-
	append(CurrentWord, [H], CurrentWord1), !,
	getWordFromStringPiece([], CurrentWord1, Word, Tail, RestStr).
getWordFromStringPiece([H|Tail], CurrentWord, Word, _, RestStr):-
	append(CurrentWord, [H], CurrentWord1),
	getWordFromStringPiece(Tail, CurrentWord1, Word, Tail, RestStr).

% �������� ����������� ������, ���������������� �����, ������� ��������
% �������� ������������ ����� ����� � ������������ ��� ����������
% ��������, ���� � ������ ���������� ������������ �����������������
% �����
parseLine([], _, CountInLine, CountInLine):-!.
parseLine(List, UserWord, CurCount, CountInLine):-
	getWordFromStringPiece(List, Word, Rest),
	sortList(Word, SortedWord),
	equalLists(UserWord, SortedWord),
	CurCount1 is CurCount + 1, !,
	parseLine(Rest, UserWord, CurCount1, CountInLine).
parseLine(List, UserWord, CurCount, CountInLine):-
	getWordFromStringPiece(List, _, Rest),
	parseLine(Rest, UserWord, CurCount, CountInLine).

% ��������, ����������� ������ �������, � ������� �������� - ������
% ����� �� �������� ������ � �������� �����
% �������� ����� ��������� ���������������� �����, ������������ ��������
% ����� ��������� � ���� �����
getAllPermutationCount([], _, _):-!.
getAllPermutationCount(Lines, UserWord, Count):-
	getAllPermutationCount(Lines, UserWord, 0, Count).
getAllPermutationCount([], _, Count, Count):- !.
getAllPermutationCount([Line|Tail], UserWord, CurCount, Count):-
	parseLine(Line, UserWord, CurCount, NewCurCount),
	getAllPermutationCount(Tail, UserWord, NewCurCount, Count).


pr:- see('D:/������/1.txt'), read_list_str(List), seen,
    %writeln(List),
    %string_to_list("����", UserWord),
    writeln("������� �����, ������������ �������� ������ ���������"),
    readUserWord(UserWord),
    sortList(UserWord, SortedUW),
    getAllPermutationCount(List, SortedUW, Count),
    write("��������� ������������ = "), write(Count).










