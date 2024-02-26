/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;

public class C1A9 {

    
    public static void main(String[] args) {
       int Cliente = 5;
       int Aspectos= 4;
       
       double [][] matriz = new double[Cliente][Aspectos];
       Scanner in = new Scanner(System.in);
       int f,i;
       double Calificacion;
       for(f=0;f<5;f++){ 
           System.out.println("Ingrese puntaje de la Atencion al Cliente." );
           Calificacion= in.nextDouble();
           matriz[f][0]=Calificacion;
           System.out.println("Ingrese puntaje de la Calidad de la comida." );
           Calificacion= in.nextDouble();
           matriz[f][1]=Calificacion;
           System.out.println("Ingrese puntaje del Precio." );
           Calificacion= in.nextDouble();
           matriz[f][2]=Calificacion;
           System.out.println("Ingrese puntaje del Ambiente." );
           Calificacion= in.nextDouble();
           matriz[f][3]=Calificacion;
       }
       System.out.println("hola");
       double promedio, suma=0;
       for(i=0;i<4;i++){
        System.out.println("hola");
        for(f=0;f<5;f++){
           suma=suma+matriz[f][i];
           System.out.println(suma);
           }   
        promedio=(suma/5);
        System.out.println("El promedio del aspecto :" + i + " es " + promedio );
       
       }
            
            
    }
    
}
