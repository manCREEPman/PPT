% ������ �������� ������ � ������. �� ������� ��������, �������,
% �������� � ��������. ��������� ������� ������ ������������� �������
% ������ �� ������ �������. �������� ��������� ����� �������. ��������
% ��������� ����� ������. ������ �� ��������� ����� ������. ��� �����
% ����� �� �������?


% ��������, �����������, ���� �� ������� � ���������� ������
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

% ��������, �����������, ���������� �� �������1 ����� ���� �������
% ������������ ��������2 � ������ ����������� 4
naprotiv(A, B, [A, _, B, _]).
naprotiv(A, B, [B, _, A, _]).
naprotiv(A, B, [_, A, _, B]).
naprotiv(A, B, [_, B, _, A]).

% �������� �������� sprava_next. ������ ����� ����������� "�����������"
% ������ �� 4 ���������. �������� ���������, ��������� �� �������1
% ������ ������������ ��������2.
sprava_next(A, B, [B, _, _, A]):- !.
sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

% �������� �������� sleva_next. ������ ����� ����������� "�����������"
% ������ �� 4 ���������. �������� ���������, ��������� �� �������1 �����
% ������������ ��������2.
sleva_next(A, B, [A, _, _, B]):- !.
sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).


ind4:- Domino_players = [_, _, _, _],
    % ��������� ���������� ��������� ��������� ������� �� �������
    KuznecovSpec = [slesar, rezchik, tokar],
    TokarevSpec = [slesar, rezchik, kuznec],
    SlesarevSpec = [rezchik, tokar, kuznec],
    RezchikovSpec = [slesar, tokar, kuznec],

    in_list(KuznecovSpec, KuzProf),
    in_list(TokarevSpec, TokProf),
    in_list(SlesarevSpec, SlesProf),
    in_list(RezchikovSpec, RezProf),

    % ����� ������� ������� - ������ ���� � ������
    in_list(Domino_players, [kuznecov, KuzProf]),
    in_list(Domino_players, [tokarev, TokProf]),
    in_list(Domino_players, [slesarev, SlesProf]),
    in_list(Domino_players, [rezchikov, RezProf]),

    % ������������� ������� ������
    naprotiv([kuznecov, _], [_, slesar], Domino_players),
    naprotiv([rezchikov, _], [_, rezchik], Domino_players),
    sprava_next([slesarev, _], [_, tokar], Domino_players),

    % �������� ������ �� ������� ������
    sleva_next([_, kuznec], Who, Domino_players),
    write("����� �� ������� ����� "), writeln(Who),
    write(Domino_players).

