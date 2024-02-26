
package tema5;

public abstract class Empleado {
    private String nombre;
    double sueldoBas;
    
    public Empleado (String unN,double unSB){
        setNombre(unN);
        setSueldoBas(unSB);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBas() {
        return sueldoBas;
    }

    public void setSueldoBas(double sueldoBas) {
        this.sueldoBas = sueldoBas;
    }

    public abstract double calcularSueldoACobrar();
    
    public String toString(){
        String aux = "El empleado: " + getNombre() + " cobra un sueldo basico de : " +  this.calcularSueldoACobrar();             
             return aux;
       }
}
