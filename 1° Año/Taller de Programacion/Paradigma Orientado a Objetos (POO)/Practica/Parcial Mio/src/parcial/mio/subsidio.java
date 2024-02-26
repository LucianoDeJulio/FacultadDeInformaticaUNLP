
package parcial.mio;

public class subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;

    public subsidio(double monto, String motivo, boolean otorgado) {
        this.monto = monto;
        this.motivo = motivo;
        this.otorgado = otorgado;
    }

    public subsidio(boolean otorgado) {
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

    public boolean Otorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }

    
}
