
package Parcial_Tickets;

public class Enunciado {

    
    public static void main(String[] args) {
        /* 1. Representar los sig. tickets emitidos por un supermercado: normal y con descuento.
            
            - Los tickets normales se caracterizan por mantener: num. de ticket, fecha y los productos comprados (a lo sumo 100).
            Los productos se caracterizan por tener codigo, descripcion y precio.
            
            - Los tickets con descuento son tickets normales que ademas tienen un porcentaje de descuento a aplicar.
        
         a)- Realice el modelo de clases. Implemente las clases con sus atributos y metodos getters/setters que se adecuen al problema.
         Provea constructores para iniciar; los tickets normales a partir de un numero de ticket y fecha; los tickets con descuento a 
         partir de un numero de ticket, fecha y porcentaje de descuento; los productos a partir de un codigo, descripcion y precio.
        
         b)- Ambos tickets deben responder a los mensajes:
                - cargarProducto: recibe un preducto y lo carga al ticket.
                - estaCompleto: devuelve un boolean que indica si ya se cargaron los 100 productos.
                - verCantDeProds: devuelve la cantidad de productos cargados.
         
         c)- Ambos tickets deben responder al mensaje calcularPrecioFinal que calcula y retorna el precio final:
                - En los tickets normales, el precio final es la suma de los precios de los productos cargados.
                - En los tickets con descuento, el precio final es la suma de los precios de los productos cargados al que se le
                descuenta un monto (determinado por el porcentaje de descuento).
         
         d)- Los tickets con descuento deben responder al mensaje calcularAhorroFinal que calcula y retorna el monto descontado en el
         precio final (determinado por el porcentaje de descuento).
         
         e)- Ambos tickets deben responder al mensaje mostrarResumen que imprime el numero de ticket, el codigo, descripcion y precio
         de cada producto cargado, y el precio final; y para los tickets con descuento muestra ademas el ahorro final.
        
         f)- Ambos tickets deben responder al mensaje abonableConDebito que devuelve un boolean que indica si el ticket puede abonarse
         con debito, esto es posible cuando su precio final supera los $200.
        
        2. Realice un programa que instancie un ticket normal, con numero 1 y fecha "23/05/2019". Leer desde teclado la informacion
        de productos y cargarlos al ticket, hasta ingresar codigo de producto 0 o completar el ticket. Luego, instancie un ticket con
        descuento con numero 2, fecha "23/05/2019" y porcentaje de descuento leido de teclado. Cargue de manera similar productos a este ticket.
        Al finalizar, muestre el resumen de cada ticket e imprima si son abonables con debito.
        */ 
    }
    
}
