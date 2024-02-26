
package Parcial11;

import java.util.Scanner;

public class Main {

    public static Jugador leerJugador(){
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el nombre del jugador");
        String nombre = in.next();
        System.out.println("Ingrese la edad del jugador");
        int edad = in.nextInt();
        System.out.println("Ingrese el dni del jugador");
        int dni = in.nextInt();
        System.out.println("Ingrese el sueldo basico");
        double sueldo = in.nextDouble();
        System.out.println("Ingrese la habilidad del jugador");
        String habilidad = in.next();
        Jugador j = new Jugador (edad, habilidad,nombre, dni, sueldo);
        return j;
    }
    
    public static void main(String[] args) {
         Entrenador dt = new Entrenador (2,"Ariel Holan", 22222222, 5000);
         Equipo e = new Equipo("El BarceHolan", dt);
         Jugador j1 = leerJugador();
         Jugador j2 = leerJugador();
         Jugador j3 = leerJugador();
         Jugador j4 = leerJugador();
         e.asignarPosicion(j1, 5);
         e.asignarPosicion(j4, 1);
         e.asignarPosicion(j2, 2);
         e.asignarPosicion(j3, 7);
         System.out.println(e.toString());
         System.out.println(e.posicionVacia());
         System.out.println(e.buscarJugador(2));
    }
    
    
}
