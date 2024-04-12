plato(entrada, guacamole, 200).
plato(entrada, ensalada, 150).
plato(entrada, consome, 300).
plato(entrada, tostadas_caprese, 250).

plato(carne, filete_de_cerdo, 400).
plato(carne, pollo_al_horno, 280).
plato(carne, carne_en_salsa, 320).

plato(pescado, tilapia, 160).
plato(pescado, salmon, 300).
plato(pescado, trucha, 225).

plato(postre, flan, 200).
plato(postre, nueces_con_miel, 500).
plato(postre, naranja_confitada, 450).
plato(postre, flan_de_coco, 375).

comida_completa(Entrada, PlatoPrincipal, Postre, TotalCalorias) :-
    plato(entrada, Entrada, CalEntrada),
    plato(carne, PlatoPrincipal, CalPlatoPrincipal),
    plato(pescado, PlatoPrincipal, CalPlatoPrincipal),
    plato(postre, Postre, CalPostre),
    TotalCalorias is CalEntrada + CalPlatoPrincipal + CalPostre.

esta_en(X, [X|_]).
esta_en(X, [_|T]) :- esta_en(X, T).

combinacion_sin_repetir([], _).
combinacion_sin_repetir([H|T], L) :-
categoria(entrada, [guacamole, ensalada, consome, tostadas_caprese]).
categoria(carne, [filete_de_cerdo, pollo_al_horno, carne_en_salsa]).
categoria(pescado, [tilapia, salmon, trucha]).
categoria(postre, [flan, nueces_con_miel, naranja_confitada, flan_de_coco]).

calorias(guacamole, 200).
calorias(ensalada, 150).
calorias(consome, 300).
calorias(tostadas_caprese, 250).
calorias(filete_de_cerdo, 400).
calorias(pollo_al_horno, 280).
calorias(carne_en_salsa, 320).
calorias(tilapia, 160).
calorias(salmon, 300).
calorias(trucha, 225).
calorias(flan, 200).
calorias(nueces_con_miel, 500).
calorias(naranja_confitada, 450).
calorias(flan_de_coco, 375).

plato_principal(Plato) :-
    categoria(carne, Carnes),
    member(Plato, Carnes).
plato_principal(Plato) :-
    categoria(pescado, Pescados),
    member(Plato, Pescados).

total_calorias(Entrada, PlatoPrincipal, Postre, Total) :-
    calorias(Entrada, CalEntrada),
    calorias(PlatoPrincipal, CalPlatoPrincipal),
    calorias(Postre, CalPostre),
    Total is CalEntrada + CalPlatoPrincipal + CalPostre.
