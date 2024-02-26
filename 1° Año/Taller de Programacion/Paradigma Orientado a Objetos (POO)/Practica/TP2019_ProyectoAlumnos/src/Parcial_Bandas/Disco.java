
package Parcial_Bandas;

public class Disco {
    private String nombreD;
    private int fecha;
    private Cancion [] canciones;
    private int dimFD;
    private int dimLD;

    public Disco(String nombreD, int fecha) {
        this.nombreD = nombreD;
        this.fecha = fecha;
        this.dimFD = 25;
        this.dimLD = 0;
        this.canciones = new Cancion [this.dimFD];
    }

    public Disco() {
    }

    public String getNombreD() {
        return nombreD;
    }

    public void setNombreD(String nombreD) {
        this.nombreD = nombreD;
    }

    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    public int getDimFD() {
        return dimFD;
    }

    public int getDimLD() {
        return dimLD;
    }
    
    public void agregarCancion(Cancion unC){
        if(this.dimLD < this.dimFD){
            this.canciones[this.dimLD] = unC;
            this.dimLD++;
        }
    }
    
    public int duracionCancion(String unaC){
        int i = 0;
        while(i < this.dimLD && !this.canciones[i].getNombreC().equals(unaC) ){
            i++;
        }
        if(i < this.dimLD){
            return this.canciones[i].getDuracionC();
        }else
            return -1;
    }
    
    public Cancion maxDuracionCancion(){
        int i, max = -1;
        Cancion cancionMax = null;
        for(i=0; i < this.dimLD; i ++){
            if(this.canciones[i].getDuracionC() > max){
                max= this.canciones[i].getDuracionC();
                cancionMax = this.canciones[i];
            }
        }
        return cancionMax;
    }
    
    
        
}
