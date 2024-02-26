
package tema4;

public class Circulo1 {
    private double radio;
    private String linea;
    private String relleno;

    public Circulo1(double radio, String linea, String relleno) {
        this.radio = radio;
        this.linea = linea;
        this.relleno = relleno;
    }
    
    public Circulo1(){
        
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getLinea() {
        return linea;
    }

    public void setLinea(String linea) {
        this.linea = linea;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }
    
    public double calcularArea(){
        double area = Math.PI*(radio*radio);
        return area;
    }
    
    public double calcularPerimetro(){
        double perimetro = 2*Math.PI*radio;
        return perimetro;
    }
}
