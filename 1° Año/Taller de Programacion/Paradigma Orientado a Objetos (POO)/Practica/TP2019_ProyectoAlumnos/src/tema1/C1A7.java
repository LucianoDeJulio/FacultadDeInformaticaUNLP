/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;

public class C1A7 {
   public static void main(String[] args) {
       int c = 4;
       int f = 8;
       int [][] matriz = new int[f][c];
       System.out.println("Ingrese el numero de piso" );
       Scanner in = new Scanner(System.in);
            int Piso= in.nextInt();
       while(Piso != 9){
            System.out.println("Ingrese el numero de oficina");
                int Oficina= in.nextInt();
            matriz[Piso-1][Oficina-1]++;
            System.out.println("Ingrese el numero de piso" );
            Piso= in.nextInt();
       }
       for(f=0;f<8;f++){
            for(c=0;c<4;c++){
                System.out.println("El piso " + (f+1) + "Oficina " + (c+1) + "Ingresaron: " + matriz[f] [c] );
            }
            
       }
   }
}
   
