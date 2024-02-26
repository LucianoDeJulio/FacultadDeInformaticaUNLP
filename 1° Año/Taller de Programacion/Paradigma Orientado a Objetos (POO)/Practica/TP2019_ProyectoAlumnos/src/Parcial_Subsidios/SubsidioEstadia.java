
package Parcial_Subsidios;

public class SubsidioEstadia extends Subsidio {
    private String lugarDestino;
    private int costoPasaje;
    private int diasViaje;
    private int hotelDia;

    public SubsidioEstadia(String lugarDestino, int diasViaje, String nombre, String apellido, String fecha) {
        super(nombre, apellido,fecha);
        this.lugarDestino = lugarDestino;
        this.diasViaje = diasViaje;
    }

    public SubsidioEstadia() {
    }

    public String getLugarDestino() {
        return lugarDestino;
    }

    public void setLugarDestino(String lugarDestino) {
        this.lugarDestino = lugarDestino;
    }

    public int getCostoPasaje() {
        return costoPasaje;
    }

    public void setCostoPasaje(int costoPasaje) {
        this.costoPasaje = costoPasaje;
    }

    public int getDiasViaje() {
        return diasViaje;
    }

    public void setDiasViaje(int diasViaje) {
        this.diasViaje = diasViaje;
    }

    public double getHotelDia() {
        return hotelDia;
    }

    public void setHotelDia(int hotelDia) {
        this.hotelDia = hotelDia;
    }
    
    public double montoTotalSolicitado(){
        double total = 0;
        total = total + (this.costoPasaje + (this.hotelDia*this.diasViaje));
        return total;
    }
    
    public double itemMaxEstadia(){
        if (this.costoPasaje > this.hotelDia){
            return this.costoPasaje;
        }else
            return this.hotelDia;
    }
    
    public String toString(){
        return (super.toString() + ". El costo mas caro del subsidio es : " + itemMaxEstadia());
    }
  
}
