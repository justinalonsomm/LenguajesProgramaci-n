public class EagerSingletonAgenda {
    // Instancia creada de manera anticipada al cargar la clase
    private static final Agenda instance = new Agenda();

    private EagerSingletonAgenda() {}

    public static Agenda getInstance() {
        return instance;
    }
}
