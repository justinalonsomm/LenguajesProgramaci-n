;Ejercicio#2/Repositorio Semana 5/JustinMartínez/2019027054

;Haciendo uso de la función filter, implemente una función que, a
;partir de una lista de cadenas de parámetro, filtre aquellas que contengan una
;subcadena que el usuario indique en otro argumento.
;                Ejemplos:
;sub_cadenas “la” [“la casa, “el perro”, “pintando la cerca”]
;[“la casa, “pintando la cerca”]


;***************************EVALUADO*********************************

(define (filtrar-por-subcadena subcadena lista-de-cadenas)
  ; Definición de la función filtrar-por-subcadena, que toma una subcadena y una lista de cadenas como parámetros.
  (filter (lambda (cadena) (string-contains? cadena subcadena))
          lista-de-cadenas))
  ; Usa la función filter para aplicar la función lambda a cada cadena en la lista, filtrando las que contienen la subcadena.

(define (string-contains? cadena subcadena)
  ; Definición de la función string-contains?, que verifica si una cadena contiene una subcadena.
  (not (equal? #f (regexp-match? (regexp (string-append ".*" subcadena ".*")) cadena))))
  ; Utiliza expresiones regulares para verificar si la subcadena está presente en la cadena.

(define (imprimir-lista lista)
  ; Definición de la función imprimir-lista, que imprime los elementos de una lista.
  (displayln (join-list-elements lista ", ")))
  ; Utiliza la función join-list-elements para unir los elementos de la lista con comas y luego imprime la cadena resultante.

(define (join-list-elements lista separador)
  ; Definición de la función join-list-elements, que une los elementos de una lista con un separador.
  (cond
    ((null? lista) "")  ; Si la lista está vacía, devuelve una cadena vacía.
    ((null? (cdr lista)) (car lista))  ; Si la lista tiene un solo elemento, devuelve ese elemento.
    (else (string-append (car lista) separador (join-list-elements (cdr lista) separador)))))
    ; Concatena el primer elemento con el separador y la llamada recursiva con el resto de la lista.

;; Ejemplo de uso
(define lista-ejemplo '("nosotros comemos" "jimena guapa" "1" "ellos estudian" "1" "ella canta" "yo dibujo" "nosotros corremos" "él baila" "nosotras saltamos" "yo cocino" "ellos juegan" "ella escribe" "nosotros viajamos" "yo programo"))
; Define una lista de ejemplo que contiene cadenas variadas.

(define subcadena-ejemplo "guapa");; lo único es que si no se coloca nada, igual imprime toda las lista
; Define una subcadena de ejemplo.

(displayln "Lista original:")
(imprimir-lista lista-ejemplo)
; Imprime la lista original.

(displayln (string-append "Lista filtrada por subcadena \"" subcadena-ejemplo "\":"))
(imprimir-lista (filtrar-por-subcadena subcadena-ejemplo lista-ejemplo))
; Imprime la lista filtrada por la subcadena de ejemplo.

