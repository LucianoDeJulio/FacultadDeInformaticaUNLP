
package Parcial_Espectador;

import java.util.Scanner;
public class ParcialTeatroEsp {

    public static Espectador leerEspectador(){
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el dni del espectador");
        int dni = in.nextInt();
        if(dni != 0 ){
            System.out.println("Ingrese el nombre del espectador");
            String nombre = in.next();
            System.out.println("Ingrese la edad del espectador");
            int edad = in.nextInt();
            Espectador e = new Espectador (nombre,dni,edad);
            return e;
        }else{
            Espectador e = new Espectador (" ", 0 , 0);
            return e;
        }
    }
    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        Funcion f = new Funcion ("Cazafantasmas", "22/10/2018", "20:00 hs", 3, 4);
        f.inicializarDimLB();
        Espectador e = leerEspectador();
        System.out.println("Ingrese una fila");
        int unaFila = in.nextInt();
        while(f.calcularButacasLibres()>0 && e.getDni()!=0){
            if(f.estaRegistradoEspectador(e.getDni())==false && f.validarFila(unaFila)==true && f.hayButacaLibreEnFila(unaFila)==true){
                System.out.println("El asiento asignado es: " + f.agregarEspectador(unaFila, e));
                e = leerEspectador();
                System.out.println("Ingrese la fila que desea.");
                unaFila = in.nextInt();
            }else
                if(f.validarFila(unaFila)==false){
                    System.out.println("El numero de fila no es valido");
                    e = leerEspectador();
                    System.out.println("Ingrese la fila que desea.");
                    unaFila = in.nextInt();
                }else
                    if(f.hayButacaLibreEnFila(unaFila)== false){
                        System.out.println("No hay butacas disponibles en la fila ingresada");
                        e = leerEspectador();
                        System.out.println("Ingrese la fila que desea.");
                        unaFila = in.nextInt();
                    }else 
                        if(f.estaRegistradoEspectador(e.getDni())==true){
                            System.out.println("Dni registrado.");
                            e = leerEspectador();
                            System.out.println("Ingrese la fila que desea.");
                            unaFila = in.nextInt();
                        }                
        
        
        
         }
        System.out.println("La cantidad de personas en la funcion son: " + f.calcularButacasLibres());
        System.out.println("El promedio de edad de las personas en la funcion son: " + f.calcularEdadPromEspectadores());
    }   
}
