/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;

public class C1A4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int i=1;
        int valor;
        int j;
        int factorial;
        for(i=1;i<=9;i++){
            valor = i;
            factorial = 1;
            for (j=1;j<=valor;j++){
                factorial = factorial *j;
            }
            System.out.println("el factorial de " + i + " es: " + factorial );
        }
        for(i=1;i<=9;i++){
            if(i%2!=0){
            valor = i;
            factorial = 1;
            for (j=1;j<=valor;j++){
                factorial = factorial *j;
            }
            System.out.println("el factorial de " + i  + " es: " + factorial );    
            }
            
        }
    }
    
}
