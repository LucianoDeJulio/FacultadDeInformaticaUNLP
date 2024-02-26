package tema4;

public class Flota {
    private int dimF = 15;
    private int  dimL = 0;
    private Micro [] flotas = new Micro [dimF];

    public Flota() {
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }
    
    
    
    public boolean flotaLlena(){
        if(dimL == dimF ){
            return true;
        }else
            return false;
    }
    
    public void agregarMicro(Micro m){
      if(dimL < dimF){
        flotas [dimL] = new Micro();
        flotas [dimL] = m;
        dimL++;
      }
    }
    
    public boolean eliminarMicroPatente( String p){
        int i=0, f;
        while (i<dimL && !(flotas[i].getPatente().equals(p))){
            if(!flotas[i].getPatente().equals(p)){
                i++;
            }
        }
        if(i<dimL){
            for(f=i;f<dimL-1;f++){
                flotas[f]=flotas[f+1];  
            }
            dimL--;
            return true;
        }else
            return false;     
    }
    
    public Micro devolverMicroPatente( String p){
        int i=0, f;
        while (i<dimL && !(flotas[i].getPatente().equals(p))){
            if(!flotas[i].getPatente().equals(p)){
                i++;
            }
        }
        if(i<dimL){
            return flotas[i];
        }else
            return null;
    }
    
    public Micro devolverMicroDestino( String p){
        int i=0, f;
        while (i<dimL && !(flotas[i].getDestino().equals(p))){
            if(!flotas[i].getDestino().equals(p)){
                i++;
            }
        }
        if(i<dimL){
            return flotas[i];
        }else
            return null;
    }
    
    public void destinosDisponibles(){
        int i;
        for(i=0;i<dimL;i++){
            System.out.println("El destino del micro con patente " + flotas[i].getPatente() + " es: " + flotas[i].getDestino() + " a las " + flotas[i].getHoraSalida() + ".");
        }
    }

    
    
}
