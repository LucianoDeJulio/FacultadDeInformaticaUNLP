
package Parcial10;

public class Subsidio1 {
    
    private double monto;
    private String motivo;
    private boolean otorgado;

    public Subsidio1(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
    }

    public Subsidio1() {
        this.otorgado = false;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean getOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
    
    
}
