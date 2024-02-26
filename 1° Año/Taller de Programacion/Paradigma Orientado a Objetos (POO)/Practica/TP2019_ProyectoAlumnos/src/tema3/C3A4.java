package tema3;
import java.util.Scanner;
public class C3A4 {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        double radio;
        String linea, relleno;
        System.out.println("Ingrese radio del circulo.");
        radio = in.nextDouble();
        System.out.println("Ingrese color de linea del circulo.");
        linea = in.next();
        System.out.println("Ingrese color de relleno del circulo.");
        relleno = in.next();
        Circulo c = new Circulo(radio, linea, relleno);
        System.out.println("El perimetro del circulo es: " + c.calcularPerimetro());
        System.out.println("El area del circulo es: " + c.calcularArea());
        System.out.println("El color de relleno del circulo es: " + c.getRelleno());
        System.out.println("El color de linea del circulo es: " + c.getLinea());
    }
    
}
