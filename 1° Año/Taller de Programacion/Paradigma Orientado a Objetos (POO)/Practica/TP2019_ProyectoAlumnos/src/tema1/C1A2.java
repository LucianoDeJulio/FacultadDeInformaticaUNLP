/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;

public class C1A2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Scanner in = new Scanner(System.in);
       System.out.println("Ingrese la Patente");
           int Patente= in.nextInt();
           int total=0;
           int SumaPar=0;
           while(Patente != 0){
               total++;
               if((Patente % 2)==0){
                  System.out.println("Tiene Permitido el paso");
                  SumaPar++;
               }else{
                  System.out.println("No Se le permite el paso");
               }
               Patente= in.nextInt();
           }
           System.out.println("El Total de patente es " + total);
           System.out.println("Las patentes pares son " + SumaPar);
           double Por= SumaPar/ total*100;
           System.out.println("El Porcentaje % " + Por) ;
    }
    
}
