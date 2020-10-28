% �������� ������ ������ �� �����. ��������� ������.
writeList([]):- !.
writeList([H|T]):- writeln(H), writeList(T).

% �������� ����� ������ � ����������. ��������� ����������, � �������
% ����������� ������ � ��� �����������
readList([], 0):- !.
readList([H|List], N):- read(H), N1 is N-1, readList(List, N1).

% �������� ��������, ����������� �� ������� � ������
checkRepeating(List, Elem):- checkRepeating(List, Elem, 0).
checkRepeating([_|_], _, RepeatingCount):- RepeatingCount > 1, !.
checkRepeating([], _, 0):- fail.
checkRepeating([H|T], Elem, RepeatingCount):-
    checkRepeating(T, Elem, RepeatingCount).
checkRepeating([Elem|T], Elem, RepeatingCount):-
    RPC is RepeatingCount + 1,
    checkRepeating(T, Elem, RPC).



