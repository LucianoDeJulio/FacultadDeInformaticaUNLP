
package Parcial2;

public class Pelicula {
    private String nombre;
    private String director;
    private int duracion;

    public Pelicula(String nombre, String director, int duracion) {
        this.nombre = nombre;
        this.director = director;
        this.duracion = duracion;
    }

    public Pelicula() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }
    
    
}
