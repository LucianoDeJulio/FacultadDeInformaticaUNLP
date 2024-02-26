
package Parcial11;

public class Jugador  extends Persona{
    private int edad;
    private String habilidades;

    public Jugador(int edad, String habilidades, String nombre, int dni, double sueldo_basico) {
        super(nombre, dni, sueldo_basico);
        this.edad = edad;
        this.habilidades = habilidades;
    }

    public Jugador() {
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getHabilidades() {
        return habilidades;
    }

    public void setHabilidades(String habilidades) {
        this.habilidades = habilidades;
    }
    
    public double calcularSueldo(){
        if(this.getEdad()> 30){
            return (this.getSueldo_basico()-((this.getSueldo_basico()*10)/100));
        }else
            return this.getSueldo_basico();
    }
    
}
