package tema4;

import java.util.Scanner;

public class C4A5 {
    
    public static Micro leerMicro(){
        Scanner in = new Scanner(System.in);
        String unaPatente, unDestino, unHorario;
        System.out.println("Ingrese patente.");
        unaPatente = in.next();
        if(!unaPatente.equals("z")){
            System.out.println("Ingrese un destino.");
            unDestino = in.next();
            System.out.println("Ingrese un horario de salida.");
            unHorario = in.next();
            Micro m = new Micro(unaPatente, unDestino, unHorario);
            return m;
        }else{
            Micro m = new Micro(unaPatente, "", "");
            return m;
        }
  
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Flota f = new Flota();
        Micro m = leerMicro();
        while(f.getDimL()<f.getDimF() && !m.getPatente().equals("z")){
            f.agregarMicro(m);
            m = leerMicro();
        }
        System.out.println("Ingrese una patente a buscar.");
        String unaPatente = in.next();
        if(f.eliminarMicroPatente(unaPatente)==true){
            System.out.println("Micro eliminado con exito.");
        }else
            System.out.println("No se encontro micro con esa patente.");
        System.out.println("Ingrese un destino.");
        String unDestino = in.next();
        m = f.devolverMicroDestino(unDestino);
        if(m!=null){
            System.out.println("El destino del micro con patente " + m.getPatente() + " es: " + m.getDestino() + " a las " + m.getHoraSalida() + ".");    
        }else
            System.out.println("No se encontro micro con ese destino.");
        System.out.println("Destinos disponibles: ");
        f.destinosDisponibles();
        
        
    }
    
}
