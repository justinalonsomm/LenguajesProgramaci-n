package main

import (
	"fmt"
	"sort"
	"strings"
)

type infoCliente struct {
	nombre string
	correo string
	edad   int32
}

type listaClientes []infoCliente

func (lc *listaClientes) agregarCliente(nombre, correo string, edad int32) {
	*lc = append(*lc, infoCliente{nombre, correo, edad})
}

// Función genérica filter
func filter[T any](slice []T, predicate func(T) bool) []T {
	filtered := []T{}
	for _, item := range slice {
		if predicate(item) {
			filtered = append(filtered, item)
		}
	}
	return filtered
}

// Función para verificar si el apellido está presente en el correo del cliente
func tieneApellidoEnCorreo(cliente infoCliente, apellido string) bool {
	emailParts := strings.Split(cliente.correo, "@")
	if len(emailParts) == 2 {
		emailLocal := emailParts[0]
		if strings.Contains(emailLocal, apellido) {
			return true
		}
	}
	return false
}

// Función para obtener la lista de clientes cuyos correos contienen el apellido
func listaClientes_ApellidoEnCorreo(clientes *listaClientes, apellido string) listaClientes {
	result := filter(*clientes, func(cliente infoCliente) bool {
		return tieneApellidoEnCorreo(cliente, apellido)
	})
	return listaClientes(result)
}

// Función para verificar si el dominio del correo es de Costa Rica
func esDominioCR(correo string) bool {
	return strings.HasSuffix(correo, ".cr")
}

// Función para contar la cantidad de correos cuyo dominio es de Costa Rica
func cantidadCorreosCostaRica(clientes *listaClientes) int {
	filtered := filter(*clientes, func(cliente infoCliente) bool {
		return esDominioCR(cliente.correo)
	})
	return len(filtered)
}

// Función para verificar si el correo contiene el nombre de la persona
func contieneNombreEnCorreo(cliente infoCliente) bool {
	nombre := strings.ToLower(strings.ReplaceAll(cliente.nombre, " ", ""))
	return strings.Contains(strings.ToLower(cliente.correo), nombre)
}

// Función para sugerir un correo basado en el nombre de la persona
func sugerirCorreo(nombre string) string {
	return strings.ToLower(strings.ReplaceAll(nombre, " ", "")) + "@dominio.com"
}

// Función para sugerir correos basados en el nombre de la persona
func clientesSugerenciasCorreos(clientes *listaClientes) listaClientes {
	return mapLista(*clientes, func(cliente infoCliente) infoCliente {
		if !contieneNombreEnCorreo(cliente) {
			return infoCliente{
				nombre: cliente.nombre,
				// Suggest a modified email based on the client's name
				correo: sugerirCorreo(cliente.nombre),
				edad:   cliente.edad,
			}
		}
		return cliente
	})
}

// Función genérica map para listas de clientes
func mapLista(slice []infoCliente, f func(infoCliente) infoCliente) []infoCliente {
	mapped := make([]infoCliente, len(slice))
	for i, v := range slice {
		mapped[i] = f(v)
	}
	return mapped
}

// Función para obtener una lista de correos ordenados alfabéticamente
func (lc listaClientes) correosOrdenadosAlfabeticos() []string {
	correos := make([]string, len(lc))
	for i, cliente := range lc {
		correos[i] = cliente.correo
	}
	sort.Strings(correos)
	return correos
}

func main() {
	// 1) Crear lista de clientes
	var clientes listaClientes

	// Agregar clientes
	clientes.agregarCliente("Oscar Viquez", "oviquez@tec.ac.cr", 44)
	clientes.agregarCliente("Pedro Perez", "elsegundo@gmail.com", 30)
	clientes.agregarCliente("Maria Lopez", "mlopez@hotmail.com", 18)
	clientes.agregarCliente("Juan Rodriguez", "jrodriguez@gmail.com", 25)
	clientes.agregarCliente("Luisa Gonzalez", "muyseguro@tec.ac.cr", 67)
	clientes.agregarCliente("Marco Rojas", "loquesea@hotmail.com", 47)
	clientes.agregarCliente("Marta Saborio", "msaborio@gmail.com", 33)
	clientes.agregarCliente("Camila Segura", "csegura@ice.co.cr", 19)
	clientes.agregarCliente("Fernando Rojas", "frojas@estado.gov", 27)
	clientes.agregarCliente("Rosa Ramirez", "risuenna@gmail.com", 50)

	// Mostrar lista de clientes original
	fmt.Println("Lista de Clientes:")
	for _, cliente := range clientes {
		fmt.Printf("Nombre: %s, Correo: %s, Edad: %d\n", cliente.nombre, cliente.correo, cliente.edad)
	}

	fmt.Printf("\nEjercicio #2\n")

	// 2) Lista de clientes cuyos correos contienen el apellido
	apellido := "lopez" // Edite el apellido que desea encontrar en el correo.
	clientesFiltrados := listaClientes_ApellidoEnCorreo(&clientes, apellido)
	fmt.Printf("\nClientes cuyos correos contienen el apellido '%s':\n", apellido)
	for _, cliente := range clientesFiltrados {
		fmt.Printf("Nombre: %s, Correo: %s, Edad: %d\n", cliente.nombre, cliente.correo, cliente.edad)
	}

	fmt.Printf("\nEjercicio #3\n")
	// 3) Obtener la cantidad de correos cuyo dominio es de Costa Rica
	cantidad := cantidadCorreosCostaRica(&clientes)
	fmt.Printf("\nClientes cuyos correos pertenecen a dominios de Costa Rica:\n")
	for _, cliente := range filter(clientes, func(cliente infoCliente) bool {
		return esDominioCR(cliente.correo)
	}) {
		fmt.Printf("Nombre: %s, Correo: %s, Edad: %d\n", cliente.nombre, cliente.correo, cliente.edad)
	}
	fmt.Printf("\nCantidad de clientes cuyos correos pertenecen a dominios de Costa Rica: %d\n", cantidad)

	fmt.Printf("\nEjercicio #4\n")
	// 4) Sugerencias de correos para clientes
	clientesConSugerencias := clientesSugerenciasCorreos(&clientes)
	fmt.Println("\nClientes con sugerencias de correos:")
	for _, cliente := range clientesConSugerencias {
		fmt.Printf("Nombre: %s, Correo: %s, Edad: %d\n", cliente.nombre, cliente.correo, cliente.edad)
	}

	fmt.Printf("\nEjercicio #5\n")
	// 5) Correos ordenados alfabéticamente
	correosOrdenados := clientes.correosOrdenadosAlfabeticos()
	fmt.Println("\nCorreos ordenados alfabéticamente:")
	for _, correo := range correosOrdenados {
		fmt.Println(correo)
	}
}
