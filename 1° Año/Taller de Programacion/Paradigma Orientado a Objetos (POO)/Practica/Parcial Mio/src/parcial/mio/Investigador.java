
package parcial.mio;

public class Investigador {
    private String nombre;
    private String apellido;
    private int categoria;
    private String especialidad;
    private subsidio [] subsidios;
    private int dimF;
    private int dimL;

    public Investigador(String nombre, String apellido, int categoria, String especialidad, int dimF) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios = new subsidio[this.dimF];
        this.dimF = dimF;
        this.dimL = 0;
    }

    public Investigador() {
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

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public subsidio[] getSubsidios() {
        return subsidios;
    }

    public int getDimF() {
        return dimF;
    }

    public void agregarSubsidio(subsidio unSubsidio){
        if (this.dimL < this.dimF){
            this.subsidios [this.dimL] = unSubsidio;
            this.dimL++;            
        }
    }
    
    public double totalOtorgado(){
        double total = 0;
        for (int i = 0; i < this.dimL; i++) {
            if(this.subsidios[i].Otorgado()== true){
                total = total + this.subsidios[i].getMonto();   
            }
        }
        return total;
    }
    
    public void otorgarTodos(){
        for (int i = 0; i < this.dimL; i++) {
            if(subsidios[i].Otorgado()== false){
                subsidios[i].setOtorgado(true);
            }        
        }
    }
    
    public String ToString(){
        String i = "El investigador " + this.getNombre() + "  " + this.getApellido() + " " + " con categoria " + this.getCategoria() + " " + " posee un dinero otorgado de : " + " " + this.totalOtorgado();
        return i;
    }
}