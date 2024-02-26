
package Parcial10;



public class Main {

  
    public static void main(String[] args) {
       Proyecto1 p = new Proyecto1("Proyecto X", 1234);
       Investigador1 d = new Investigador1("Luciano", "De Julio", 1, "Experto en Java");
       p.agregarDirector(d);
       Investigador1 v = new Investigador1("Valentin", "Varchioni", 2, "Experto en Pascal");
       Investigador1 m = new Investigador1("Marianela", "Diaz Catán", 3, "Experto en OO");
       Subsidio1 s1 = new Subsidio1 (5000, "Crear un proyecto");
       Subsidio1 s2 = new Subsidio1 (6000, "Crear un proyecto1234");
       v.agregarSubsidio(s1);
       v.agregarSubsidio(s2); 
       p.agregarInvestigador(v);
       p.agregarInvestigador(m);
       System.out.println();
       p.otorgarTodos("Valentin", "Varchioni");
       System.out.println(p.toString());
    }
    
}
