
package Parcial_JuliTaller;

import java.util.Scanner;

public class Test {

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
        SubsidioDeEstadia e = new SubsidioDeEstadia ("Henderson",3,"Luciano","Diyu","05/05/2020");
        e.setPlanTrabajo("El mas capito");
        e.setCostoPasaje(2500);
        e.setMontoHotelPorDia(1000);
        SubsidioBien b = new SubsidioBien (3,"Pepe","Pompin","29/05/2019");
        b.setPlanTrabajo("Se la rasca a dos manos");
        int i;
        for (i=0; i < 3; i++){
            Bien b1= leerBien();
            b.agregarBien(b1);
        }
        System.out.println(b.toString());
        System.out.println(e.toString());
    }   
    
}
