
package Parcial1;

public class Disco {
    private String nombre;
    private int fecha;
    private Cancion  [] canciones;
    private int dimL;
    private int dimF;

    public Disco(String nombre, int fecha) {
        this.nombre = nombre;
        this.fecha = fecha;
        this.dimL = 0;
        this.dimF = 25;
        this.canciones = new Cancion [this.dimF];
    }

    public Disco() {
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    public int getDimL() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }
    
    public void agregarCancion(Cancion unC){
        if(this.dimL < this.dimF){
            this.canciones[this.dimL]= unC;
            this.dimL++;
        } 
    }
    
    public int duracionCancion(String unaC){
        int i = 0;
        while(i < this.getDimL() && !(this.canciones[i].getNombre().equals(unaC))){
            i++;
        }
        if(i < this.getDimL()){
            return this.canciones[i].getDuracion();
        }else{
            return -1;
        }
    }
    
    public Cancion maxDuracionCancion(){
        int i, max = -1;
        Cancion cancionMax = null;
        for(i=0; i < this.dimL; i ++){
            if(this.canciones[i].getDuracion() > max){
                max= this.canciones[i].getDuracion();
                cancionMax = this.canciones[i];
            }
        }
        return cancionMax;
    }
    
    
    public String toString (){
        int i;
        String str= ("El disco " + this.getNombre() + " tiene las siguientes canciones: ");
        for(i=0; i < this.dimL;i++){
            str= (str  + this.canciones[i].getNombre() + " con una duracion en segundo de: " + this.canciones[i].getDuracion()) + ", ";
        }
        return str;
    }
    
}
