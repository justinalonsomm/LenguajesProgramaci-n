distanciaH(X, Y, D) :-
    string_chars(X, XChars),
    string_chars(Y, YChars),
    findall(_, (nth1(I, XChars, CharX), nth1(I, YChars, CharY), CharX \= CharY), Deltas),
    length(Deltas, D).
