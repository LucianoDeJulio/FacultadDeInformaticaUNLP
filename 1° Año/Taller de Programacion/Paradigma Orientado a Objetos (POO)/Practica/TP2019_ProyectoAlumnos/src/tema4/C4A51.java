
package tema4;

import java.util.Scanner;

public class C4A51 {
    
    public static Micro leerMicro(){
        String patente, destino, horaSalida;
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese la patente del micro");
        patente = in.next();
        if(!patente.equals("zzz000")){
            System.out.println("Ingrese el destino del micro");
            destino = in.next();
            System.out.println("Ingrese la hora de salida del micro");
            horaSalida = in.next();
            Micro m= new Micro (patente, destino, horaSalida);
        return m;
        }else{
            Micro m = new Micro(patente, "", "");
            return m;
        }

    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int i=0;
        Flota1 f = new Flota1();
        Micro m = leerMicro();
        while(f.getDimL()<f.getDimF() && !m.getPatente().equals("zzz000") ){
            f.agregarMicro(m);
            m = leerMicro();
        }
        System.out.println("Ingrese la patente a buscar");
        String  p = in.next();
        if (f.eliminarMicroPatente(p)== true){
            System.out.println("El micro con patente " + p + "fue eliminado con exito");
        }else
            System.out.println("No se encontro el micro");
        
        System.out.println("Ingrese destino a buscar");
        String  d = in.next();
        m= f.buscarMicroDestino(d);
        if (m != null){
            System.out.println("El micro con patente " + m.getPatente() + " parte con destino " + m.getDestino() + " con un horario de salida " + m.getHoraSalida());
        }else
            System.out.println("No se encontro el destino del micro");
            
            
    }
    
}
