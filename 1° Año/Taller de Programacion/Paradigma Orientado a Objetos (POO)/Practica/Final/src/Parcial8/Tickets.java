package Parcial8;

public class Tickets {
      private int numTicket;
    private String fecha;
    private Producto [] prods;
    private int dimL;
    private int dimF;

    public Tickets(int numTicket, String fecha, int dimF) {
        this.numTicket = numTicket;
        this.fecha = fecha;
        this.prods = new Producto [dimF];
        this.dimL = 0;
        this.dimF = dimF;
    }

    public Tickets() {
    }

    public int getNumTicket() {
        return numTicket;
    }

    public void setNumTicket(int numTicket) {
        this.numTicket = numTicket;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int verCantDeProds() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }

    public int getDimL() {
        return dimL;
    }

   public void cargarProducto (Producto unP) {
       if(this.dimL < this.dimF ){
           this.prods[dimL] = unP;
           dimL++;
       }
   }
   
   public boolean estaCompleto (){
       if (this.dimL == this.dimF){
           return true;
       }else
           return false;
   }
   
   public double calcularPrecioFinal (){
       int i;
       double precioFinal = 0;
       for(i=0;i<dimL; i++){
           precioFinal = precioFinal + this.prods[i].getPrecio();   
       }
       return precioFinal;
   }
   
   public String mostrarResumen (){
       int i;
       String resumen = " ";
       for(i=0; i < this.dimL ; i++){
           resumen = (resumen + " -Codigo  " + this.prods[i].getCodigo() +  "descripcion: " + this.prods[i].getDescripcion() + " precio " + this.prods[i].getPrecio());
       }
       String resumenFinal = resumen + " El precio final a abonar es: " + calcularPrecioFinal();
       
       return resumenFinal;
   }
   
   public boolean abonableConDebito(){
       if(calcularPrecioFinal () > 200){
           return true;
       }else
           return false;
   }
}
