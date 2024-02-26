
package Parcial_Espectador;

public class Enunciado {

    public static void main(String[] args) {
        /* 1.
        
        a). Genere una clase para representar espectadores, que se caracterizan por nombre, DNI y edad.
        Incorpore getters y setters, y un constructor que permita iniciar el espectador con un nombre, 
        DNI y edad recibida.
        
        b). Generar una clase para representar funciones de teatro. Una función de teatro se caracteriza
        por mantener: Titulo, Fecha, Hora, una estructura que representa la sala (20 filas y 10 butacas por fila)
        que almacenará los espectadores registrados para la función, y una estructura que almacena para cada fila 
        la cantidad de butacas ocupadas.
        
            i- Defina métodos getters/ setters para los atributos que considere adecuado.
        
            ii- Implemente un constructor que inicie la función de teatro con un titulo, 
            fecha y hora recibidos por parámetro. La sala inicialmente debe estar vacía.
            
            iii- – Incorpore los siguientes métodos:
                    
                    - validarFila: recibe un nro. “F” y devuelve un boolean que indica si “F” es un nro. de fila valida
                    o no.
        
                    - hayButacaLibreEnFila: recibe un nro. de fila valido “F” y devuelve un boolean que indica si hay 
                    una butaca libre en la fila “F” o no.
        
                    - agregarEspectadorAFila: recibe un nro. de fila valido “F” y un espectador  “E”, y agregar a “E” en
                    la primer butaca libre de la fila “F”, debiendo retornar el nro. de butaca asignado.
        
                    - calcularBuracasLibres: calcula y devuelve la cantidad total de butacas libres para la función.
        
                    - calcularEdadPromEspectadores: calcula y devuelve la edad promedio de los espectadores registrados.
        
                    - estaRegistradoEspectador: recibe un nro. de DNI “D” y devuelve un boolean que indica si existe un
                    espectador registrado en la sala con DNI igual a “D”.
        
        2. Escriba un programa que instancie una función de teatro para la obra “Cazafantasmas” con hora “20:00” y fecha
        “22-10-2018”. Luego simule la venta de localidades de la siguiente manera. Leer DNI de personas hasta ingresar el
        0 o hasta que no queden butacas libres para la función. A la persona se le solicita además nombre, edad, y el nro.
        de fila que prefiere. En caso que el nro. de fila sea válido, exista una butaca libre en esa fila y no exista un
        espectador registrado en la función con ese DNI, agregar a la persona como espectador en la fila solicitada e
        imprimir el nro. de butaca asignado. Caso contrario, informar el error correspondiente. Al finalizar la venta
        informar la cantidad de butacas libres y edad promedio de los espectadores registrados para la función.
        
        */
    }
    
}
