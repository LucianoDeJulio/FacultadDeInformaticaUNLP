
package tema2;

import java.util.Scanner;

public class C2A1 {

    public static void main(String[] args) {
        Persona p = new Persona();
        Scanner in = new Scanner(System.in);
        int edad, dni;
        String nombre;
        System.out.println("Ingrese Nombre.");
        nombre = in.nextLine();
        p.setNombre(nombre);
        System.out.println("Ingrese Edad.");
        edad = in.nextInt();
        p.setEdad(edad);
        System.out.println("Ingrese DNI.");
        dni = in.nextInt();
        p.setDNI(dni);
        System.out.println(p.toString());
    }
    
}
