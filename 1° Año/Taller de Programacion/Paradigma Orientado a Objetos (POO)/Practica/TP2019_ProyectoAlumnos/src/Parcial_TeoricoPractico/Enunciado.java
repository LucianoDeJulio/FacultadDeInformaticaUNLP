
package Parcial_TeoricoPractico;


public class Enunciado {

    public static void main(String[] args) {
        /* 1- Representar los sig. tipos de finales: teorico y teorico-practico.
        
        - Los finales teoricos se caracterizan por mantener: nombre del alumno, fecha y una estructura que almacena el resultado
        (true: "bien", false: "mal") para cada una de sus 5 preguntas (numeradas de 1 a 5).
        
        - Los finales terico-practicos son finales teoricos que tienen ademas un puntaje practico (nro. entre 0 y 5).
        
        A). Realice el modelo de clases. Implemente las clases con sus atributos y metodos para obtener/modificar el valor de
        aquellos que considere adecuado.
        
        B). Implemente un constructor para los finales teoricos que reciba datos para iniciar nombre y fecha; y un constructor
        para los finales teorico-practicos que reciba datos para iniciar nombre, fecha y puntaje practico.
        
        C). Ambos tipos de finales deben responde a los mensajes:
        
            - cargarResultadoPregunta: recibe un nro. de pregunta valido y su resultado, y carga el resultado en la estructura.
            - verResultadoPregunta: recibe un nro. de pregunta valido y retorna su resultado.
        
        D). Ambos tipos de finales deben responder al mensaje calcularNotaFinal que retorna un nro. segun se indica:
        
            - En los finales teoricos, la nota final se obtiene de sumar 2 puntos por cada pregunta con resultado "bien".
            - En los finales teoricos-practicos, la nota final se obtiene de la formula:
        
                                     (nota final del teorico/2) + puntaje practico
        
        E). Ambos tipos de finales deben responder al mensaje estaAprobado que retorna un boolean segun se indica:
            
            - Los finales teoricos se aprueban cuando su nota final es superior a 4.
            - Los finales teorico-practicos se aprueban cuando su nota final es superior a 6.
        
        F). Ambos tipos de finales deben responder al mensaje toString que retorna un String con el formato:
            
            "Alumno: N - Nota Final: X - ¿Aprobo?: Y", donde N es el nombre, X es la nota final e Y indica si aprobo o no.
        
        2- Realice un programa que instancie un final teorico de "Norma Garcia" con fecha "22/10/2018". Leer desde teclado el
        resultado para las 5 preguntas y cargarlas a este final. Luego instancie un final teorico-practico de "Pablo Perez" con
        fecha "22/10/2018" y puntaje practico leido desde teclado. Cargue de manera similar el resultado para las 5 preguntas.
        Al finalizar imprima la representacion de cada final.
        */
    }
    
}
