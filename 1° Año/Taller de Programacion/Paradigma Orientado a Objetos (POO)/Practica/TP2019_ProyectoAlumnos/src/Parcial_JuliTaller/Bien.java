
package Parcial_JuliTaller;

public class Bien {
    private String descripcion;
    private double costoUnidad;
    private String tipoDeBien;
    private int cantidadBien;

    public Bien(String descripcion, String tipoDeBien, double costoUnidad, int cantidadBien) {
        this.descripcion = descripcion;
        this.costoUnidad = costoUnidad;
        this.tipoDeBien = tipoDeBien;
        this.cantidadBien= cantidadBien;
    }

    public Bien() {
    }


    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getCostoUnidad() {
        return costoUnidad;
    }

    public void setCostoUnidad(double costoUnidad) {
        this.costoUnidad = costoUnidad;
    }

    public String getTipoDeBien() {
        return tipoDeBien;
    }

    public void setTipoDeBien(String tipoDeBien) {
        this.tipoDeBien = tipoDeBien;
    }

    public int getCantidadBien() {
        return cantidadBien;
    }

    public void setCantidadBien(int cantidadBien) {
        this.cantidadBien = cantidadBien;
    }
    
    
    
}
