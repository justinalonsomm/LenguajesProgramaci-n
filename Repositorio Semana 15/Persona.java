// Clase Persona
class Persona {
    private String nombre;
    private String apellido;
    private String email;

    public Persona(String nombre, String apellido, String email) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
    }

    @Override
    public String toString() {
        return "Persona{" +
                "nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}

// Clase ContactoSimple
class ContactoSimple extends Persona {
    public ContactoSimple(String nombre, String apellido, String email) {
        super(nombre, apellido, email);
    }
}

// Clase ContactoFamiliar
class ContactoFamiliar extends ContactoSimple {
    private String parentesco;

    public ContactoFamiliar(String nombre, String apellido, String email, String parentesco) {
        super(nombre, apellido, email);
        this.parentesco = parentesco;
    }

    @Override
    public String toString() {
        return "ContactoFamiliar{" +
                "parentesco='" + parentesco + '\'' +
                ", " + super.toString() +
                '}';
    }
}

// Clase ContactoEmpresarial
class ContactoEmpresarial extends ContactoSimple {
    private String empresa;
    private String puesto;

    public ContactoEmpresarial(String nombre, String apellido, String email, String empresa, String puesto) {
        super(nombre, apellido, email);
        this.empresa = empresa;
        this.puesto = puesto;
    }

    @Override
    public String toString() {
        return "ContactoEmpresarial{" +
                "empresa='" + empresa + '\'' +
                ", puesto='" + puesto + '\'' +
                ", " + super.toString() +
                '}';
    }
}

// Clase EventoSimple
class EventoSimple {
    private String nombre;
    private String fecha;

    public EventoSimple(String nombre, String fecha) {
        this.nombre = nombre;
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "EventoSimple{" +
                "nombre='" + nombre + '\'' +
                ", fecha='" + fecha + '\'' +
                '}';
    }
}

// Clase EventoEspecifico (Ejemplo: Reunión de Trabajo)
class EventoReunion extends EventoSimple {
    private String lugar;
    private String agenda;

    public EventoReunion(String nombre, String fecha, String lugar, String agenda) {
        super(nombre, fecha);
        this.lugar = lugar;
        this.agenda = agenda;
    }

    @Override
    public String toString() {
        return "EventoReunion{" +
                "lugar='" + lugar + '\'' +
                ", agenda='" + agenda + '\'' +
                ", " + super.toString() +
                '}';
    }
}
