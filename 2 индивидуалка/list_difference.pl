% �������� ������ ������ �� �����. ��������� ������.
writeList([]):- !.
writeList([H|T]):- writeln(H), writeList(T).

% �������� ����� ������ � ����������. ��������� ����������, � �������
% ����������� ������ � ��� �����������
readList([], 0):- !.
readList([H|List], N):- read(H), N1 is N-1, readList(List, N1).

% �������� ��������, ����������� �� ������� � ������
checkRepeating([_|_], Elem):- checkRepeating([_|_], Elem, 0).
checkRepeating([Elem|T], Elem, RepeatingCount):- RPC is RepeatingCount + 1,
    checkRepeating(T, Elem, RPC).
checkRepeating([_|T], Elem, RepeatingCount):- checkRepeating(T, Elem, RepeatingCount).
checkRepeating([_|_], _, RepeatingCount):- RepeatingCount > 1, fail.
checkRepeating([], _, _):- !.


