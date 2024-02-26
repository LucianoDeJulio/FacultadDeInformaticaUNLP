
package tema5;


public class Circulo extends Figura {
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularArea(){
        double area = Math.PI*(radio*radio);
        return area;
    }
    
    public double calcularPerimetro(){
        double perimetro = 2*Math.PI*radio;
        return perimetro;
    }
    
    public String toString(){
       String aux = super.toString() + " su radio es:" + getRadio() + " y el perimetro es: " + calcularPerimetro();
       return aux;
    }
    
}
