
package parcial.mio;

public class Proyecto {
    private String nombre;
    private int codigo;
    private Investigador director;
    private Investigador [] investigadores;
    private int dimF;
    private int dimL;

    public Proyecto(String nombre, int codigo, int dimF) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.investigadores = new Investigador[dimF];
        this.dimF = dimF;
        this.dimL = 0;
    }

    public Proyecto() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public Investigador getDirector() {
        return director;
    }

    public void setDirector(Investigador director) {
        this.director = director;
    }

    public int getDimL() {
        return dimL;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public int getDimF() {
        return dimF;
    }
    
    public void agregarDirector(Investigador unDirector){
        this.setDirector(unDirector);
    }
    
    public void agregarSubsidio(int pos, subsidio s){
        this.investigadores[pos-1].agregarSubsidio(s);
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if(this.dimL < this.dimF){
            this.investigadores[this.dimL]= unInvestigador;
            this.dimL++;
        }
    }
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for (int i = 0; i < this.dimL; i++) {
           total = total + this.investigadores[i].totalOtorgado();
        }
        return total;
    }
    
    public int cantidadDeSubsidios(){
        int totalSub = 0;
        for (int i = 0; i < this.dimL; i++) {
            totalSub = totalSub + this.investigadores[i].getDimL();
            
        }
        
       return totalSub;
    }
    
    public void otorgarTodos(String unNombre, String unApellido){
        int i = 0;
        while((i <= this.dimL) & !(this.investigadores[i].getNombre().equals(unNombre)) & !(this.investigadores[i].getApellido().equals(unApellido))){
            i++;
        }
        if(i <= this.dimL){
            this.investigadores[i].otorgarTodos();
        }
    }
    
    public String ToString(){
        String p = "El proyecto " + " " + this.getNombre() + " con codigo " + " " + this.getCodigo() + " y director " + this.getDirector().getNombre() + " " +  this.getDirector().getApellido()   + " posee un dinero total de: " + " " + this.dineroTotalOtorgado() + " y sus investigadores son: ";
        for (int i = 0; i < this.dimL; i++) {
            p = p + this.investigadores[i].ToString();  
        }
        return p;
    }
    
    
}
