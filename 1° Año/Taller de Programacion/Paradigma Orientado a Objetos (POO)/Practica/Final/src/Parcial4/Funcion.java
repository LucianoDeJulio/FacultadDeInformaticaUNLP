
package Parcial4;

public class Funcion {
    private String titulo;
    private String fecha;
    private String hora;
    private int dimLF;
    private int dimFF;
    private int dimFB;
    private int [] dimLB;
    private Espectador [][] sala;
   

    public Funcion(String titulo, String fecha, String hora, int dimFF, int dimFB) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.dimLF = 0;
        this.dimFF = dimFF;
        this.dimFB = dimFB;
        this.sala = new Espectador [dimFF][dimFB];
        this.dimLB = new int [dimFF];
    }
    
   
    public Funcion() {
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }
    
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    public int getDimLF() {
        return this.dimLF;
    }

    public int getDimFF() {
        return this.dimFF;
    }

    public int getDimFB() {
        return this.dimFB;
    }

    public int getDimLBFila(int unaFila){
        return this.dimLB[unaFila];
    }
    
   

    public String getHora() {
        return this.hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }
    
    public void inicializarDimLB (){
        int i;
        for(i=0;i<this.dimFF;i++){
            this.dimLB[i] = 0;
        }
    }
    
    public boolean validarFila(int unaF){
        if((unaF-1) >= 0 && (unaF-1)<this.dimFF){
            return true;
        }else
            return false;
    }
    
    public boolean hayButacaLibreEnFila (int unaF){
        if(this.dimLB[unaF-1]< this.dimFB){
            return true;
        }else
            return false;
    }
    
    public int agregarEspectador(int unaF, Espectador e){
        int butaca = this.dimLB [unaF-1];
        this.sala[unaF-1][butaca]= e;
        this.dimLB[unaF-1]++;
        this.dimLF++;
        return (butaca+1);
    }
    
    public int calcularButacasLibres (){
        int f,b,butacasVacias;
        butacasVacias = 0;
        for (f=0; f<this.dimFF ;f++){
            for(b=0; b< this.dimFB ; b++){
                if(this.sala[f][b]== null){
                    butacasVacias++;
                }
            }
        }
        return butacasVacias;
    }
    
    public double calcularEdadPromEspectadores(){
        int f,b, cantPersonas=0;
        double totalEdad = 0;
        for (f=0; f<this.dimLF ;f++){
            for(b=0; b < this.dimLB[f] ; b++){
                if(this.sala[f][b]!= null){
                    totalEdad = totalEdad + this.sala [f][b].getEdad();
                    cantPersonas++;
                }
            }
        }
        return (double)(totalEdad/cantPersonas);
    }
    
    public boolean estaRegistradoEspectador(int unDNI){
        int f=0, b=0;
        boolean ok = false;
        while (f < this.dimLF && this.sala[f][b]!= null && this.sala[f][b].getDni()!= unDNI){
            while(b<this.dimLB[f] && this.sala[f][b]!=null && this.sala[f][b].getDni()!=unDNI){
                b++;
            }
            if(b == this.dimLB[f]){
                b=0;
                f++;
            }else ok = true;
        }
        return ok;
    }
    
}
