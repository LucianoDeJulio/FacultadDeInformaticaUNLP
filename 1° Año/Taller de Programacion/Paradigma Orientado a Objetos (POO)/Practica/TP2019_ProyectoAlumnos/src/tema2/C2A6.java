package tema2;

import java.util.Scanner;

public class C2A6 {
    
    public static Partido leerPartido(Partido p){
        Scanner in = new Scanner(System.in);
        p = new Partido ();
        String local, visit;
        int gLocal, gVisit;
        System.out.println("Ingrese nombre del equipo local.");
        local = in.nextLine();
        p.setLocal(local);
        if(!(p.getLocal().equals("zzz"))){
            System.out.println("Ingrese goles del equipo local.");
            gLocal = in.nextInt();
            p.setGolesLocal(gLocal);
            in.nextLine();
            System.out.println("Ingrese nombre del equipo visitante.");
            visit = in.nextLine();
            p.setVisitante(visit);
            System.out.println("Ingrese goles del equipo visitante.");
            gVisit = in.nextInt();
            p.setGolesVisitante(gVisit);
            
        }
        return p;
    }
    
    public static int ganoRiver (Partido p){
        int Cant=0;
        if (p.getLocal().equals ("River")){
               if ((p.getGanador()).equals("River")){
                   Cant++;
               }
            }else{
              if (p.getVisitante().equals ("River")){
                if (p.getGanador().equals ("River")){
                    Cant++;
                }
              }
        }
        return Cant;
    }
    
    public static int golesBoca (Partido p){
        int gol=0;
        if (p.getLocal().equals ("Boca")){
            gol = p.getGolesLocal();
            }else
              if (p.getVisitante().equals ("Boca")){
                gol = p.getGolesVisitante();
              }
        return gol;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int dimF = 20;
        int dimL = 0;
        Partido [] partidos = new Partido[dimF];
        Partido p = new Partido ();
        p=leerPartido(p);
        while((dimL < dimF) && !(p.getLocal().equals("zzz"))){
            dimL++;
            partidos [dimL-1] = p;
            p=leerPartido(p);   
            
        }
        int i;
        int Cant = 0;
        int GolBoca = 0;
        int Contador = 0;
        double Porcentaje;
        for (i=0;i < dimL; i++){
           Cant = Cant + ganoRiver(partidos[i]);
           GolBoca = GolBoca + golesBoca(partidos[i]);
           if(partidos[i].hayEmpate()== true){
               Contador++;
           }
        }
        System.out.println("La cantidad de empates son: " + Contador);
        Porcentaje = (Contador * 100)/ dimL;
        System.out.println("La Cantidad de partido que gano River son: " + Cant);
        System.out.println("La Cantidad de goles que hizo Boca son: " + GolBoca);
        System.out.println("El porcentaje de empates es:  " + Porcentaje);
                }
    
}
