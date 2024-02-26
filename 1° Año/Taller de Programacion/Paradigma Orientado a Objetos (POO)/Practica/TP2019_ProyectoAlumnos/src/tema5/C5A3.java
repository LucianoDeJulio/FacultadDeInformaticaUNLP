
package tema5;

import java.util.Scanner;

public class C5A3 {
    
    public static Persona leerPersona (){
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el nombre de la persona");
        String nombre = in.next();
        System.out.println("Ingrese el dni de la persona");
        int dni = in.nextInt();
        System.out.println("Ingrese la edad de la persona");
        int edad = in.nextInt();
        Persona p = new Persona (nombre, dni, edad);
        return p;
    }
    
    public static Trabajador leerTrabajador(){
        Scanner in = new Scanner (System.in);
        System.out.println("Ingrese el nombre de la persona");
        String nombre = in.next();
        System.out.println("Ingrese el dni de la persona");
        int dni = in.nextInt();
        System.out.println("Ingrese la edad de la persona");
        int edad = in.nextInt();
        System.out.println("Ingrese la actividad que realiza");
        String actividad = in.next();
        Trabajador t = new Trabajador (actividad, nombre, dni, edad);
        return t;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        Persona p = leerPersona ();
        Trabajador t = leerTrabajador ();
        System.out.println(p.toString());
        System.out.println(t.toString());
        
    }
    
}
