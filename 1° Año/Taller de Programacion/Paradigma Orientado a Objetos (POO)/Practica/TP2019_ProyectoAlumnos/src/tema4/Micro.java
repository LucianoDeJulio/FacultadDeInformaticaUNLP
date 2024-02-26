package tema4;

public class Micro {
    private int cantAsientos=20;
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean [] asientos = new boolean[cantAsientos];
    private int cantAsientosOcupados;

    public Micro(String patente, String destino, String horaSalida) {
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        this.cantAsientosOcupados = 0;
    }
    
    public Micro(){
        
    }

    public int getCantAsientos() {
        return cantAsientos;
    }
    
    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public int getCantAsientosOcupados() {
        return cantAsientosOcupados;
    }

    public void setCantAsientosOcupados(int cantAsientosOcupados) {
        this.cantAsientosOcupados = cantAsientosOcupados;
    }
    
    public void inicializarMicro(){
        int i;
        for(i=0; i<cantAsientos; i++){
            asientos[i]= false;
        }
    }
    
    public int asientosOcupados(){
        int i;
        int cant=0;
        for(i=0;i<20;i++){
            if(asientos[i]==true){
                cant++;
            }
        }
        return cant;      
    }
    
    public boolean microOcupado(){
        int i=0;
        boolean ocu=true;
        while(i<cantAsientos && ocu==true){
            if(asientos[i]==false){
                ocu=false;
            }
            i++;
        }
        return ocu;
    }
    
    public boolean validarAsiento(int unAsiento){
        if(unAsiento>=0 && unAsiento<20){
            return true;
        }else
            return false;     
    }
    
    public boolean asientoOcupado(int unAsiento){
        if(asientos[unAsiento]==true){
            return false;
        }else
            return true;
    }
    
    public void ocuparAsiento(int unAsiento){
        asientos[unAsiento]=true;
        cantAsientosOcupados++;
    }
    
    public void liberarAsiento(int unAsiento){
        asientos[unAsiento]=false;
        cantAsientosOcupados--;
    }
    
    public int asientoLibre(){
        int i=0;
        boolean sig=true;
        while(i<20 && sig==true){
            if(asientos[i]==false){
                sig=false;
            }
            if(sig==true){
                i++;    
            }
        }
        if(i==20){
            return -1;    
        }else
            return i;    
    }
    
    
    
    
    
    
    
    
}
