
package Parcial5;

public class Bien {
    private String descripcion;
    private String tipoBien;
    private int costoUnidad;
    private int cantidadBien;

    public Bien(String descripcion, String tipoBien, int costoUnidad, int cantidadBien) {
        this.descripcion = descripcion;
        this.tipoBien = tipoBien;
        this.costoUnidad = costoUnidad;
        this.cantidadBien = cantidadBien;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipoBien() {
        return tipoBien;
    }

    public void setTipoBien(String tipoBien) {
        this.tipoBien = tipoBien;
    }

    public int getCostoUnidad() {
        return costoUnidad;
    }

    public void setCostoUnidad(int costoUnidad) {
        this.costoUnidad = costoUnidad;
    }

    public int getCantidadBien() {
        return cantidadBien;
    }

    public void setCantidadBien(int cantidadBien) {
        this.cantidadBien = cantidadBien;
    }
    
    
}
