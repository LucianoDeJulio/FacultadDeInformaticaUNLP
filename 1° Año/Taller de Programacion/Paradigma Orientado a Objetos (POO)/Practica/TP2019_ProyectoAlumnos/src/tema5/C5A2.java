
package tema5;

import java.util.Scanner;

public class C5A2 {
    
    public static Jugador leerJugador(){
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el nombre del jugador");
        String nombre = in.next();
        System.out.println("Ingrese el sueldo basico del jugador");
        double sueldo = in.nextDouble();
        System.out.println("Ingrese la cantidad de goles hechos por el jugador");
        int goles = in.nextInt();
        System.out.println("Ingrese la cantidad de partidos jugador por el jugador");
        int partidos = in.nextInt();
        Jugador j = new Jugador (goles, partidos, nombre, sueldo);
        return j;
    }
    
    public static Entrenador leerEntrenador (){
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el nombre del entrenador");
        String nom = in.next();
        System.out.println("Ingrese el sueldo basico del entrenador");
        double sueldoBas = in.nextDouble();
        System.out.println("Ingrese la cantidad de campeonatos ganados por el entrenador");
        int campeonatos = in.nextInt();
        Entrenador e = new Entrenador (campeonatos, nom, sueldoBas);
        return e;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        Jugador j = leerJugador();
        Entrenador e = leerEntrenador ();
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
    
}
