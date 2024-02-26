
package Parcial_Cine;

public class Sala1 {
    private int cupoEntradas;
    private int cantVendidas;
    private int numSala;
    private Pelicula movie;

    public Sala1(int cupoEntradas, int cantVendidas, int numSala, Pelicula movie) {
        this.cupoEntradas = cupoEntradas;
        this.cantVendidas = cantVendidas;
        this.numSala = numSala;
        this.movie = movie;
    }

    public Sala1() {
    }

    public int getCupoEntradas() {
        return cupoEntradas;
    }

    public void setCupoEntradas(int cupoEntradas) {
        this.cupoEntradas = cupoEntradas;
    }

    public int getCantVendidas() {
        return cantVendidas;
    }

    public void setCantVendidas(int cantVendidas) {
        this.cantVendidas = cantVendidas;
    }

    public Pelicula getMovie() {
        return movie;
    }

    public void setMovie(Pelicula movie) {
        this.movie = movie;
    }

    public int getNumSala() {
        return numSala;
    }
    
}
