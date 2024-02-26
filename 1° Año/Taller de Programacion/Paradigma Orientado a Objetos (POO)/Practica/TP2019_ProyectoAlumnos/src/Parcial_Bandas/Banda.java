
package Parcial_Bandas;

public class Banda {
    private String nombre;
    private String ciudad;
    private String estilo;
    private Disco [] discos;
    private int dimFD;
    private int dimLD;

    public Banda(String nombre, String ciudad, String estilo) {
        this.nombre = nombre;
        this.ciudad = ciudad;
        this.estilo = estilo;
        this.dimFD = 20;
        this.dimLD = 0;
        this.discos = new Disco [this.dimFD];
        
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

    public String getEstilo() {
        return estilo;
    }

    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }

    public int getDimFD() {
        return dimFD;
    }

    public int getDimLD() {
        return dimLD;
    }
    
    public void agregarDiscoBanda(Disco unD){
        if(this.dimLD < this.dimFD){
            this.discos[this.dimLD] = unD;
            this.dimLD++;
        }
    }
    
    public void agregarCancionDisco(Cancion unC){
        if(this.dimLD < this.dimFD){
            this.discos[this.dimLD].agregarCancion(unC);
        }
    }
    
    public int cantDiscoBanda(){  
        return this.dimLD;   
    }
    
    public int duracionCancionDisco(String unND, String unaC){
        int i = 0;
        while(i < this.dimLD && !this.discos[i].getNombreD().equals(unND)){
            i++;
        }
        if(i < this.dimLD){
           return this.discos[i].duracionCancion(unaC);
        }else
           return -1;  
    }
   
    public String duracionMaxCancion(){
        int i,max= -1;
        Cancion c;
        String cancionMax= " ";
        for(i=0; i < this.dimLD; i++){
                c = this.discos[i].maxDuracionCancion();
                if(c.getDuracionC() > max){
                    max = c.getDuracionC();
                   cancionMax = c.getNombreC();
                }
            }
        return cancionMax;
    }
    
    public int cancionesDicoViejo(){
        int cant=0,fechaMin=9999999;
        int i;
        for(i=0; i < this.dimLD; i++){
           if(this.discos[i].getFecha() < fechaMin){
                fechaMin= this.discos[i].getFecha();
                cant= this.discos[i].getDimLD();
                }
        }
        return cant;
    }
    
}
