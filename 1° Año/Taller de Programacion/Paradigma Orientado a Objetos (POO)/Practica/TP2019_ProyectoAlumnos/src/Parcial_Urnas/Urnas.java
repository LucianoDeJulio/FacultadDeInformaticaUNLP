
package Parcial_Urnas;

public class Urnas {
    private int opinionesPositivas;
    private int opinionesNegativas;

    public Urnas(int opinionesPositivas, int opinionesNegativas) {
        this.opinionesPositivas = opinionesPositivas;
        this.opinionesNegativas = opinionesNegativas;
    }

    public Urnas() {
        this.opinionesPositivas = 0;
        this.opinionesNegativas = 0;
    }

    public int getOpinionesPositivas() {
        return opinionesPositivas;
    }


    public int getOpinionesNegativas() {
        return opinionesNegativas;
    }

    
    public void regitrarOpinionPositiva(int unVoto){
           this.opinionesPositivas++;
    }
    
    public void registrarOpinionNegativa(int unVoto){
            this.opinionesNegativas++;
    }
    

    public String toString(){
        return ("Opiniones positivas:  " + this.getOpinionesPositivas() + " | " + " Opiniones negativas: " + this.getOpinionesNegativas());
    }
}
