
package Parcial_JuliTaller;

public abstract class Subsidio {
    private String nombre;
    private String apellido;
    private String planTrabajo;
    private String fecha;

    public Subsidio(String unNombre, String unApellido, String unaFecha) {
        this.nombre = unNombre;
        this.apellido = unApellido;
        this.fecha = unaFecha;
    }

    public Subsidio() {
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getPlanTrabajo() {
        return planTrabajo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public void setPlanTrabajo(String planTrabajo) {
        this.planTrabajo = planTrabajo;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    public String toString(){
        return ("El investigador " + getNombre() + " " + getApellido() + " con plan de trabajo " + getPlanTrabajo() + " con fecha " + getFecha() + "El monto total solicitado es:" +  this.montoTotalSolicitado());
    }
    
    public abstract double montoTotalSolicitado();
    
}
