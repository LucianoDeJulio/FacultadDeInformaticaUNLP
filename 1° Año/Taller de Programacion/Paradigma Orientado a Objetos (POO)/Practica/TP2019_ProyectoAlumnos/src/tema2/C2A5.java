
package tema2;

import java.util.Scanner;

public class C2A5 {

    public static void main(String[] args) {
        int dimF = 10;
        String [] vector = new String[dimF];
        int i;
        Scanner in = new Scanner(System.in);
        for (i=0;i<10;i++){
            System.out.println("Ingrese la palabra" );
            String Palabra = in.next();
            vector[i]= Palabra;
        }
        for (i=0;i<10;i++){
            System.out.println("La palabra ingresada es: " + vector[i] );
        }
        System.out.println("El mensaje oculto es : ");
        for(i=0; i< 10; i++){
            System.out.print( vector[i].charAt(0) );
        }
    }
    
}
