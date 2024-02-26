
package Parcial_Cine;

public class Pelicula {
    private String nombre;
    private String direccion;
    private int durMinutos;

    public Pelicula(String nombre, String direccion, int durMinutos) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.durMinutos = durMinutos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getDurMinutos() {
        return durMinutos;
    }

    public void setDurMinutos(int durMinutos) {
        this.durMinutos = durMinutos;
    }
    
    
}
