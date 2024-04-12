sub_conjunto([], _).
sub_conjunto([X|Xs], L) :-
    member(X, L),
    sub_conjunto(Xs, L).






