
package Parcial_Tickets;

public class TicketDesc extends Tickets {
    private int porcentaje;

    public TicketDesc(int porcentaje, int numTicket, String fecha, int dimF) {
        super(numTicket, fecha, dimF);
        this.porcentaje = porcentaje;
    }

    public int getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(int porcentaje) {
        this.porcentaje = porcentaje;
    }
    
    public void cargarProducto(Producto unP){
        super.cargarProducto(unP);
    }
    
    public boolean estaCompleto(){
        return super.estaCompleto();
    }
    
    
    
    public double calcularAhorroFinal(){
        double ahorro = 0;
        ahorro = super.calcularPrecioFinal()* getPorcentaje() /100;
        return ahorro;
    }

    public double calcularPrecioFinalDes(){
        double precioFinalDesc = 0;
        precioFinalDesc = super.calcularPrecioFinal()- calcularAhorroFinal();
        return precioFinalDesc;
    }
    
   public String mostrarResumenDesc(){
       String resumenFinalDesc = " ";
       resumenFinalDesc = super.mostrarResumen() + "pesos. Con el descuento del : " + getPorcentaje () + "%" + "el monto a abonar es: " + calcularPrecioFinalDes() +  "pesos.Usted se ahorro:  " + calcularAhorroFinal() + "pesos.";
       return resumenFinalDesc;
           
    } 
   
   public boolean abonableConDebito(){
       if(calcularPrecioFinalDes() > 200){
           return true;
       }else
           return false;
   }
   
   
}
