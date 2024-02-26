
package Parcial_JuliTaller;

public class SubsidioBien extends Subsidio {
    private int cantidad;
    private Bien bienes [];
    private int dimL;

    public SubsidioBien(int cantidad,String unNombre, String unApellido, String unaFecha) {
        super(unNombre, unApellido, unaFecha);
        this.cantidad = cantidad;
        this.dimL = 0;
        this.bienes = new Bien [this.cantidad];
        
    }

    public SubsidioBien() {
    }

    public int getCantidad() {
        return cantidad;
    }

    public int getDimL() {
        return dimL;
    }

    public void agregarBien(Bien unBien){
        if(this.dimL < this.cantidad){
            bienes[this.dimL] = unBien;
            this.dimL++;
        }
    }
    
    public double montoTotalSolicitado(){
        int i;
        double total=0;
        double sumatoria= 0;
        for(i=0; i < this.cantidad; i++){
            sumatoria = (this.bienes[i].getCostoUnidad()* this.bienes[i].getCantidadBien());
            total = total +  sumatoria;
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
        return (super.toString() + ". El monto total del subsidio es : " + montoTotalSolicitado() + itemMax());
    }
    
    
}
