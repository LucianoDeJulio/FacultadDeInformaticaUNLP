
package tema3;

import java.util.Scanner;

public class C3A3 {

    public static void main(String[] args) {
       Scanner in = new Scanner(System.in);
       String nombre;
       int Torneos;
       double Sueldo;
       System.out.println("Ingrese nombre del entrenador");
       nombre = in.next();
       System.out.println("Ingrese el sueldo basico");
       Sueldo = in.nextDouble();
       System.out.println("Ingrese la cantidad de campeonatos ganados");
       Torneos = in.nextInt();
       Entrenadores e = new Entrenadores (nombre, Sueldo, Torneos);
       System.out.println(e);
    }
    
}
