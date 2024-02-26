/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;

public class C1A8 {

    
    public static void main(String[] args) {
       int dimF = 5;
       int [] vector = new int[dimF];
       Scanner in = new Scanner(System.in);
       System.out.println("Ingrese la operacion a realizar" );
            int Op = in.nextInt();
       while (Op != 999){
           vector[Op]++;
           System.out.println("Ingrese la operacion a realizar" );
           Op = in.nextInt();
       }
       int i;
       for (i=0;i<5;i++){
           System.out.println("La cantidad de operaciones en la caja " + (i) + " fueron: " + vector[i]);
       }
        
       
           
    }
    
}
