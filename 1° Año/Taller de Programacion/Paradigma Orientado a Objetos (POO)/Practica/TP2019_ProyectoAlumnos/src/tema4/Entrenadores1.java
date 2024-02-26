
package tema4;

public class Entrenadores1 {
    private String nombre;
    private double SueldoBas;
    private int Campeonatos;
    
    public Entrenadores1 (String unNombre, double unSueldoBas, int unCampeonato){
        nombre = unNombre;
        SueldoBas = unSueldoBas;
        Campeonatos = unCampeonato; 
    }
    public Entrenadores1 (){
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBas() {
        return SueldoBas;
    }

    public void setSueldoBas(double SueldoBas) {
        this.SueldoBas = SueldoBas;
    }

    public int getCampeonatos() {
        return Campeonatos;
    }

    public void setCampeonatos(int Campeonatos) {
        this.Campeonatos = Campeonatos;
    }
    
    public double calcularSueldoACobrar (){
        double SueldoNeto = 0;
        if (1 < Campeonatos && Campeonatos < 4){
            SueldoNeto = SueldoBas + 5000;
        }else
            if( 5 < Campeonatos && Campeonatos < 10){
                SueldoNeto = SueldoBas + 30000; 
            }else
                if (10 < Campeonatos){
                    SueldoNeto = SueldoBas + 50000; 
                }
       return SueldoNeto; 
    }
    
      public String toString(){
        String aux; 
        aux = "El entrenador  " + nombre + " que gano " + Campeonatos + " campeonatos tiene un sueldo total de : " + calcularSueldoACobrar();
        return aux;
}
} 
