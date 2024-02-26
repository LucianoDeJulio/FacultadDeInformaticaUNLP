/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;

public class C1A1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Scanner in = new Scanner (System.in); 
       System.out.println("Ingrese el lado A");
           int A= in.nextInt();     
       System.out.println("Ingrese el lado B");
           int B= in.nextInt();
       System.out.println("Ingrese el lado c");
           int C = in.nextInt();
       if(A < B+C && B < A+C && C < A+B){
           System.out.println("El triangulo es Valido");
       }else
           System.out.println("El triangulo no es Valido");
    }
    
}
