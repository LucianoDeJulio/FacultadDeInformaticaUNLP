
package Parcial11;

public class Equipo {
    private String nombre;
    private Entrenador dt;
    private Jugador [] jugadores;
    private int dimF;

    public Equipo(String nombre, Entrenador dt) {
        this.nombre = nombre;
        this.dt = dt;
        this.dimF= 7;
        this.jugadores = new Jugador [this.dimF];
    }

    public Equipo() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Entrenador getDt() {
        return dt;
    }

    public void setDt(Entrenador dt) {
        this.dt = dt;
    }


    public int getDimF() {
        return dimF;
    }
    
    public boolean validarPosicion(int unaPosicion){
        if((unaPosicion-1) < dimF && ((unaPosicion-1) >= 0)){
            return true;
        }else
            return false;
    }
    
    public void asignarPosicion(Jugador unJ, int pos){
        if(this.validarPosicion(pos) && (this.jugadores[pos-1]==null)){
            this.jugadores[pos-1]= unJ;
        }
    }
    
    public Jugador buscarJugador(int unaP){
        if(this.validarPosicion(unaP))
           if((this.jugadores[unaP-1]== null))
               return this.jugadores[unaP-1];
        return null;
    }
    
    public String posicionVacia(){
        int i;
        String vacio = "Posicion sin jugador: ";
        for(i=0; i < this.dimF;i++){
            if(this.jugadores[i]==(null)){
                vacio = vacio + (i+1); 
            }
        }
        return vacio; 
    }
    
    public double sueldoDelEquipo(){
        double total= dt.calcularSueldo();
        int i;
        for(i=0; i< dimF; i++){
            total = total + this.jugadores[i].calcularSueldo();
        }
        return total;
    }
    
    
    public String toString(){
       String jugadores = "El jugador con: ";
       int i;
       for(i=0; i < this.dimF; i++){
          if(this.jugadores[i] != null) 
                jugadores = jugadores + this.jugadores[i].toString();
       }
       return("El nombre del Equipo es: " + this.getNombre() + " el entrenador es: " + this.dt.toString() + " y los jugadores son: " + jugadores ); 
    }
    
    
}
