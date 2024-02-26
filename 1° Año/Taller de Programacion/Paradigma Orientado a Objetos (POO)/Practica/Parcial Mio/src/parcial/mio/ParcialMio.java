
package parcial.mio;


public class ParcialMio {
    
    public static void main(String[] args) {
       Proyecto p = new Proyecto("Facultad",2019,49);
       Investigador d= new Investigador("Diyu","Animal",1,"Experto en Orientacion a Objetos",5);
       p.agregarDirector(d);
       d= new Investigador ("Yuli","Animal",2,"Experto en AKM (pubg)",5);
       p.agregarInvestigador(d);
       d= new Investigador ("Faca","Animal",3,"Experto en Kar98 (pubg)",5);
       p.agregarInvestigador(d);
       subsidio s = new subsidio(40000,"Compra de Armas",true);
       p.agregarSubsidio(1, s);
       s = new subsidio(50000,"Compra de Miras", true);
       p.agregarSubsidio(1, s);
       System.out.println(p.ToString());
    }
    
}
