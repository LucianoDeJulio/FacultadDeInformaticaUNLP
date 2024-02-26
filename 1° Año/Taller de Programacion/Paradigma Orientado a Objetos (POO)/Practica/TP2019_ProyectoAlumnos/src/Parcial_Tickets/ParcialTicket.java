
package Parcial_Tickets;

import java.util.Scanner;

public class ParcialTicket {
    
    public static Producto leerProducto(){
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el codigo del producto");
        int codigo = in.nextInt();
        if(codigo != 0 ){
            System.out.println("Ingrese la descripcion del producto");
            String des = in.next();
            System.out.println("Ingrese el precio del producto");
            double precio = in.nextDouble();
            Producto p = new Producto (codigo, des, precio);
            return p;
        }else{
            Producto p = new Producto (codigo," ", 0.0);
            return p;
        }

    }
    public static void main(String[] args) {
        int dimF = 100;
        Producto p = leerProducto();
        Tickets t = new Tickets (1,"23/05/2019",dimF);
        while (t.estaCompleto()== false && p.getCodigo() != 0){
            t.cargarProducto(p);
            p = leerProducto ();
        }
        Producto p1 = leerProducto();
        TicketDesc tD = new TicketDesc (25, 2,"23/05/2019",dimF);
        while (tD.estaCompleto()== false && p1.getCodigo() != 0){
            tD.cargarProducto(p1);
            p1 = leerProducto ();
        }
        System.out.println(t.mostrarResumen());

        if(t.abonableConDebito()== true){
            System.out.println("Su compra supera los $200, puede abonar con debito");
        }else
            System.out.println("Su compra no supera los $200, no puede abonar con debito");
        
        System.out.println(tD.mostrarResumenDesc());
        
        if (tD.abonableConDebito()== true){
            System.out.println("Su compra con el descuento supera $200, puede abonarla con debito");
        }else
            System.out.println("Su compra con el descuento no supera $200, no puede abonarla con debito");
 }
    
}
