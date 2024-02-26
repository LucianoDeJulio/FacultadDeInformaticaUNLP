
package tema5;

public class Trabajador extends Persona {
    String actividad;

    public Trabajador(String actividad, String nombre, int dni, int edad) {
        super(nombre, dni, edad);
        this.actividad = actividad;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }
    
    public String toString(){
        String aux = super.toString() + " y mi trabajo es : " + getActividad ();
             return aux;
       }
}
