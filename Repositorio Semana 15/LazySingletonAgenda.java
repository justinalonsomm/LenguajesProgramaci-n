public class LazySingletonAgenda {
    private static Agenda instance;

    private LazySingletonAgenda() {}

    public static synchronized Agenda getInstance() {
        if (instance == null) {
            instance = new Agenda();
        }
        return instance;
    }
}
