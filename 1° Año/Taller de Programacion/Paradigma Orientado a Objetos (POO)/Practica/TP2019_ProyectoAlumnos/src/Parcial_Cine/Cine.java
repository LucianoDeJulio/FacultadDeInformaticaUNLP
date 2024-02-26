package Parcial_Cine;


public class Cine {
    private String nombre;
    private String direccion;
    private String nomDueño;
    private int dimFS;
    private int dimLS;
    private Sala1 [] salas;

    public Cine(String nombre, String direccion, String nomDueño) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.nomDueño = nomDueño;
        this.dimFS = 5;
        this.dimLS = 1;
        this.salas = new Sala1 [this.dimFS];
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

    public String getNomDueño() {
        return nomDueño;
    }

    public void setNomDueño(String nomDueño) {
        this.nomDueño = nomDueño;
    }

    public int getDimFS() {
        return dimFS;
    }

    public int getDimLS() {
        return dimLS;
    }

    public void agregarSala (Sala1 unaS){
        if(this.dimLS < this.dimFS){
            this.salas[this.dimLS]= unaS;
            this.dimLS++;
        }
    }
    
    public void agregarPelicula (Pelicula unaP, int unNS){
        if(unNS <= this.dimLS){
            this.salas[unNS-1].setMovie(unaP);
        }
    }
    
    public void venderEntradas(int numS){
        if(this.salas[numS-1].getCantVendidas()< this.salas[numS-1].getCupoEntradas()){
            this.salas[numS-1].setCantVendidas(this.salas[numS-1].getCantVendidas()+1);
        }
    }
    
    public void devolverEntradas(int numS){
       if(this.salas[numS-1].getCantVendidas()< this.salas[numS-1].getCupoEntradas()){
           this.salas[numS-1].setCantVendidas(this.salas[numS-1].getCupoEntradas()-1);
       } 
    }
    
    public boolean verificarEntradasDisponibles(int numS){
        if(this.salas[numS-1].getCantVendidas()< this.salas[numS-1].getCupoEntradas()){
            return true;
        }else
            return false;
    }
    
    public int devolverSalaProyectada (String unaP){
        int i=0;
        while(this.dimLS < this.dimFS && this.salas[i].getMovie().getNombre().equals(unaP)){
            i++;
        }
        if(this.dimLS < this.dimFS){
            return (i+1);
        }else
            return -1;
    }
    
    public int mayorCantidadVendida (){
        int max,i;
        int salaMaxVendida = -1;
        max = -1;
        for(i=0; i<this.dimLS;i++){
            if(this.salas[i].getCantVendidas()> max){
                max = this.salas[i].getCantVendidas();
                salaMaxVendida = i;
            }
        }
        return salaMaxVendida;
    }
    
    public String peliculaMayorRecaudacion(){
        int max,i;
        
        max = -1;
        String peliMax= " ";
        for(i=0; i<this.dimLS;i++){
            if(this.salas[i].getCantVendidas()> max){
                max = this.salas[i].getCantVendidas();
                peliMax = this.salas[i].getMovie().getNombre();
            }
        }
        return peliMax;
    }
}
