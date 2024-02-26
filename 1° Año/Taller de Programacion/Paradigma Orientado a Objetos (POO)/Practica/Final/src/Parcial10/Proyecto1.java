
package Parcial10;

public class Proyecto1 {
    
    private String nombre;
    private int codigo;
    private Investigador1 director;
    private final int dimF=49;
    private Investigador1 []investigadores= new Investigador1[dimF];

    private int dimL=0;

    public Proyecto1(String nombre, int codigo) {
        this.nombre = nombre;
        this.codigo = codigo;
        for(int i=0;i<investigadores.length;i++){
            investigadores[dimL++]=new Investigador1();
        }
       
    }

    
    
    public Proyecto1() {
    }

    public String getNombre() {
        return nombre;
    }

    public int getCodigo() {
        return codigo;
    }
    

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }
    
    public void agregarDirector(Investigador1 unDirector) {
        this.director = unDirector;
    }
    public Investigador1 getDirector() {
        return director;
    }
    
    
    public void agregarInvestigador(Investigador1 unInvestigador){
        if(dimL < dimF){
            investigadores[dimL++] = unInvestigador;
        }  
    }      
   
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for(int i=0; i < this.dimL; i++){
            total= total + this.investigadores[i].calcularTotal();
        }
        total += this.director.calcularTotal();
        return total;
    }
    
    
    public int cantidadDeSubsidios(String unNombre,String unApellido){
        int i=0;
        int sub = 0;
        boolean ok= true;
        while((ok) && (i < this.dimF)){
            if(!(this.investigadores[i].getNombre().equals(unNombre)) & ((this.investigadores[i].getApellido().equals(unApellido)))){
                sub = this.investigadores[i].getDimL();
                ok = false;
            }
            i++;
        }        
        return sub;
    }
    

    public void otorgarTodos(String nombre,String apellido) {
	int pos=0;
	boolean encontre=false;
	while((pos<dimL)&&(!encontre)) {
            if((investigadores[pos].getNombre().equals(nombre))&&(investigadores[pos].getApellido().equals(apellido))) {
		encontre=true;
		investigadores[pos].otorgar();
            }    
            pos++;
	}
    }

    
    public String toString (){
        String s= "El proyecto: " + this.getNombre() + 
                " con codigo: " + this.getCodigo() + 
                " tiene como director a: " + 
                this.director.getNombre() + " " + 
                this.director.getApellido() + " dispone de un dinero total : " + this.dineroTotalOtorgado();
        for(int i= 0; i < this.dimL; i++){
            s = s + this.investigadores[i].toString();
        }
        
        return s;
    }
    
}
