;Ejercicio#1/JustinMartínez/2019027054

;Se tiene una cuenta de ahorros en la cual se deposita un capital C al inicio de un periodo de un año. Por cada año que
;transcurra se recibe un interés I sobre el capital depositado. Es decir, al terminar el año se cuenta con el capital
;inicial más interés ganado. Construya una función (int Cap, I, N) que calcula el monto que se recibe al depositar un capital
;a un interés dado durante un cierto número de años. Debe producir los resultados de acuerdo con el siguiente cuadro:

;Capital	Interés 	Años	Resultado
;;2000     	0.10    	0	2000
;2000   	0.10    	1	2200
;2000   	0.10    	2	2420
;2000   	0.10    	3	2662


;***************************EVALUADO*********************************

;; Definición de la función calcular-monto con tres parámetros: capital, tasa de interés y años.
(define (calcular-monto capital tasa-interes anos)
  ;; Definición de la función interna calcular-iterativo para manejar la lógica de interés compuesto de manera iterativa.
  (define (calcular-iterativo capital tasa-interes anos)
    ;; Condición base: si años es 0, devuelve el capital actual.
    (if (= anos 0)
        capital
        ;; Paso recursivo: actualiza el capital sumándole el interés ganado y reduce el número de años.
        (calcular-iterativo (+ capital (* capital tasa-interes)) tasa-interes (- anos 1))))
  ;; Llamada inicial a la función interna con los parámetros dados.
  (calcular-iterativo capital tasa-interes anos))

;; Ejemplos de uso de la función calcular-monto.
(displayln (calcular-monto 2000 0.10 0)) ; 2000
(displayln (calcular-monto 2000 0.10 1)) ; 2200
(displayln (calcular-monto 2000 0.10 2)) ; 2420
(displayln (calcular-monto 2000 0.10 3)) ; 2662