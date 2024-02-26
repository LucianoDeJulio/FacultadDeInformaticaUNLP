
package tema1;

//Paso 1: Importe la funcionalidad para entrada de datos

import java.util.Scanner;

public class C1A5 {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double
        
        double [] jugadores ;
        
        //Paso 3: Crear el vector para 15 double
        
        int indice = 15;
        
        jugadores = new double [indice];
        
        //Paso 4: Declarar indice
        
        int i;
        
        //Paso 5: Declarar y crear el scanner
        
        Scanner in = new Scanner(System.in);
                
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        
        double total = 0;
        for(i=0;i<indice;i++){
           System.out.println("Ingrese altura de jugador");
           double alt = in.nextDouble();
           jugadores[i] = alt;
           total = total + alt;
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        
        double promedio = total/indice;
        System.out.println("El promedio de las altura es: " + promedio);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        
        int cant = 0;
        System.out.println("Alturas por encima del promedio:");
        for(i=0;i<indice;i++){
            if(jugadores[i]>promedio){
                System.out.println(jugadores[i]);
                cant++;
            }
        }
     
        //Paso 9: Informar la cantidad.
        
        System.out.println("La cantidad de jugadores por debajo del promedio son: " + cant);
    }
    
}
