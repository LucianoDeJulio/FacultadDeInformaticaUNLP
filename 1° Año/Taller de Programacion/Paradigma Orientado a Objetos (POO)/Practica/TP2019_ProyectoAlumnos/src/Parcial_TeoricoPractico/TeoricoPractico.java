package Parcial_TeoricoPractico;

public class TeoricoPractico extends Teorico {
    private double punPrac;

    public TeoricoPractico(double punPrac, String nombre, String fecha) {
        super(nombre, fecha);
        this.punPrac = punPrac;
    }

    public TeoricoPractico(double punPrac) {
        this.punPrac = punPrac;
    }
    
     public double getPunPrac() {
        return punPrac;
    }

    public void setPunPrac(double punPrac) {
        this.punPrac = punPrac;
    }
    
    public boolean validarPreguntaTP (int unP){
        return super.validarPregunta(unP);
    }
    
    public void cargarResultadoTP(int unP, boolean unR){
        super.cargarResultadoPregunta(unP, unR);
    }
    
    public boolean verResultadoPreguntaTP(int unP){
        return super.verResultadoPregunta(unP);
    }
    
    public double calcularNotaTeoricoPractico(){
        return (super.calcularResultadoTeorico()/2)+ this.getPunPrac();
    }
    
    public boolean estaAprobadoTP(){
        if (calcularNotaTeoricoPractico()>=6){
            return true;
        }else
            return false;
    }
    
    public String toString(){
        String a;
        if(estaAprobadoTP()==true){
            a = " aprobo.";
        }else
            a = " desaprobo.";
        return "El alumno " + this.getNombre() + " con nota final " + this.calcularNotaTeoricoPractico() + a; 
    }
    
    
}
