
package Parcial5;

public  abstract class Subsidio {
    private String nombre;
    private String apellido;
    private String planTrabajo;
    private String fecha;

    public Subsidio(String nombre, String apellido, String fecha) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.fecha = fecha;
    }

    public Subsidio() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getPlanTrabajo() {
        return planTrabajo;
    }

    public void setPlanTrabajo(String planTrabajo) {
        this.planTrabajo = planTrabajo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    
    public String toString(){
        return ("El investigador " + getNombre() + " " + getApellido() + " con plan de trabajo " + getPlanTrabajo() + " con fecha " + getFecha());
    }
    
    public abstract double montoTotalSolicitado();   
}
