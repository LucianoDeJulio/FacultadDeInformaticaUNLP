package tema3;

import java.util.logging.Logger;

public class Balanza2 {
    
    private double monto;
    private int cantP;
    private Producto p;
    
    public Balanza2(double unMonto, int unCantP){
        monto = unMonto;
        cantP = unCantP;
    }
    
    public Balanza2(){
        
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
        p = new Producto(0, "");
    }
    
    public void ingresarProducto(double pesoP, double kg, String unP){
        pesoP = (pesoP * kg);
        monto = monto + pesoP;
        cantP++;
        p.setPesoEnKg(pesoP);
        p.setDescripcion(unP);
    }
    
    public String toString(){
        String aux; 
        aux = "Compra " + p.getDescripcion() + ". El total de los " + cantP + " productos es: $" + monto;
        return aux;
    }   
    
}