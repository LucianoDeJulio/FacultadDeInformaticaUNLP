
package tema5;

public class Entrenador extends Empleado {
    
    private int Campeonatos;

    public Entrenador(int Campeonatos, String unN, double unSB) {
        super(unN, unSB);
        this.Campeonatos = Campeonatos;
    }

    public int getCampeonatos() {
        return Campeonatos;
    }

    public void setCampeonatos(int Campeonatos) {
        this.Campeonatos = Campeonatos;
    }
    
    public double calcularSueldoACobrar (){
        double SueldoNeto;
        if (1 < Campeonatos && Campeonatos < 4){
            SueldoNeto = sueldoBas + 5000;
        }else
            if( 5 < Campeonatos && Campeonatos < 10){
                SueldoNeto = sueldoBas + 30000; 
            }else
                if (10 < Campeonatos){
                    SueldoNeto = sueldoBas + 50000; 
                }else
                    SueldoNeto = sueldoBas;
       return SueldoNeto; 
    }
    
    public String toString(){
        String aux = super.toString();
        return aux;
    }
    
}
