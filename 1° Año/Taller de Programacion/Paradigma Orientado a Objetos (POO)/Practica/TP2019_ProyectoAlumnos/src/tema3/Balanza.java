
package tema3;

import java.util.logging.Logger;

public class Balanza {
    
    private double monto;
    private int cantP;
    
    public Balanza(double unMonto, int unCantP){
        monto = unMonto;
        cantP = unCantP;
    }
    
    public Balanza(){
        
    }

    public double getMontoTotal() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getCantP() {
        return cantP;
    }

    public void setCantP(int cantP) {
        this.cantP = cantP;
    }
    
    public void iniciarCompra(){
        monto = 0;
        cantP = 0;   
    }
    
    public double valorProducto(double pesoP, double kg){
        pesoP = (pesoP * kg);
        monto = monto + pesoP;
        cantP++;
        return pesoP;
    }
    
    public String toString(){
        String aux; 
        aux = "La compra de  " + cantP + " productos es  $" + monto;
        return aux;
    }   
    
}
