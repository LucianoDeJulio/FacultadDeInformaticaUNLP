package Parcial7;

import java.util.Scanner;
    
public class Main {
    
     public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        Teorico t = new Teorico ("Norma Garcia","22/10/2018");
        int i;
        for(i=0;i<5;i++){
            System.out.println("Ingrese el resultado de la pregunta " + (i+1));
            boolean nota = in.nextBoolean();
            if(t.validarPregunta(i)== true){
               t.cargarResultadoPregunta(i, nota);
            }
        }
        System.out.println("Ingrese el puntaje practico");
        double notaPrac = in.nextDouble();
        TeoricoPractico tP = new TeoricoPractico (notaPrac,"Pablo Perez","22/10/2018");
        for(i=0;i<5;i++){
            System.out.println("Ingrese el resultado de la pregunta " + (i+1));
            boolean nota = in.nextBoolean();
            if(tP.validarPreguntaTP(i)== true){
               tP.cargarResultadoTP(i, nota);
            }
        }
        System.out.println("Parcial teorico " + " " + t.toString());
        System.out.println("Parcial teorico-practico " + " " + tP.toString());
    }    

}
