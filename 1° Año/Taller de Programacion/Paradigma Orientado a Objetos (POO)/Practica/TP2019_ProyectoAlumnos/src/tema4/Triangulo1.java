
package tema4;

public class Triangulo1 {
    
   private double a,b,c;
   private String Linea;
   private String Relleno;
   
   public Triangulo1 (double LadoA, double LadoB, double LadoC, String unaLinea, String unRelleno){
        a = LadoA;
        b = LadoB;
        c = LadoC;
        Linea = unaLinea;
        Relleno = unRelleno;
     }
   
    public Triangulo1 (){
        
    }

    public String getLinea() {
        return Linea;
    }

    public void setLinea(String Linea) {
        this.Linea = Linea;
    }

   

    public String getRelleno() {
        return Relleno;
    }

    public void setRelleno(String Relleno) {
        this.Relleno = Relleno;
    }
   
   
    public double getA() {
        return a;
    }

    public void setA(double a) {
        this.a = a;
    }

    public double getB() {
        return b;
    }

    public void setB(double b) {
        this.b = b;
    }

    public double getC() {
        return c;
    }

    public void setC(double c) {
        this.c = c;
    }
    
    public double calculoArea () {
        double Area;
        double s = (a + b + c)/2;
        Area= Math.sqrt((s*(s-a)*(s-b)*(s-c)));
        return Area;
    } 
    
    public double calculoPerimetro (){
        double Perimetro;
        Perimetro = (a + b + c);
        return Perimetro;
    }
}