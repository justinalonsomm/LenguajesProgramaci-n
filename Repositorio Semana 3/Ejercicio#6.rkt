;Ejercicio#6/JustinMartínez/2019027054

;Construya una función que se llame merge. Esta función recibe dos listas ordenadas y produce otra lista ordenada con
;todos los elementos de las primeras dos listas A continuación se presentan algunos ejemplos

;***************************EVALUADO*********************************


; Definimos la función merge que toma dos listas ordenadas
(define (merge lista1 lista2)
  ; Usamos una expresión condicional para manejar el caso cuando alguna de las listas es vacía
  (cond
    ; Si la primera lista es vacía, devolvemos la segunda lista
    ((null? lista1) lista2)
    ; Si la segunda lista es vacía, devolvemos la primera lista
    ((null? lista2) lista1)
    ; En caso contrario, comparamos los primeros elementos de ambas listas
    (else
     ; Si el primer elemento de la primera lista es menor o igual al de la segunda lista,
     ; tomamos ese elemento y llamamos recursivamente a merge con el resto de la primera lista
     (if (<= (car lista1) (car lista2))
         (cons (car lista1) (merge (cdr lista1) lista2))
         ; Si el primer elemento de la segunda lista es menor,
         ; tomamos ese elemento y llamamos recursivamente a merge con el resto de la segunda lista
         (cons (car lista2) (merge lista1 (cdr lista2)))))))

; Probamos la función con los ejemplos dados
(displayln (merge '(1 2 3 4) '(5 6 7 8))) ; Debería imprimir: (1 2 3 4 5 6 7 8)

(displayln (merge '(1 2 3) '(1 2 3 4))) ; Debería imprimir: (1 1 2 2 3 3 4)

;Definición de la función merge:
;define: Se utiliza para definir funciones en Racket. Aquí definimos una función llamada merge que toma dos listas ordenadas como parámetros.
;Expresión condicional con cond:
;cond: Es una expresión condicional en Racket. Evalúa cada cláusula en orden y devuelve el valor de la primera cláusula cuya condición es verdadera.
;(null? lista1): Verifica si la lista1 es vacía.
;(null? lista2): Verifica si la lista2 es vacía.
;Manejo de casos base:
;Si lista1 es vacía, devuelve lista2.
;Si lista2 es vacía, devuelve lista1.
;Comparación y construcción de la lista resultante:
;(car lista1): Devuelve el primer elemento de lista1.
;(car lista2): Devuelve el primer elemento de lista2.
;(<= (car lista1) (car lista2)): Compara los primeros elementos de ambas listas.
;Recursividad:
;cons: Construye una nueva lista con el primer elemento y el resultado de la llamada recursiva.
;Pruebas de la función:
;displayln: Muestra el resultado en la consola.
;Resultados de las pruebas:
;(merge '(1 2 3 4) '(5 6 7 8)): La función devuelve la lista ordenada (1 2 3 4 5 6 7 8).
;(merge '(1 2 3) '(1 2 3 4)): La función devuelve la lista ordenada (1 1 2 2 3 3 4).