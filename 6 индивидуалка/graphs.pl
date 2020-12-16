read_str(A):-get0(X),r_str(X,A,[]).

del_1st([H|T],T).

r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

% ���� �� �����, � ������� ����� ��������� ����������� ���������
path('D:/������/2.txt').

% ������� �������� ����� �����
get_graph_edges(V,E):-get_V(V),write(V),nl,write("Edges"),get_edges(V,E),write(E).

	get_V(V):-read(N),write("Vertexes"),nl,N1 is N+1,get_V(V1,N1),del_1st(V1,V).
	get_V([],0):-!.
	get_V([H|T],N):-read_str(X),name(H,X),N1 is N-1,get_V(T,N1).

	get_edges(V,E):-read(M),get0(X),get_edges(V,E,[],M,0).
	get_edges(V,E,E,M,M):-!.
	get_edges(V,E,Edges,M,Count):-
           get_edge(V,Edge),append(Edges,[Edge],E1),
           Count1 is Count+1,get_edges(V,E,E1,M,Count1).

% ��������� � �������� ��������� ����� �����
get_edge(V,[V1,V2]):-write("Edge"),nl,read_str(X),name(V1,X),check_vertex(V,V1),
						read_str(Y),name(V2,Y),check_vertex(V,V2).
% ��������� � �������� ��������� ����� �����						
check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).


% ��������, ����������� ��� ����� ������ - � � �, ���������� true, ���� 
% � � � ������� ������
isEdgeBetweenVertexes(X, Y, [[X,Y]|_]):- !, true.
isEdgeBetweenVertexes(X, Y, [[Y,X]|_]):- !, true.
isEdgeBetweenVertexes(X, Y, [[_,_]|Tail]):- isEdgeBetweenVertexes(X, Y, Tail).


% ��������, ����������� ���� ������� �, ������ ������ ��������� � ������ ���� �����.
% ���������� true, ���� � ��������� ���� �� � ����� �������� ����������� ���������,
% ����� false
isVertexLinkToSet(_, [], _):- !, fail.
isVertexLinkToSet(X, [H|Tail], Edges):-
		  % ���� ������� ������� �� ��������� ������ � �, �� ��������� ������� ������
          \+ isEdgeBetweenVertexes(X, H, Edges), !,
           isVertexLinkToSet(X, Tail, Edges).
% ���� ����� �� �� ����, �� ��������� �� ��� �������, ����������� �������		   
isVertexLinkToSet(_, _, _):- !.


% ��������� ��� �����, ���������� ������ ������, ������ ������� �������� - 
% ������������ ����������� ���������. ��������, ��� ����� � ��������� a,b,c,d �����
% �� ��������� ����� ������ ����� ����, ���������, 'bcd'
tokenize_file(Name, Ret) :-
       open(Name, read, Str),
       read_file(Str, Lst),
       atomic_list_concat(Lst, '', AtmConcat),
       split_string(AtmConcat, " ", "", Ret),
       close(Str), !.


% ��������������� �������� ��� tokenize_file. ��������� ����� ������, ��� ���� ��������
% ������ �������� �����, ��������� �������� ����� � �������
read_file(Stream,[]) :-
       at_end_of_stream(Stream).
read_file(Stream,[X|L]) :-
       \+ at_end_of_stream(Stream),
       get0(Stream, Code),
       set_value(X, Code),
       read_file(Stream,L).
	   
% ���. �������� ��� read_file
set_value(X, 10) :-
       char_code(X, 32).
set_value(X, Code) :-
       char_code(X, Code).


% ��������� ��� �����, ��������� ���� �� ��� �� ������ �������� � ���������,
% ������ �� ��� ������� ����� ������ � ������ ���� (�����, ��������� �����������)
check_atom_entry(X, Y):-
           atom_chars(X, AtomX),
           forall(member(AX, AtomX), sub_atom(Y, _, _, _, AX)), !.


% ��������� ���� � � ������ ����������� �������� �����
% ��� ������� �������� ������ ���������, �������� �� � ��������� � ����
% ���������� true, ���� �������� ���������
check_atom_entry_set(_, []):- !, fail.
check_atom_entry_set(X, [H|Tail]):-
           (check_atom_entry(X, H) -> !;
            check_atom_entry_set(X, Tail)).

% ������������� �������� ��� ������ ������ � ����
write_list_to_file([]):-!.
write_list_to_file([H|Tail]):- put(H), write_list_to_file(Tail).


% ��������, ������������ ����� Set � ���� � ����� �������
write_set(Set):-
           path(Path),
           append(Path),
           write_list_to_file(Set),
           nl,
           told,!.


% ��������� ��������, ����������� ������ ������ V, ������ ���� E � ������������
% ��������� ��� ������ ������������ ����������� �������� �����
get_independent_sets(X, V, E):-
           independent_permutations(Y, V, E),
           (not(check_entry_in_file(Y)),
            write_set(Y), X = Y; false).


check_entry_in_file(List):-path(Path),
           tokenize_file(Path, CurIndepSets),
           name(AtomicList, List),
           (\+ check_atom_entry_set(AtomicList, CurIndepSets),
            !, false ; true).

% ��������, �������������� ������� ��������� �������� ������ �� ���������
% �� ����������� � ����������
independent_permutations([], [], _).
independent_permutations(List, [V|Other], E):-
           independent_permutations(List1, Other, E),
		   % ���� ������� �� ������� � ��� ���������� ��������� ������,
		   % �� ���� �, ����� ���������� � ������������� ��������� ������� �����
           (\+ isVertexLinkToSet(V, List1, E),
           append([V], List1, List2);
          List2 = List1), List = List2.

% �������� ����
init_file:-path(Path),tell(Path),told.

% 3
% a b c
% 2
% [a,b],[b,c]

ind_fuck(X):- init_file,
           V = [1,2,3,4,5,6,7,8],
           E = [[1,2],[1,4],[1,6],
               [2,7],[2,3],
               [3,4],[3,8],
               [4,5],
               [5,6],[5,8],
               [6,7],
               [7,8]],
           get_independent_sets(X, V, E).


