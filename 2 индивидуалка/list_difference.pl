% �������� ������ ������ �� �����. ��������� ������.
writeList([]):- !.
writeList([H|T]):- writeln(H), writeList(T).

% �������� ����� ������ � ����������. ��������� ����������, � �������
% ����������� ������ � ��� �����������
readList([], 0):- !.
readList([H|List], N):- read(H), N1 is N-1, readList(List, N1).

% ��������, ����������� ������ � �������. ���� ������� �� ����������� �
% ������, �� ���������� true, ����� false
checkNoRepeating([], _):- !, fail.
checkNoRepeating([H|T], Elem):- checkNoRepeating([H|T], Elem, 0), !.
checkNoRepeating(_, _, 2):- !,fail.
checkNoRepeating([],_,_):-!.
checkNoRepeating([Elem|T], Elem, Count):-
    Count1 is Count + 1,!,
    checkNoRepeating(T, Elem, Count1).
checkNoRepeating([_|T], Elem, Count):-
    checkNoRepeating(T, Elem, Count).

























