
package tema4;

import java.util.Scanner;


public class C4A2 {
    
    public static Entrenadores1 leerEntrenador(){
       Scanner in = new Scanner(System.in);
       String nombre;
       int Torneos;
       double Sueldo;
       System.out.println("Ingrese nombre del entrendor");
       nombre = in.next();
       System.out.println("Ingrese el sueldo basico");
       Sueldo = in.nextDouble();
       System.out.println("Ingrese la cantidad de campeonatos ganados");
       Torneos = in.nextInt();
       Entrenadores1 e = new Entrenadores1 (nombre, Sueldo, Torneos);
       return e;
    }

    public static void main(String[] args) {
       Scanner in = new Scanner(System.in);
       Entrenadores1 e = new Entrenadores1();
       System.out.println(e);
       Entrenadores1 f = leerEntrenador();
       System.out.println(f);   
    }
    
}
