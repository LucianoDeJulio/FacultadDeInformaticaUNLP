package tema3;
import java.util.Scanner;
public class C3A2 {

    public static void main(String[] args) {
        Balanza b = new Balanza();
        Scanner in = new Scanner(System.in);
        double peso, pesoKg;
        System.out.println("Ingrese peso en kg del producto.");
        peso = in.nextDouble();
        if(peso!=0){
            b.iniciarCompra();
            System.out.println("Ingrese monto por kg del producto.");
            pesoKg = in.nextDouble();  
            b.valorProducto(peso, pesoKg);
        }
        while(peso!=0){
            System.out.println("Ingrese peso en kg del producto.");
            peso = in.nextDouble();
            if(peso!=0){
                System.out.println("Ingrese monto por kg del producto.");
                pesoKg = in.nextDouble();  
                b.valorProducto(peso, pesoKg);
            }
        }
        System.out.println("El monto total de la compra de " + b.getCantP() + " productos es: " + b.getMontoTotal());  
    }
    
}
