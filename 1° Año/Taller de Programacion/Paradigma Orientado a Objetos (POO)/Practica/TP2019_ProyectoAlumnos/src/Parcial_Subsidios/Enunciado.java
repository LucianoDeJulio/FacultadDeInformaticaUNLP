
package Parcial_Subsidios;


public class Enunciado {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       /* 1). La UNLP desea un sistema que le permita administrar diferentes subsidios (de estadía y de bienes)
        pedidos por sus investigadores. De todo subsidio se conoce el nombre y apellido del investigador, el
        plan de trabajo actual (un String) y la fecha solicitada (un String).
        
            a)- De los subsidios de estadía se conoce el lugar de destino, el costo del pasaje de ida y vuelta,
            la cantidad de días del viaje y el monto de hotel por día.
        
            b)- De los subsidios de bienes se poseen los detalles de cada bien solicitado: descripción, tipo de
            bien (de uso o de consumo), cantidad y costo por unidad.
        
        2). Implemente el modelo de clases teniendo en cuenta:
        
            a)- Un subsidio de estadía solo debería poder construirse con el nombre y apellido del investigador,
            la fecha, el lugar y la cantidad de días del viaje.
        
            b)- Un subsidio de bienes solo debería poder construirse con el nombre y apellido del investigador,
            la fecha y la cantidad de bienes a pedir.
        
            c)- La posibilidad de agregar un bien al subsidio de bienes, estableciendo la descripción, tipo de
            bien, cantidad y costo por unidad.
        
            d)- La posibilidad de poder modificar cualquier atributo descripto en el punto 1).
        
        3). Implemente los metodos:
        
            - double montoTotalSolicitado();
        
                - devuelve el monto total del subsidio:
        
                    // Monto_total_subsidio_viajes = costo_pasaje + cantidad_dias * dias_viaje.
                    // Monto_total_subsidio_bien = sumatoria (costo_bien_i * cantidad_bien_i).
        
            - String toString();
                    
                - devuelve un string con los detalles del subsidio:
                    
                    // nombre del investigador, plan de trabajo, la fecha, monto total y el item más caro:
                    viaje o la estadía en un tipo de subsidio o el item más caro en el otro.
        
        4). Escriba un programa principal que instancie dos subsidios (uno de cada tipo), establezca todos los
        datos necesarios para cada uno de ellos y luego muestre por consola la descripción de cada uno.
     */
    }
    
}
