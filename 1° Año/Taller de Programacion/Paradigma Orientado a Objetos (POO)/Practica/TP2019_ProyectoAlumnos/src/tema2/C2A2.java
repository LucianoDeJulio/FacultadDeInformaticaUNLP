package tema2;
import java.util.Scanner;
public class C2A2 {

    public static void main(String[] args) {
        int dimF = 3;
        Persona [] lista = new Persona[dimF];
        Scanner in = new Scanner(System.in);
        int i,edad, dni, cant=0, menD=99999999;
        String nombre;
        //Persona p = new Persona();
        Persona a = new Persona();
        for(i=0;i<dimF;i++){ 
            lista[i]=new Persona();
            lista[i]=leerPersona(lista[i]);
        }
        for(i=0;i<dimF;i++){
            cant=menor65(lista[i], cant);
            if(lista[i].getDNI()<menD){
                menD=lista[i].getDNI();
                a=lista[i];
            }
        }
        System.out.println("La cantidad de personas menor a 65 anios es: " + cant);
        System.out.println("Se presenta la persona con menor DNI: "+a.toString());
        }
        
        
    
    public static Persona leerPersona(Persona p ){
        int edad, dni;
        String nombre;
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese Nombre.");
        nombre = in.nextLine();
        in.nextLine();
        p.setNombre("hola");
        System.out.println("Ingrese Edad.");
        edad = in.nextInt();
        p.setEdad(edad);
        System.out.println("Ingrese DNI.");
        dni = in.nextInt();
        p.setDNI(dni);
        return p;
    }
    
    public static int menor65(Persona p, int cant){
        int i;
        if(p.getEdad()<65){
                cant++;
        }
        return cant;
    }
    
}