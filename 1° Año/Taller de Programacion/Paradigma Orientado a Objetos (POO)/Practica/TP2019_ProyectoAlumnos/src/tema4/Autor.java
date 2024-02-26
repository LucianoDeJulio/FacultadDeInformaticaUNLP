
package tema4;

public class Autor {
    private String Nombre;
    private String Bio;

    public Autor(String Nombre, String Bio) {
        this.Nombre = Nombre;
        this.Bio = Bio;
    }
    
    public Autor (){
  
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getBio() {
        return Bio;
    }

    public void setBio(String Bio) {
        this.Bio = Bio;
    }
    
}
