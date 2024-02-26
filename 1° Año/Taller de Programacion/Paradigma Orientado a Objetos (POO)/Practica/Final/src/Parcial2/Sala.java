
package Parcial2;

public class Sala {
    private int numSala;
    private int cupoEntradas;
    private int cantEntradasVendidas;
    private Pelicula peli;

    public Sala(int numSala, int cupoEntradas, int cantEntradasVendidas, Pelicula peli) {
        this.numSala = numSala;
        this.cupoEntradas = cupoEntradas;
        this.cantEntradasVendidas = cantEntradasVendidas;
        this.peli = peli;
    }

    public Sala() {
    }

    

    public int getNumSala() {
        return numSala;
    }

    public void setNumSala(int numSala) {
        this.numSala = numSala;
    }

    public int getCupoEntradas() {
        return cupoEntradas;
    }

    public void setCupoEntradas(int cupoEntradas) {
        this.cupoEntradas = cupoEntradas;
    }

    public int getCantEntradasVendidas() {
        return cantEntradasVendidas;
    }

    public void setCantEntradasVendidas(int cantEntradasVendidas) {
        this.cantEntradasVendidas = cantEntradasVendidas;
    }

    public Pelicula getPeli() {
        return peli;
    }

    public void setPeli(Pelicula peli) {
        this.peli = peli;
    }
    
    
    
}
