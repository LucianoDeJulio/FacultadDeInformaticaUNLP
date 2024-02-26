/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

import java.util.Scanner;

public class C4A3 {
    
    public static Libro1 leerLibro(){
        
        int edicion;
        String titulo,nomA, bio, edi,isbn;
        double precio;
        Scanner in = new Scanner(System.in);
        System.out.println("Ingrese el titulo del libro");
        titulo = in.nextLine();
        System.out.println("Ingrese el nombre del autor");
        nomA = in.next();
        System.out.println("Ingrese la biografia del autor");
        bio = in.next();
        Autor a = new Autor(nomA, bio);
        System.out.println("Ingrese la editorial del libro");
        edi = in.next();
        System.out.println("Ingrese el año de edicion");
        edicion = in.nextInt();
        System.out.println("Ingrese el ISBN del libro");
        isbn = in.next();
        System.out.println("Ingrese el precio del libro");
        precio = in.nextDouble();
        Libro1 l = new Libro1(titulo, edi, edicion, a, isbn, precio);
        return l;
    }
    public static void main(String[] args) {
        Libro1 l = leerLibro();
        
        System.out.println(l.toString());
        
    }
 }
    
    
    

