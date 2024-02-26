
package Parcial1;

public class Main {
    
    public static void main(String[] args) {
       Cancion c = new Cancion ("Fantasma",305);
       Cancion c1 = new Cancion ("Guadalupe", 281);
       Cancion c2 = new Cancion ("Como Ali", 212);
       Cancion c3 = new Cancion("Desde lejos no se ve",241);
       Cancion c4 = new Cancion ("Chac tu Chac", 202);
       Cancion c5 = new Cancion ("Civilizacion", 306);
       Disco d = new Disco("Maquina de Sangre", 2003);
       Disco d1 = new Disco("Civilizacion", 2007);
       Disco d2 = new Disco("Ritual", 1999);
       Banda b = new Banda("Los piojos", "Buenos aires","Rock");
       b.agregarDisco(d);
       b.agregarDisco(d1);
       b.agregarDisco(d2);
       b.agregarCancionAdisco(d, c);
       b.agregarCancionAdisco(d, c1);
       b.agregarCancionAdisco(d, c2);
       b.agregarCancionAdisco(d2, c3);
       b.agregarCancionAdisco(d2, c4);
       b.agregarCancionAdisco(d1, c5);
       System.out.println("La duracion de la cancion Como Ali es: " + b.duracionCancionDisco("Maquina De Sangre", "Como Ali"));
       System.out.println("La cancion mas larga es: " + b.duracionMaxCancion());
       System.out.println("La cantidad de canciones del disco mas viejo son: " + b.cancionesDiscoViejo());
       System.out.println(b.toString()); 
    }
    
}
