;Ejercicio#1/Repositorio Semana 5/JustinMartínez/2019027054

;Amplie al ejercicio visto en clase, permitiendo crear listas que
;representen facturas de ventas y creando las funciones necesarias
;para calcular a partir de dichas facturas (nuevas listas): 
;El impuesto total a cancelar de la factura. Solo aquellos productos que
;sobrepasen un monto mayor definido de argumento en la función
;pagan impuesto y dicho impuesto es siempre el 13% sobre el monto.
;El monto total de la factura sin impuesto, sin importar ningún umbral
;Para el ejercicio, cree quemadas al menos dos facturas a su gusto.
;Escriba al menos 3 casos de prueba de sus funciones

;***************************EVALUADO*********************************
(define ListaProductos
  '(("Arroz" 8 1800)
    ("Frijoles" 5 1200)
    ("Azucar" 6 1100)
    ("Cafe" 2 2800)
    ("Leche" 9 1200)))

(define (agregarProducto Lista nombre cantidad precio)
  (cond ((null? Lista)
         (list (list nombre cantidad precio)))
        ((equal? nombre (caar Lista))
         (cons (list
                (caar Lista)
                (+ (list-ref (car Lista) 1) cantidad)
                precio)
               (cdr Lista)))
        (else
         (cons (car Lista) (agregarProducto
                            (cdr Lista)
                            nombre
                            cantidad
                            precio)))))

(define (venderProducto Lista nombre cantidad)
  (cond ((null? Lista)
         (display "No existe ese producto para vender")
         '())
        ((equal? nombre (caar Lista))
         (cons (list
                (caar Lista)
                (- (list-ref (car Lista) 1) cantidad)
                (list-ref (car Lista) 2))
               (cdr Lista)))
        (else
         (cons (car Lista)
               (venderProducto (cdr Lista) nombre cantidad)))))

(define (existenciasMinimas Lista cantidad)
  (filter (lambda (x) (<= (cadr x) cantidad))
          Lista))

(define (calcular-impuesto-total factura umbral)
  (define (producto-con-impuesto producto)
    (if (> (caddr producto) umbral)
        (* 0.13 (caddr producto))
        0))

  (apply + (map producto-con-impuesto factura)))

(define (calcular-monto-total-sin-impuesto factura)
  (apply + (map (lambda (producto) (* (caddr producto) (cadr producto))) factura)))

;; Facturas de ejemplo (ajustadas)
(define factura1 '((Arroz 2 1800) (Cafe 1 2800) (Leche 3 1200)(Azucar 2 1100)))
(define factura2 '((Frijoles 4 1200) (Azucar 2 1100) (Cafe 2 2800)))
(define factura3 '((Azucar 1 1100) (Leche 2 1200) (Frijoles 3 1200)))

;; Casos de prueba
(displayln "Caso de prueba 1:")
(displayln (calcular-impuesto-total factura1 500)) ; Impuesto total para factura1 con umbral 500
(displayln (calcular-monto-total-sin-impuesto factura1)) ; Monto total sin impuestos para factura1
(newline)

(displayln "Caso de prueba 2:")
(displayln (calcular-impuesto-total factura2 1000)) ; Impuesto total para factura2 con umbral 1000
(displayln (calcular-monto-total-sin-impuesto factura2)) ; Monto total sin impuestos para factura2
(newline)

(displayln "Caso de prueba 3:")
(displayln (calcular-impuesto-total factura3 1500)) ; Impuesto total para factura3 con umbral 1500
(displayln (calcular-monto-total-sin-impuesto factura3)) ; Monto total sin impuestos para factura3
