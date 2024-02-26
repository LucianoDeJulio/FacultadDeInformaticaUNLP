
package tema5;

import java.util.Scanner;

public class C5A1 {
    
    public static Triangulo leerTriangulo(){
        Scanner in= new Scanner (System.in);
        System.out.println("Ingrese el lado a");
        double a = in.nextDouble();
        System.out.println("Ingrese el lado b");
        double b = in.nextDouble();
        System.out.println("Ingrese el lado c");
        double c = in.nextDouble();
        System.out.println("Ingrese el color de relleno");
        String relleno = in.next();
        System.out.println("Ingrese el color de la linea");
        String linea = in.next();
        Triangulo t = new Triangulo (a, b, c, relleno, linea);
        return t;
    }  
    
    public static Cuadrado leerCuadrado (){
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el lado");
        double lado = in.nextDouble ();
        System.out.println ("Ingrese el color de relleno");
        String relleno = in.next();
        System.out.println("Ingrese el color de linea");
        String linea = in.next();
        Cuadrado c = new Cuadrado (lado, relleno, linea);
        return c;
    }
    
    public static Circulo leerCirculo(){
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el Radio");
        double radio = in.nextDouble();
        System.out.println ("Ingrese el color de relleno");
        String relleno = in.next();
        System.out.println("Ingrese el color de linea");
        String linea = in.next();
        Circulo c1 = new Circulo (radio, relleno, linea);
        return c1;
    }
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        Triangulo t = leerTriangulo();
        Cuadrado c = leerCuadrado ();
        Circulo c1 = leerCirculo();
        System.out.println(t.toString());
        System.out.println(c.toString());
        System.out.println(c1.toString());
    }
    
}
