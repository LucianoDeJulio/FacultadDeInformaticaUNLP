/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

public class Triangulo extends Figura {
    
   private double a,b,c;
   
   
   public Triangulo (double LadoA, double LadoB, double LadoC, String unaLinea, String unRelleno){
        super(unRelleno,unaLinea);
        a = LadoA;
        b = LadoB;
        c = LadoC;
     }

    public Triangulo(String unRelleno, String unaLinea) {
        super(unRelleno, unaLinea);
    }



    public double getA() {
        return this.a;
    }

    public void setA(double a) {
        this.a = a;
    }

    public double getB() {
        return this.b;
    }

    public void setB(double b) {
        this.b = b;
    }

    public double getC() {
        return this.c;
    }

    public void setC(double c) {
        this.c = c;
    }
    
    public double calcularArea () {
        double Area;
        double s = (a + b + c)/2;
        Area= Math.sqrt((s*(s-a)*(s-b)*(s-c)));
        return Area;
    } 
    
    public double calcularPerimetro (){
        double Perimetro;
        Perimetro = (a + b + c);
        return Perimetro;
    }
    
    public String toString(){
        return (super.toString() + " " + " y el perimetro es: " + calcularPerimetro());
    }
}
