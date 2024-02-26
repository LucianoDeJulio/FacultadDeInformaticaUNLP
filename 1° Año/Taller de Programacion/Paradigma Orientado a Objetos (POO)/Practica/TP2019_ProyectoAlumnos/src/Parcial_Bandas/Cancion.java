
package Parcial_Bandas;

public class Cancion {
    private String nombreC;
    private int duracionC;

    public Cancion(String nombreC, int duracionC) {
        this.nombreC = nombreC;
        this.duracionC = duracionC;
    }

    public Cancion() {
    }

    public String getNombreC() {
        return nombreC;
    }

    public void setNombreC(String nombreC) {
        this.nombreC = nombreC;
    }

    public int getDuracionC() {
        return duracionC;
    }

    public void setDuracionC(int duracionC) {
        this.duracionC = duracionC;
    }
    
    
}
