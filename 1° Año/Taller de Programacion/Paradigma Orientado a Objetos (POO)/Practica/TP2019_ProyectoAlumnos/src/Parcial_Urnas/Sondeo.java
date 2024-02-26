
package Parcial_Urnas;

public class Sondeo {
    private String pregunta;
    private int tipoCliente;
    private int tipoSucursal;
    private Urnas [][] urna;

    public Sondeo(String pregunta) {
        this.pregunta = pregunta;
        this.tipoCliente = 3;
        this.tipoSucursal = 4;
        this.urna = new Urnas [this.tipoCliente][this.tipoSucursal];
    }

    public Sondeo() {
    }
    
    public void iniciarUrnas(){
        int f,c;
        for(f=0; f< this.tipoCliente; f++){
            for(c=0; c< this.tipoSucursal; c++){
                this.urna[f][c]= new Urnas();
            }
        }
    }

    public String getPregunta() {
        return pregunta;
    }

    public int getTipoCliente() {
        return tipoCliente;
    }

    public int getTipoSucursal() {
        return tipoSucursal;
    }
    
    public boolean validarCliente(int unCliente){
        if((unCliente-1)>= 0 && (unCliente-1)<3){
            return true;
        }else
            return false;
    }
    
    public boolean validarSucursal(int unaSucursal){
        if((unaSucursal-1)>= 0 && (unaSucursal-1)<4){
            return true;
        }else
            return false;   
    }
    
    public void agregarVotoUrna(int unVoto, int unCliente, int unaSucursal){
        if(unVoto == 1){
            this.urna[unCliente-1][unaSucursal-1].regitrarOpinionPositiva(unVoto);
        }else
            if(unVoto == 2){
                this.urna[unCliente-1][unaSucursal-1].registrarOpinionNegativa(unVoto);
            }
    }
    
    
    public Urnas devolverUrna(int unCliente, int unaSucursal){
        return this.urna[unCliente-1][unaSucursal-1];
    }
    
    public void mostrarResultadosUrnas(){
        int f,c;
        for(f=0; f < this.tipoCliente; f++){
            System.out.println("Cliente " + (f+1));
            for(c=0; c < this.tipoSucursal; c++){
                System.out.println("Votos : " + this.urna[f][c].toString());
            }
        }
    }
    
    public int totalizarVotoNeg(int unCliente){
        int c, total=0;
        for(c=0; c < this.tipoSucursal; c++){
            total = this.urna[unCliente][c].getOpinionesNegativas();  
        }
        return total;
    }
    
    public String clienteMasExigente(){
        int f, max = 0, clienteMaxNeg = -1;
        for(f=0; f < this.tipoCliente; f++){
                this.totalizarVotoNeg(f);
                if(this.totalizarVotoNeg(f)> max){
                    max = this.totalizarVotoNeg(f);
                    clienteMaxNeg = f;
                }
            }
        return ("el cliente mas exigente es: " +  (clienteMaxNeg+1));
    }
    
    public int totalizarSucursal(int unaSucursal){
        int f, total=0;
        for(f=0; f < this.tipoCliente; f++){
            total= this.urna[f][unaSucursal].getOpinionesPositivas();
        }
        return total;
    }
    
    public String sucursalGanadora(){
        int c, max = 0, sucursalGanadora= -1;
        for(c=0; c < this.tipoSucursal; c++){
            this.totalizarSucursal(c);
            if(this.totalizarSucursal(c)> max){
                    max = this.totalizarSucursal(c);
                    sucursalGanadora = c;
                }
            }
        return ("La sucursal con mas votos positivos son: " + (sucursalGanadora+1));
    }
    
}
