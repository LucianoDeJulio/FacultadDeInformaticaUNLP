
package Parcial_JuliTaller;

public class SubsidioDeEstadia  extends Subsidio {
    private String lugarDestino;
    private double costoPasaje;
    private int cantidadDiasViaje;
    private double montoHotelPorDia;

    public SubsidioDeEstadia(String lugarDestino, int cantidadDiasViaje, String unNombre, String unApellido, String unaFecha) {
        super(unNombre, unApellido, unaFecha);
        this.lugarDestino = lugarDestino;
        this.cantidadDiasViaje = cantidadDiasViaje;
    }


    public SubsidioDeEstadia() {
    }

    public String getLugarDestino() {
        return lugarDestino;
    }

    public void setLugarDestino(String lugarDestino) {
        this.lugarDestino = lugarDestino;
    }

    public double getCostoPasaje() {
        return costoPasaje;
    }

    public void setCostoPasaje(double costoPasaje) {
        this.costoPasaje = costoPasaje;
    }

    public int getCantidadDiasViaje() {
        return cantidadDiasViaje;
    }

    public void setCantidadDiasViaje(int cantidadDiasViaje) {
        this.cantidadDiasViaje = cantidadDiasViaje;
    }

    public double getMontoHotelPorDia() {
        return montoHotelPorDia;
    }

    public void setMontoHotelPorDia(double montoHotelPorDia) {
        this.montoHotelPorDia = montoHotelPorDia;
    }
    
    public double montoTotalSolicitado(){
        double total = 0;
        total = total +(this.costoPasaje + (this.montoHotelPorDia * this.cantidadDiasViaje));
        return total;
    }
    
    public double itemMaxEstadia(){
        if (this.costoPasaje > this.montoHotelPorDia){
            return this.costoPasaje;
        }else
            return this.montoHotelPorDia;
    }
    
    public String toString (){
        return (super.toString() + ". El total del subsidio es: " + montoTotalSolicitado() + ". El costo mas caro del subsidio es : " + itemMaxEstadia());
    }
    
}
