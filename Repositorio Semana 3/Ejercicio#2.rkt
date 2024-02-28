; Definimos la función sumd que toma un número entero positivo N
(define (sumd N)
  ; Base del caso recursivo: si N es menor que 10, simplemente devolvemos N
  (if (< N 10)
      N
      ; Caso recursivo: llamamos a la función sumd con el cociente y el residuo de N entre 10
      (+ (remainder N 10) (sumd (quotient N 10)))))
; Probamos la función con el ejemplo sumd 124
(displayln (sumd 124))
; Definimos la función sum que toma un número entero positivo N
(define (sum N)
  ; Base del caso recursivo: si N es menor que 10, simplemente devolvemos N
  (if (< N 10)
      N
      ; Caso recursivo: llamamos a la función sumd con el cociente y el residuo de N entre 10
      (+ (remainder N 10) (sum (quotient N 10)))))
; Probamos la función con el ejemplo sum 12480
(displayln (sum 12480))


;Definición de la función sumd y sum:
;define: Se utiliza para definir funciones o variables. En este caso, definimos dos funciones sumd y sum.
;Cuerpo de la función sumd y sum:
;(if (< N 10) ... ...): Se utiliza para construir una expresión condicional. En el caso base, si N es menor que 10,
;devolvemos N. En caso contrario, realizamos el cálculo recursivo.
;(+ (remainder N 10) (sumd (quotient N 10))): La función remainder devuelve el residuo de la división de N entre 10, y
;quotient devuelve el cociente. Sumamos el residuo con la llamada recursiva de la función sumd o sum con el cociente.
;Probando las funciones:
;Utilizamos displayln para imprimir los resultados en la consola.
;Resultados de las pruebas:
;(sumd 124): La función devuelve 7, ya que 1 + 2 + 4 es igual a 7.
;(sum 12480): La función devuelve 15, ya que 1 + 2 + 4 + 8 + 0 es igual a 15.