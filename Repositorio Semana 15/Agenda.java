import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

class Agenda {
    private List<Object> elementos;

    public Agenda() {
        this.elementos = new ArrayList<>();
    }

    public void agregarElemento(Object elemento) {
        elementos.add(elemento);
    }

    public void eliminarElemento(Object elemento) {
        elementos.remove(elemento);
    }

    public List<Object> getElementos() {
        return elementos;
    }

    public List<Object> filtrarContactos() {
        return elementos.stream()
                .filter(elemento -> elemento instanceof ContactoSimple)
                .collect(Collectors.toList());
    }

    public List<Object> filtrarEventos() {
        return elementos.stream()
                .filter(elemento -> elemento instanceof EventoSimple)
                .collect(Collectors.toList());
    }
    
}
