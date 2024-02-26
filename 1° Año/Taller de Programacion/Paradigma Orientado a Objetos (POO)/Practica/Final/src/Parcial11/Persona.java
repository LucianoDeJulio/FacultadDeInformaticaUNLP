
package Parcial11;


public abstract class Persona {
    private String nombre;
    private int dni;
    private double sueldo_basico;

    public Persona(String nombre, int dni, double sueldo_basico) {
        this.nombre = nombre;
        this.dni = dni;
        this.sueldo_basico = sueldo_basico;
    }

    public Persona() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public double getSueldo_basico() {
        return sueldo_basico;
    }

    public void setSueldo_basico(double sueldo_basico) {
        this.sueldo_basico = sueldo_basico;
    }
    
    public double aumentarSueldo(int porcentaje){
        return (this.getSueldo_basico()+((this.getSueldo_basico()*porcentaje)/100));
    }
    
    public abstract double calcularSueldo();
    
    public String toString(){
        return ("Nombre: " + this.getNombre() + " " + "DNI: " + this.getDni() + " " + "Sueldo a cobrar: " + calcularSueldo());
    }
}
