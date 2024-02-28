;Ejercicio#9/JustinMartínez/2019027054

;Utilice la función map para definir la función eliminar_elemento que recibe un elemento E
;y una lista L y retorna la lista L sin el elemento E. Si el elemento no existe, retorna la lista L original.

;***************************EVALUADO*********************************

; Definimos la función eliminar_elemento que recibe un elemento E y una lista L
(define (eliminar_elemento E L)
  ; Utilizamos la función filter para mantener solo los elementos diferentes a E en la lista L
  (filter
    ; Definimos una función anónima que toma un elemento X y lo compara con E
    (lambda (X)
      ; Mantenemos X en la lista resultante solo si no es igual a E
      (not (= X E)))
    ; Aplicamos la función anónima a cada elemento de la lista L
    L))

; Probamos la función con los ejemplos dados
(displayln (eliminar_elemento 3 '(1 2 3 4 5))) ; Debería imprimir: (1 2 4 5)

(displayln (eliminar_elemento 0 '(1 2 3 4 5))) ; Debería imprimir: (1 2 3 4 5)


;Definición de la función eliminar_elemento:
;define: Se utiliza para definir funciones en Racket. Aquí definimos una función llamada eliminar_elemento que toma un elemento E y una lista L.
;Función filter:
;filter: Se utiliza para crear una nueva lista que contiene solo los elementos que cumplen con cierta condición.
;Función anónima con lambda:
;(lambda (X) (not (= X E))): Define una función anónima que toma un elemento X como parámetro y devuelve verdadero (#t) si X no es igual a E, y falso (#f) si son iguales.
;Aplicación de la función anónima a cada elemento de la lista L:
;L: La lista de entrada a la que se aplicará la función.
;Pruebas de la función:
;displayln: Muestra el resultado en la consola.
;Resultados de las pruebas:
;(eliminar_elemento 3 '(1 2 3 4 5)): La función devuelve la lista (1 2 4 5), eliminando el elemento 3.
;(eliminar_elemento 0 '(1 2 3 4 5)): La función devuelve la lista (1 2 3 4 5), ya que el elemento 0 no está en la lista original.