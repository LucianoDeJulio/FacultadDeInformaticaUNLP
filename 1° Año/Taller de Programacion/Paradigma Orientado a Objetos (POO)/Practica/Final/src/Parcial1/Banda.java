
package Parcial1;

public class Banda {
    private String nombre;
    private String ciudad;
    private String estiloMusical;
    private Disco [] discos;
    private int dimF;
    private int dimL;

    public Banda(String nombre, String ciudad, String estiloMusical) {
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.estiloMusical = estiloMusical;
        this.dimF = 20;
        this.dimL = 0;
        this.discos = new Disco [this.dimF];
    }

    public Banda() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getEstiloMusical() {
        return estiloMusical;
    }

    public void setEstiloMusical(String estiloMusical) {
        this.estiloMusical = estiloMusical;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }
    
    public void agregarDisco(Disco unD){
        if(this.dimL < this.dimF){
            this.discos[this.dimL] = unD;
            this.dimL++;
        }
    }
    
    public void agregarCancionAdisco(Disco unD,Cancion unC){
        int i=0;
        while(i < this.dimL && !this.discos[i].equals(unD)){
            i++;
        }
        if(i < this.dimL){
            this.discos[i].agregarCancion(unC);
        }
    }
    
    public int cantDiscos(){
        return this.dimL;
    }
    
    public int duracionCancionDisco(String unND, String unaC){
        int i = 0;
        while(i < this.getDimL() && !(this.discos[i].getNombre().equals(unND))){
            i++;
        }
        if(i < this.getDimL()){
           return this.discos[i].duracionCancion(unaC);
        }else{
           return -1;
        }
    }
    
    public String duracionMaxCancion(){
        int i,max= -1;
        Cancion c;
        String cancionMax= " ";
        for(i=0; i < this.dimL; i++){
                c = this.discos[i].maxDuracionCancion();
                if(c.getDuracion() > max){
                    max = c.getDuracion();
                   cancionMax = c.getNombre();
                }
            }
        return cancionMax;
    }
    
    public int cancionesDiscoViejo(){
        int cant=0,fechaMin=9999999;
        int i;
        for(i=0; i < this.dimL; i++){
           if(this.discos[i].getFecha() < fechaMin){
                fechaMin= this.discos[i].getFecha();
                cant= this.discos[i].getDimL();
                }
        }
        return cant;
    }
    
    public String toString(){
        int i = 0;
        String str= "El nombre de la banda es  " + this.getNombre() + " ";
        for(i=0; i < this.dimL; i++){
            str = str + ((this.discos[i].toString()) + " ");
        }
        return str;
    }

    
}
