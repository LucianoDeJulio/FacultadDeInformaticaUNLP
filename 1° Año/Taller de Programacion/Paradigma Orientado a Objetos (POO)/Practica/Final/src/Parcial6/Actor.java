
package Parcial6;

public class Actor {
    private String nomA;
   private String apeA;
   private String genero;
   private int edad;

    public Actor(String nomA, String apeA, String genero, int edad) {
        this.nomA = nomA;
        this.apeA = apeA;
        this.genero = genero;
        this.edad = edad;
    }

    public Actor() {
    }

    public String getNomA() {
        return nomA;
    }

    public void setNomA(String nomA) {
        this.nomA = nomA;
    }
    
    public String getApeA(){
        return this.apeA;
    }
    
    public void setApeA(String apeA){
        this.apeA = apeA;
    } 
    

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
   
}
