
package Parcial3;

public class Bandas {
    private String nombreB;
    private String ciuFormacion;
    private int cantIntegrantes;

    public Bandas(String nombreB, String ciuFormacion, int cantIntegrantes) {
        this.nombreB = nombreB;
        this.ciuFormacion = ciuFormacion;
        this.cantIntegrantes = cantIntegrantes;
    }

    public Bandas() {
    }

    public String getNombreB() {
        return nombreB;
    }

    public void setNombreB(String nombreB) {
        this.nombreB = nombreB;
    }

    public String getCiuFormacion() {
        return ciuFormacion;
    }

    public void setCiuFormacion(String ciuFormacion) {
        this.ciuFormacion = ciuFormacion;
    }

    public int getCantIntegrantes() {
        return cantIntegrantes;
    }

    public void setCantIntegrantes(int cantIntegrantes) {
        this.cantIntegrantes = cantIntegrantes;
    }
    
}
