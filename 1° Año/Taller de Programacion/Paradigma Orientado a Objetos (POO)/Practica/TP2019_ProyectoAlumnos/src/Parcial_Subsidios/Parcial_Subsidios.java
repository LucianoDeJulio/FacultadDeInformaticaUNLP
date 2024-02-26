
package Parcial_Subsidios;

import java.util.Scanner;

public class Parcial_Subsidios {
    
    public static Bien leerBien(){
       Scanner in = new Scanner(System.in);
       System.out.println("Ingrese la descripcion");
       String desc = in.next();
       System.out.println("Ingrese el tipo de bien");
       String tipo = in.next();
       System.out.println("Ingrese el costo del bien");
       int costo = in.nextInt();
       System.out.println("Ingrese la cantidad de bienes");
       int cant = in.nextInt();
       Bien b1 = new Bien (desc,tipo,costo,cant);
       return b1;
    }

    public static void main(String[] args) {
        SubsidioEstadia e = new SubsidioEstadia ("Henderson",3,"Luciano","Diyu","29/05/19");
        e.setCostoPasaje(1000);
        e.setHotelDia(800);
        SubsidioBienes b = new SubsidioBienes (3,"Julian","Bellafronte","29/05/2019");
        b.setPlanTrabajo("Jugador Profesional del Fortnite");
        int i;
        for (i=0; i < 3; i++){
            Bien b1= leerBien();
            b.agregarBien(b1);
        }
        System.out.println(b.toString());
        System.out.println(e.toString());
    }   
}
