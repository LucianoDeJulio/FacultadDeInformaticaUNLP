
package Parcial10;

public class Investigador1 {

    private String nombre;
    private String apellido;
    private int categoria;
    private String especialidad;
    private int dimL=0;
    private final int dimF = 5;
    private Subsidio1 subsidios []= new Subsidio1[dimF];

    public Investigador1(String nombre, String apellido, int categoria, String especialidad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.categoria = categoria;
        this.especialidad = especialidad;
        for(int i= 0; i < this.subsidios.length; i++){
            this.subsidios[i] = new Subsidio1();
        }
        
    }

    public Investigador1() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getDimL() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }
    
    public void agregarSubsidio(Subsidio1 unSubsidio){
        if(this.dimL < this.dimF){
            this.subsidios[this.dimL] = unSubsidio;
            this.dimL++;
        }  
    }
    public double calcularTotal (){
        double total=0;
        for(int i= 0; i < this.dimF; i++){
            if(this.subsidios[i].getOtorgado()){
                total= total + this.subsidios[i].getMonto();
            }
        }
        return total;
    }
    
    public void otorgar(){
        for(int i=0; i < this.dimL; i++){
            if(!this.subsidios[i].getOtorgado()){
                this.subsidios[i].setOtorgado(true);
            }
        }
    }
    
    public String toString(){
             
        return "Nombre: " + this.getNombre() + " apellido: " + this.getApellido() +
                " especialidad: " + this.getEspecialidad() + " categoria: " +
                this.getCategoria() + "dinero total otorgado: " + this.calcularTotal();
          
    }
    
    
   
    
}
