aplanar([], []).
aplanar([X|Xs], L) :-
    is_list(X),
    aplanar(X, L1),
    aplanar(Xs, L2),
    append(L1, L2, L).
aplanar([X|Xs], [X|L]) :-
    \+ is_list(X),
    aplanar(Xs, L).
