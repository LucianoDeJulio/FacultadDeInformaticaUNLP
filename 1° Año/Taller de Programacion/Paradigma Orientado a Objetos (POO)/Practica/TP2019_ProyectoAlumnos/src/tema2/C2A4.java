package tema2;

import java.util.Scanner;

public class C2A4 {
    
    public static Persona leerPersona(Persona p ){
        int edad, dni;
        String nombre;
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese Nombre.");
        nombre = in.next();
        in.nextLine();
        p.setNombre(nombre);
        if(!p.getNombre().equals("zzz")){
            System.out.println("Ingrese Edad.");
            edad = in.nextInt();
            p.setEdad(edad);
            System.out.println("Ingrese DNI.");
            dni = in.nextInt();
            p.setDNI(dni);
            return p;
        }else
            return p;
    } 
    
    public static void imprimirPersonas( Persona p, int turno){
        System.out.println("Se presenta la persona con el turno: " + (turno+1) + " " + p.toString());   
    }
    
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int dimFF=2;
        int dimFC=2;
        Persona [][] Semana = new Persona[dimFF][dimFC];
        int dimLF=0, dimLC=0, elem=0;
        Persona p = new Persona();
        leerPersona(p);
        while( dimLF<dimFF && !p.getNombre().equals("zzz")){
            while(dimLC<dimFC && !p.getNombre().equals("zzz")){
                elem++;
                dimLC++;
                Semana[dimLF][dimLC-1] = p;
                p = new Persona();
                leerPersona(p);  
            }
            if(!p.getNombre().equals("zzz") ){    
                dimLF++;
                dimLC=0; 
            }
        }
        int ff, cc, f=0, c=0;
        ff = elem / dimFC;
        cc = elem % dimFC;
        while(f<ff){
            System.out.println("Las personas el dia "+ (f+1) + " son: ");
            for(c=0;c<dimFC;c++){
                System.out.println("Se presenta la persona con turno " + (c+1) +" "+ Semana[f][c]);
            }
            f++;
        }
        if(cc!=0){
            System.out.println("Las personas el dia "+ (f+1) + " son: ");
            for(c=0;c<cc;c++){
                System.out.println("Se presenta la persona con turno " + (c+1) +" "+ Semana[f][c]);
            }
        }
        
    }   
        
    }
    
      
    
   

