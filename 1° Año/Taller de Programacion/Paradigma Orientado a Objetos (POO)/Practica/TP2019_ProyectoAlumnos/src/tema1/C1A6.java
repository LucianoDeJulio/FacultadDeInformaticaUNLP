/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import java.util.Scanner;
public class C1A6 {

    public static void main(String[] args) {
     
    //1. definir la matriz de enteros de tamaño 10x10 e iniciarla con los primeros 100 números pares
    //   Ej: la pos. 0,0 contendrá 0; la pos. 0,1 contendrá 2; la pos. 0,2 contendrá 4; así siguiendo).
        
        int c = 10;
        int f = 10;
        int Pares=0;
        int [][] matriz = new int[f][c];
       for(f=0;f<10;f++){
            for(c=0;c<10;c++){
               matriz[f][c]=Pares;
               Pares=Pares+2;
            }
        }
        
    
    //2. mostrar el contenido de la matriz en consola
         for(f=0;f<10;f++){
            for(c=0;c<10;c++){
              System.out.println(matriz[f][c]);
            }
        }
       
    
    //3. calcular e informar la suma de todos los elementos almacenados entre las filas 2 y 9 y las columnas 0 y 3
         
         int suma=0;
         for(f=2;f<9;f++){
            for(c=0;c<3;c++){
              suma = suma + matriz[f][c];
            }
        }
        System.out.println(suma);
    
    //4. generar un vector de 10 posiciones donde cada posición i contiene la suma de la columna i de la matriz 
        int [] vector = new int[10];
        int sumar=0;
        for(c=0;c<10;c++){
            for(f=0;f<10;f++){
              sumar = sumar + matriz[f][c];
            }
            vector[c]=sumar;
            sumar=0;
        }
        for(c=0;c<10;c++){
            System.out.println("Posicion "+c+" valor "+vector[c]);
        }
        

    //5. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
    //   y en caso contrario imprima "No se encontró el elemento".
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese un valor a buscar");
        int valor= in.nextInt();
        c=0;
        f=0;
        while(f<=9 && valor>matriz[f][c]){
            while(c <= 9 && valor > matriz[f][c]){
                c++;
            }
            if(c==10 ){
                f++;
                c=0;
            }else
                if(valor==matriz[f][c]){
                    System.out.println("Fila " +f + " Columna " +c);
                }else
                    System.out.println("No se encontro elemento.");
            
        }        
       }
    }

