;Ejercicio#8/JustinMartínez/2019027054

;Construya una función que se llame sub-conjunto? Esta función recibe dos argumentos y debe producir un valor #t cuando el primer argumento es subconjunto del segundo
;y #f en caso contrario. 

;***************************EVALUADO*********************************

; Documentación Interna:
; -----------------------

; La función sub-conjunto? verifica si conjunto1 es un subconjunto de conjunto2.

; Parámetros:
; - conjunto1: El conjunto que se desea verificar como subconjunto.
; - conjunto2: El conjunto en el cual se busca la presencia de conjunto1.

; Retorno:
; - Retorna #t si conjunto1 es subconjunto de conjunto2, y #f en caso contrario.

(define (sub-conjunto? conjunto1 conjunto2)
  (if (null? conjunto1)
      #t ; Retorna true si conjunto1 es vacío, ya que cualquier conjunto vacío es subconjunto.
      (if (member (car conjunto1) conjunto2)
          (sub-conjunto? (cdr conjunto1) conjunto2) ; Verifica el siguiente elemento recursivamente.
          #f))) ; Retorna false si el primer elemento de conjunto1 no está en conjunto2.

; Ejemplo 1: Verificar subconjunto con un conjunto vacío
(display (sub-conjunto? '() '(a b c d e f))) ; #t
(newline)

; Ejemplo 2: Verificar subconjunto con elementos en común
(display (sub-conjunto? '(a b c) '(a b c d e f))) ; #t
(newline)

; Ejemplo 3: Verificar subconjunto con elemento faltante
(display (sub-conjunto? '(a b x) '(a b c d e f))) ; #f
(newline)

