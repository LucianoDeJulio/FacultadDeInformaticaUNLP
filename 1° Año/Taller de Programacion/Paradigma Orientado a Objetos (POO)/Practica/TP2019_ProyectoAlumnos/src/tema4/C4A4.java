package tema4;

import java.util.Scanner;

public class C4A4 {
    
    public static int asiento(){
        Scanner in = new Scanner(System.in);
        int as;
        System.out.println("¿Que asiento desea?");
        as = in.nextInt();
        return as;
    }
 
    public static void main(String[] args) {
        Micro m = new Micro("ABC123", "Mar del plata", "5:00 AM");
        int a;
        a = asiento();
        int diml=0;
        while( a!=-1 && m.microOcupado()==false){
            if(m.validarAsiento(a-1)==true){
                if(m.asientoOcupado(a-1)==true){
                    m.ocuparAsiento(a-1);
                    System.out.println("Asiento ocupado con exito.");
                }else{
                    a=m.asientoLibre();
                    System.out.println("El asiento se encuentra ocupado. El proximo asiento libre es el numero: " + (a+1));
                }
            } 
            a = asiento();
        }
        System.out.println("La cantidad de asientos ocupados son: " + m.getCantAsientosOcupados());
        
    }
    
}
