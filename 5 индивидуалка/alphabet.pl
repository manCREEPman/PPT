read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

razm([], 0, _):- !.
razm(Sub_set, K, Set):- razm([], Sub_set, K, Set).
razm(Pre_set, Pre_set, 0, _):-!.
razm(Pre_set, [Pre_set|[H|Sub_set]], K, [H|Set]):-
    K1 is K-1, razm([Pre_set|H], Sub_set, K1, Set).
razm(Pre_set, Sub_set, K, [H|Set]):- razm(Pre_set, Sub_set, K, [H|Set]).
pr_razm:- read_str(List, N), read(K), razm(B, K, List), write_str(B), nl, fail.


sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).
pr_subset:-string_codes("asdf", List), sub_set(B,List),write_str(B),nl,fail.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):-sochet_p(Sub_set,K,Set).
pr_sochet_p:-read_str(A,N),read(K),sochet_p(B,K,A),write_str(B),nl,fail.


sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet:-read_str(A,N),read(K),sochet(B,K,A),
    permutation(B, PermB), write_str(PermB),nl,fail.

makePermutations(List, PermutationsList):-
    findall(Permutation, permutation(List, Permutation), PermutationsList).
makePermutationsSet(List, Set):-
    makePermutations(List, PermutationsList),
    list_to_set(PermutationsList, Set).

lastTwoValues(N, K, 0, 0):- N - 6 - K =:= 0, !.
lastTwoValues(N, K, 1, 0):- N - 6 - K =:= 1, !.
lastTwoValues(N, K, 1, 1):- N - 6 - K =:= 2, !.


makeRepetitionsList(N, K, ResList):-
    lastTwoValues(N, K, Value1, Value2),
    TempList = [2, 2, 2],
    append(TempList, [Value1], TR),
    append(TR, [Value2], ResList).
