
package Parcial_Teatro;

public class Teatro {
    private String nombre;
    private String direccion;
    private String nomDue;
    private Obra [] obras;
    private int dimFO;
    private int dimLO;

    public Teatro(String nombre, String direccion, String nomDue, int dimFO) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.nomDue = nomDue;
        this.dimFO = dimFO;
        this.dimLO = 0;
        this.obras = new Obra [this.dimFO];
        
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

    public String getNomDue() {
        return nomDue;
    }

    public void setNomDue(String nomDue) {
        this.nomDue = nomDue;
    }

    public int getDimFO() {
        return dimFO;
    }

    public int getDimLO() {
        return dimLO;
    }
    
    public void agregarObras(Obra unaO){
        if(this.dimLO < this.dimFO){
            this.obras[this.dimLO]= unaO;
            this.dimLO++;
        }
    }
    
    public void agregarActor (Actor unA){
        if(this.dimLO < this.dimFO){
            this.obras[this.dimLO].agregarActores(unA);
        }
    }
    
    public String buscarDirector(String nomO){
        int i=0;
        while(i < this.dimLO && !this.obras[i].getNombre().equals(nomO)){
            i++;
        }
        if(i < this.dimLO){
            return this.obras[i].getNomDirector();
        }else
            return "No se encontro la obra";
    }
    
    public String menorCantActores(){
        int i, min= 101;
        String obraMin= " ";
        for(i=0; i < this.dimLO; i++){
            if(this.obras[i].getDimLA()< min){
                min = this.obras[i].getDimLA();
                obraMin= this.obras[i].getNombre();
            }
        }
        return obraMin;
    }
    
    public String buscarObraConActor (String unNA, String unApe){
        int i=0;
        while(i < this.dimLO && this.obras[i].buscarActor(unNA, unApe)== false){
            i++;
        }
        if(i < this.dimLO){
            return this.obras[i].getNombre();
        }else
            return "No se encontro el actor";
    }
    
    
    
    public String buscarActMayor(){
        int i, max = -1;
        Actor actorM= null;
        String actorMax = " ";
        for(i=0; i < this.dimLO; i++){
            actorM = this.obras[i].buscarActorMayor();
            if(actorM.getEdad() > max){
                max = actorM.getEdad();
                actorMax = actorM.getNomA() + " " + actorM.getApeA();
            }
            
        }
        return actorMax;
    }
 
}
