
package tema4;

import java.util.Scanner;

public class C4A6 {
    
    public static Circulo1 leerCirculo1(){
        Scanner in = new Scanner(System.in);
        double radio;
        String linea, relleno;
        System.out.println("Ingrese radio del circulo.");
        radio = in.nextDouble();
        System.out.println("Ingrese color de linea del circulo.");
        linea = in.next();
        System.out.println("Ingrese color de relleno del circulo.");
        relleno = in.next();
        Circulo1 c = new Circulo1(radio, linea, relleno);
        return c;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Circulo1 c= new Circulo1 ();
        System.out.println("El area del curculo es: " + c.calcularArea());
        System.out.println("El perimetro del circuloo es: " + c.calcularPerimetro());
        System.out.println("La linea del circulo es : " + c.getLinea());
        System.out.println("El relleno del circulo es: " + c.getRelleno());
        c=  leerCirculo1();
        System.out.println("El area del circulo es: " + c.calcularArea());
        System.out.println("El perimetro del circulo es: " + c.calcularPerimetro() );
        System.out.println("La linea del circulo es : " + c.getLinea());
        System.out.println("El relleno del circulo es: " + c.getRelleno());
    }
    
}
