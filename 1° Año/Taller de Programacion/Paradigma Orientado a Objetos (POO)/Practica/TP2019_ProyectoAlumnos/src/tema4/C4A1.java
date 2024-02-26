/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import java.util.Scanner;
public class C4A1 {

        public static Triangulo1 leerTriangulo(){
        int a, b , c;
        String Linea, Relleno;
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el lado a");
        a = in.nextInt();
        System.out.println("Ingrese el lado b");
        b = in.nextInt();
        System.out.println("Ingrese el lado c");
        c = in.nextInt();
        System.out.println("Ingrese el color de la linea");
        Linea = in.next();
        in.nextLine();        System.out.println("Ingrese el color del relleno");
        Relleno = in.next();
        Triangulo1 t = new Triangulo1(a, b, c, Linea, Relleno);
        return t;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Triangulo1 t= new Triangulo1 ();
        System.out.println("El area del triangulo es: " + t.calculoArea());
        System.out.println("El perimetro del triangulo es: " + t.calculoPerimetro());
        System.out.println("La linea del triangulo es : " + t.getLinea());
        System.out.println("El relleno del triangulo es: " + t.getRelleno());
        t = leerTriangulo();
        System.out.println("El area del triangulo es: " + t.calculoArea());
        System.out.println("El perimetro del triangulo es: " + t.calculoPerimetro());
        System.out.println("La linea del triangulo es : " + t.getLinea());
        System.out.println("El relleno del triangulo es: " + t.getRelleno());
        
        
    }
    }

