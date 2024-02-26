
package Parcial3;

public class Solista {
    private String nombreS;
    private String instrumento;
    private int cantTemas;

    public Solista(String nombreS, String instrumento, int cantTemas) {
        this.nombreS = nombreS;
        this.instrumento = instrumento;
        this.cantTemas = cantTemas;
    }

    public Solista() {
    }

    public String getNombreS() {
        return nombreS;
    }

    public void setNombreS(String nombreS) {
        this.nombreS = nombreS;
    }

    public String getInstrumento() {
        return instrumento;
    }

    public void setInstrumento(String instrumento) {
        this.instrumento = instrumento;
    }

    public int getCantTemas() {
        return cantTemas;
    }

    public void setCantTemas(int cantTemas) {
        this.cantTemas = cantTemas;
    }
    
}
