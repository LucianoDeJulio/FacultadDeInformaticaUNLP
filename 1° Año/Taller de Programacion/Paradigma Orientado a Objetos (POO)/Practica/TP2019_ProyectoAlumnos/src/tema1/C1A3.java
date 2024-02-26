/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;

public class C1A3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese un valor");
        int valor= in.nextInt();
        if(valor==0){
            System.out.println("El factorial de 0 es 0 ");
        }else{
            int Factorial=1;
            int i;
            for (i=1; i<=valor;i++){
                Factorial= Factorial * i;
            }
        System.out.println("El factorial del valor ingresado es "+ Factorial);    
    }
    }
}
