public class Main {
    public static void main(String[] args) {
        // Crear instancia de Agenda usando Lazy Singleton
        Agenda agenda = LazySingletonAgenda.getInstance();
        // Alternativamente, se puede usar EagerSingletonAgenda
        // Agenda agenda = EagerSingletonAgenda.getInstance();

        // Crear contactos
        ContactoSimple contacto1 = new ContactoSimple("Juan", "Perez", "juan.perez@example.com");
        ContactoFamiliar contacto2 = new ContactoFamiliar("Maria", "Lopez", "maria.lopez@example.com", "Hermana");
        ContactoEmpresarial contacto3 = new ContactoEmpresarial("Carlos", "Garcia", "carlos.garcia@empresa.com", "Empresa XYZ", "Gerente");

        // Crear eventos
        EventoSimple evento1 = new EventoSimple("Cumpleaños", "2024-06-15");
        EventoReunion evento2 = new EventoReunion("Reunión de Trabajo", "2024-06-20", "Sala de conferencias", "Presentación de resultados");

        // Agregar elementos a la agenda
        agenda.agregarElemento(contacto1);
        agenda.agregarElemento(contacto2);
        agenda.agregarElemento(contacto3);
        agenda.agregarElemento(evento1);
        agenda.agregarElemento(evento2);

        // Imprimir todos los elementos
        System.out.println("Todos los elementos de la agenda:");
        agenda.getElementos().forEach(System.out::println);

        // Filtrar y imprimir contactos
        System.out.println("\nContactos en la agenda:");
        agenda.filtrarContactos().forEach(System.out::println);

        // Filtrar y imprimir eventos
        System.out.println("\nEventos en la agenda:");
        agenda.filtrarEventos().forEach(System.out::println);
    }
}
