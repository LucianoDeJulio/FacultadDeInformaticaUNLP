
package tema4;
public class Flota1 {
    private int dimF = 15;
    private int  dimL = 0;
    private Micro [] flotas = new Micro [dimF];

    public Flota1() {
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
                i++;
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
    
    public Micro buscarMicroPatente( String m){
        int i=0;
        while(i < dimL && !(flotas[i].getPatente().equals(m))){
            i++;
        }
        if (i< dimL){
            return flotas[i];
        }else
            return null;
    }
    
    public Micro buscarMicroDestino( String m){
        int i=0;
        while(i < dimL && !(flotas[i].getDestino().equals(m))){
            i++;
        }
        if (i< dimL){
            return flotas[i];
        }else
            return null;
    }
    
}
