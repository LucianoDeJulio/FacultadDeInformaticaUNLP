
package Parcial_Teatro;

public class Obra {
    private String nombre;
    private String nomDirector;
    private Actor [] actores;
    private int dimFA;
    private int dimLA;

    public Obra(String nombre, String nomDirector, int dimFA) {
        this.nombre = nombre;
        this.nomDirector = nomDirector;
        this.dimFA = dimFA;
        this.dimLA = 0;
        this.actores = new Actor [this.dimFA];
    }

    public Obra() {
    }

    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNomDirector() {
        return nomDirector;
    }

    public void setNomDirector(String nomDirector) {
        this.nomDirector = nomDirector;
    }

    public int getDimFA() {
        return dimFA;
    }

    public int getDimLA() {
        return dimLA;
    }
    
    public void agregarActores(Actor unA){
        if(this.dimLA < this.dimFA){
            this.actores[this.dimLA]= unA;
            this.dimLA++;
        }
    }
    
    public boolean buscarActor(String unNA, String unApe){
        int i=0;
        while(i < this.dimLA && !this.actores[i].getNomA().equals(unNA) && !this.actores[i].getApeA().equals(unApe)){
            i++;
        }
        if(i < this.dimLA){
            return true;
        }else
            return false;
    }
    
    public Actor buscarActorMayor(){
        int i, max=0;
        Actor actMax= null;
        for(i=0; i < this.dimLA;i++){
           if(this.actores[i].getEdad() > max){
               max = this.actores[i].getEdad();
               actMax = this.actores[i];
           } 
        }
        return actMax;
    }
    
}
