package Parcial_TeoricoPractico;

public class Teorico {
    private String nombre;
    private String fecha;
    private int dimF=5;
    private boolean[] notas= new boolean[dimF];

    public Teorico(String nombre, String fecha) {
        this.nombre = nombre;
        this.fecha = fecha;
    }

    public Teorico() {
    }

    public boolean[] getNotas() {
        return notas;
    }
    

    public String getNombre() {
        return nombre;
    }

    public String getFecha() {
        return fecha;
    }

    public int getDimF() {
        return dimF;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setNotas(boolean[] notas) {
        this.notas = notas;
    }
    
    

    public boolean validarPregunta(int unaPregunta){
        if((unaPregunta)>=0 && (unaPregunta)<5){
            return true;
        }else
            return false;      
    }
    
    public void cargarResultadoPregunta(int unaPregunta, boolean unResultado){
        this.notas[unaPregunta]=unResultado;
    }
    
    public boolean verResultadoPregunta(int unaPregunta){
        return this.notas[unaPregunta-1];
    }
    
    public int calcularResultadoTeorico(){
        int i, cont=0;
        for(i=0;i<this.dimF;i++){
            if(this.notas[i]==true){
                cont = cont +2;
            }
        }
        return cont;            
    }
    
    public boolean estaAprobado(){
        if(this.calcularResultadoTeorico()>=4){
            return true;
        }else
            return false;
    }
    
    public String toString(){
        String a;
        if(estaAprobado()==true){
            a = " aprobo.";
        }else
            a = " desaprobo.";
        return "El alumno " + this.getNombre() + " con nota final " + this.calcularResultadoTeorico() + a; 
    }
          
}
