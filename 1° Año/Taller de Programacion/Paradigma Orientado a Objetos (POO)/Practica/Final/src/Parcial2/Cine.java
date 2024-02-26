
package Parcial2;


public class Cine {
    
    private String nombre;
    private String direccion;
    private String nombreDueño;
    private Sala [] salas;
    private int dimF;
    private int dimL;

    public Cine(String nombre, String direccion, String nombreDueño) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.nombreDueño = nombreDueño;
        this.dimF = 5;
        this.dimL = 0;
        this.salas = new Sala [this.dimF];
    }

    public Cine() {
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNombreDueño() {
        return nombreDueño;
    }

    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }
    
    public void agregarSala(Sala unaS){
        if(this.dimL < this.dimF){
            this.salas[this.dimL]= unaS;
            this.dimL++;
        }
    }
    
    public void agregarPelicula(int numS, Pelicula unaP){
        if(numS <= dimL){
            this.salas[numS-1].setPeli(unaP);
        }
    }
    
    public void venderEntradas(int numS){
        if(this.salas[numS-1].getCantEntradasVendidas() < this.salas[numS-1].getCupoEntradas()){
            this.salas[numS-1].setCantEntradasVendidas(this.salas[numS-1].getCantEntradasVendidas()+1);
        }
    }
    
    public void devolverEntradas(int numS){
       if(this.salas[numS-1].getCantEntradasVendidas()< this.salas[numS-1].getCupoEntradas()){
           this.salas[numS-1].setCantEntradasVendidas(this.salas[numS-1].getCupoEntradas()-1);
       } 
    }
    
    public boolean verificarEntradasDisponibles(int numS){
        if(this.salas[numS-1].getCantEntradasVendidas()< this.salas[numS-1].getCupoEntradas()){
            return true;
        }else
            return false;
    }
    
    public int devolverSalaPeliProyectada (String unaP){
        int i=0;
        while(this.dimL < this.dimF && !(this.salas[i].getPeli().getNombre().equals(unaP))){
            i++;
        }
        if(this.dimL < this.dimF){
            return (i+1);
        }else
            return -1;
    }
    
    public int mayorCantidadVendida (){
        int max,i,salaMax;
        max = -1;
        salaMax = 0;
        for(i=0; i<this.dimL;i++){
            if(this.salas[i].getCantEntradasVendidas()> max){
                max = this.salas[i].getCantEntradasVendidas();
                salaMax = i + 1; 
            }
        }
        return salaMax;
    }
    
    public String peliculaMayorRecaudacion(){
        int max,i;
        max = -1;
        String peliMax= " ";
        for(i=0; i<this.dimL;i++){
            if(this.salas[i].getCantEntradasVendidas()> max){
                max = this.salas[i].getCantEntradasVendidas();
                peliMax = this.salas[i].getPeli().getNombre();
            }
        }
        return peliMax;
    }
}
