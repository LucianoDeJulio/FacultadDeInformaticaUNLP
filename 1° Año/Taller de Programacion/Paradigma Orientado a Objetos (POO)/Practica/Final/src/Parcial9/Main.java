
package Parcial9;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
       Scanner in = new Scanner (System.in);
       Sondeo s = new Sondeo ("¿Es adecuada la limpieza?");
       s.iniciarUrnas();
       System.out.println("Ingrese el tipo de cliente");
       int unCliente = in.nextInt();
       System.out.println("Ingrese el tipo de sucursal");
       int unaSucursal = in.nextInt();
       System.out.println("Ingrese el tipo de opinion. 1 = Opinion positiva o 2 = Opinion negativa");
       int unVoto = in.nextInt();
       
       while(unVoto !=0){
           if(s.validarCliente(unCliente)== true){
               if(s.validarSucursal(unaSucursal)== true){
                   s.agregarVotoUrna(unVoto, unCliente, unaSucursal);
               }
           }
           if(s.validarCliente(unCliente) == false){
               System.out.println("El tipo de cliente no es valido");
           }else
               if(s.validarSucursal(unaSucursal)== false){
                   System.out.println("El tipo de sucursal no es valido");
                }
            System.out.println("Ingrese el tipo de cliente");
            unCliente = in.nextInt();
            System.out.println("Ingrese el tipo de sucursal");
            unaSucursal = in.nextInt();
            System.out.println("Ingrese el tipo de opinion. 1 = Opinion positiva o 2 = Opinion negativa");
            unVoto = in.nextInt();
       }
       System.out.println("El resultado del sondeo es: ");
       s.mostrarResultadosUrnas();
       System.out.println(s.sucursalGanadora());
       System.out.println(s.clienteMasExigente());
    }
    
}
