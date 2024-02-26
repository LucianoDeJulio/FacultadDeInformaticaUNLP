
package Parcial2;

public class Main {

    public static void main(String[] args) {
        Pelicula p = new Pelicula("Creed","Sylvester Stallone",193);
        Pelicula p1 = new Pelicula ("Creed 2","Sylvester Stallone",190);
        Pelicula p2 = new Pelicula("Rocky IV", "Sylvester Stallone", 181);
        Sala s = new Sala(1, 150, 148, p);
        Sala s1 = new Sala(2, 160, 140, p1);
        Sala s2 = new Sala(3,140,137, p2);
        Cine c = new Cine ("Cinema","Calle 1","Diyu");
        c.agregarSala(s);
        c.agregarSala(s1);
        c.agregarSala(s2);
        c.devolverEntradas(3);
        c.venderEntradas(1);
        System.out.println("Hay entradas disponibles? " + c.verificarEntradasDisponibles(3));
        c.devolverSalaPeliProyectada(p.getNombre());
        System.out.println("La pelicula con mas entradas vendidas es " + c.mayorCantidadVendida());
        System.out.println("La pelicula con recaudacion es " + c.peliculaMayorRecaudacion());
    }
    
}
