
package Parcial_Subsidios;

public class SubsidioBienes extends Subsidio {
    private int cantidad;
    private int dimL;
    private  Bien [] bienes;

    public SubsidioBienes(int cantidad, String nombre, String apellido, String fecha) {
        super(nombre, apellido, fecha);
        this.cantidad = cantidad; // En teoria es la DIMF
        this.dimL = 0;
        this.bienes = new Bien [this.cantidad];
    }

    public int getCantidad() {
        return cantidad;
    }
 
    public int getDimL(){
        return dimL;
    }
    
    
    public void agregarBien(Bien unB){
        if (this.dimL < this.cantidad) {
            bienes[this.dimL] = unB; // 3 autos
            this.dimL++;   
        }
    }

    public double montoTotalSolicitado(){
        int i;
        double total= 0;
        for(i=0; i < this.cantidad; i++){
            total = total + (this.bienes[i].getCostoUnidad()* this.bienes[i].getCantidadBien());
        }
        return total;
    }
    
    public String itemMax(){
        double max=0;
        String itemMax = " ";
        int i;
        for(i=0; i < this.cantidad; i++){
            if (this.bienes[i].getCostoUnidad() > max) {
                  max = this.bienes[i].getCostoUnidad();
                  itemMax = this.bienes[i].getDescripcion();
            }
        }
        return (" . El item mas caro es: " + itemMax + " . Con un costo por unidad de: " + max);
    }
    
    public String toString(){
        return (super.toString() + ". El monto total del subsidio es : " + itemMax());
    }
    
}
