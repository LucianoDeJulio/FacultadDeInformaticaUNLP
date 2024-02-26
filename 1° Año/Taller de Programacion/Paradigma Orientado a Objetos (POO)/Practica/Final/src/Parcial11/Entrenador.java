
package Parcial11;

public class Entrenador  extends Persona{
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre, int dni, double sueldo_basico) {
        super(nombre, dni, sueldo_basico);
        this.campeonatos = campeonatos;
    }

    public Entrenador() {
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    public double calcularSueldo(){
        return (this.getSueldo_basico()+ (this.getCampeonatos()*5000));
    }
    
   
    
}
