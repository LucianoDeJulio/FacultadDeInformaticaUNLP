
package tema5;


public class Jugador extends Empleado {
    private int goles;
    private int partidos;

    public Jugador(int unG, int unP, String unN, double unSB) {
        super(unN,unSB);
        this.goles = unG;
        this.partidos = unP;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }
    
    public double calcularSueldoACobrar(){
        double promedio = goles/partidos;
        double sueldo;
        if(promedio > 0.5){
           sueldo = sueldoBas * 2;
        }else
           sueldo = sueldoBas;
        return sueldo;          
    }
    
    public String toString(){
       String aux = super.toString();
       return aux;
    }
}
