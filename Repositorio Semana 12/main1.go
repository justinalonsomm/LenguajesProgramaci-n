package main

import "fmt"

// Definición de la estructura 'producto'
type producto struct {
	nombre   string // Nombre del producto
	cantidad int    // Cantidad disponible del producto
	precio   int    // Precio del producto
}

// Definición de la estructura 'listaProductos', que es un slice de 'producto'
type listaProductos []producto

// Variable global para almacenar la lista de productos
var lProductos listaProductos

// Constante que define la existencia mínima de productos
const existenciaMinima int = 10 // La existencia mínima es el número mínimo debajo del cual se deben tomar eventuales decisiones

// Método para agregar un nuevo producto a la lista de productos
func (l *listaProductos) agregarProducto(nombre string, cantidad int, precio int) {
	for i, p := range *l {
		if p.nombre == nombre {
			// Si el producto ya existe, se incrementa la cantidad y se actualiza el precio si es diferente
			(*l)[i].cantidad += cantidad
			if (*l)[i].precio != precio {
				(*l)[i].precio = precio
			}
			return
		}
	}
	// Si el producto no existe, se añade a la lista
	*l = append(*l, producto{nombre: nombre, cantidad: cantidad, precio: precio})
}

// Método para agregar una cantidad potencialmente infinita de productos previamente creados a la lista
func (l *listaProductos) agregarProductos(productos ...producto) {
	for _, p := range productos {
		l.agregarProducto(p.nombre, p.cantidad, p.precio)
	}
}

// Método para buscar un producto por su nombre en la lista de productos
// Retorna el producto encontrado y un valor de error, nil si no hay error y números mayores si existe algún tipo de error
func (l *listaProductos) buscarProducto(nombre string) (*producto, int) {
	for i, p := range *l {
		if p.nombre == nombre {
			return &(*l)[i], 0 // Se retorna el producto encontrado y 0 indicando que no hay error
		}
	}
	return nil, 1 // Se retorna nil y 1 si el producto no se encuentra
}

// Método para vender una cantidad específica de un producto
// Si la venta deja la cantidad del producto en 0 o menos, el producto se elimina de la lista
func (l *listaProductos) venderProducto(nombre string, cant int) {
	prod, err := l.buscarProducto(nombre)
	if err == 0 && prod != nil {
		// Se reduce la cantidad del producto vendido
		prod.cantidad -= cant
		// Si la cantidad del producto es 0 o menos, se elimina de la lista
		if prod.cantidad <= 0 {
			l.eliminarProducto(nombre)
			fmt.Printf("El producto %s se ha eliminado por falta de existencia.\n", nombre)
		}
	}
}

// Método para modificar el precio de un producto utilizando la función buscarProducto modificada previamente
func (l *listaProductos) modificarPrecio(nombre string, nuevoPrecio int) {
	prod, _ := l.buscarProducto(nombre)
	if prod != nil {
		prod.precio = nuevoPrecio
	}
}

// Método para eliminar un producto de la lista por su nombre
func (l *listaProductos) eliminarProducto(nombre string) {
	for i, p := range *l {
		if p.nombre == nombre {
			// Se elimina el producto de la lista
			*l = append((*l)[:i], (*l)[i+1:]...)
			return
		}
	}
}

// Función para llenar la lista de productos con datos de ejemplo
func llenarDatos() {
	lProductos.agregarProducto("arroz", 15, 2500)
	lProductos.agregarProducto("frijoles", 4, 2000)
	lProductos.agregarProducto("leche", 8, 1200)
	lProductos.agregarProducto("café", 12, 4500)
}

// Método para listar los productos que tienen una cantidad menor o igual a la existencia mínima
func (l *listaProductos) listarProductosMinimos() listaProductos {
	// Se crea una nueva lista para almacenar los productos con existencia mínima
	newSlice := make(listaProductos, 0)

	// Se recorre la lista de productos y se agregan aquellos que cumplen la condición
	for _, p := range *l {
		if p.cantidad <= existenciaMinima {
			newSlice = append(newSlice, p)
		}
	}
	return newSlice
}

func main() {
	// Se llenan los datos de la lista de productos con datos de ejemplo
	llenarDatos()
	fmt.Println(lProductos)

	// Se venden algunos productos
	lProductos.venderProducto("arroz", 10)
	lProductos.venderProducto("frijoles", 2)
	fmt.Println(lProductos)

	// Se obtienen los productos con existencia mínima y se imprimen
	pminimos := lProductos.listarProductosMinimos()
	fmt.Println(pminimos)
	fmt.Println(pminimos)
}
