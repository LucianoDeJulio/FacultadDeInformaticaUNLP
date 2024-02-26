package tema3;

import java.util.Scanner;


public class C3A5 {

    public static void main(String[] args) {
        Balanza2 b = new Balanza2();
        Scanner in = new Scanner(System.in);
        double peso, pesoKg;
        String nombre;
        System.out.println("Ingrese peso en kg del producto.");
        peso = in.nextDouble();
        if(peso!=0){
            b.iniciarCompra();
            System.out.println("Ingrese monto por kg del producto.");
            pesoKg = in.nextDouble();
            System.out.println("Ingrese nombre del producto.");
            nombre = in.next();
            b.ingresarProducto(peso, pesoKg, nombre);
        }
        while(peso!=0){
            System.out.println("Ingrese peso en kg del producto.");
            peso = in.nextDouble();
            if(peso!=0){
                System.out.println("Ingrese monto por kg del producto.");
                pesoKg = in.nextDouble();  
                System.out.println("Ingrese nombre del producto.");
                nombre = in.next();
                b.ingresarProducto(peso, pesoKg, nombre);
            }
        }
        System.out.println(b.toString());
        
        
    }
    
}
