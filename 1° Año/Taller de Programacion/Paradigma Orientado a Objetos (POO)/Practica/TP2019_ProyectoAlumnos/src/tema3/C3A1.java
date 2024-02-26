/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import java.util.Scanner;
import tema2.Partido;

public class C3A1 {
    
    public static Triangulo leerTriangulo(Triangulo t){
        int a, b , c;
        String Linea, Relleno;
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el lado a");
        a = in.nextInt();
        t.setA(a);
        System.out.println("Ingrese el lado b");
        b = in.nextInt();
        t.setB(b);
        System.out.println("Ingrese el lado c");
        c = in.nextInt();
        t.setC(c);
        System.out.println("Ingrese el color de la linea");
        Linea = in.next();
        in.nextLine();
        t.setLinea(Linea);
        System.out.println("Ingrese el color del relleno");
        Relleno = in.next();
        t.setRelleno(Relleno);
        return t;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Triangulo t= new Triangulo ();
        leerTriangulo(t);
        System.out.println("El area del triangulo es: " + t.calculoArea());
        System.out.println("El perimetro del triangulo es: " + t.calculoPerimetro());
        System.out.println("La linea del triangulo es : " + t.getLinea());
        System.out.println("El relleno del triangulo es: " + t.getRelleno());  
    }
    
}
