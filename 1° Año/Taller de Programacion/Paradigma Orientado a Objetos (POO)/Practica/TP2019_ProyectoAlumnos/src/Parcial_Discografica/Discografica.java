
package Parcial_Discografica;

public class Discografica {
    private String nombreD;
    private String ciudad;
    private String nomDueño;
    private int dimFS;
    private int dimFB;
    private int dimLS;
    private int dimLB;
    private Solista [] solistas;
    private Bandas [] bandas;

    public Discografica(String nombreD, String ciudad, String nomDueño) {
        this.nombreD = nombreD;
        this.ciudad = ciudad;
        this.nomDueño = nomDueño;
        this.dimFS = 50;
        this.dimFB = 50;
        this.dimLS = 0;
        this.dimLB = 0;
        this.solistas = new Solista [this.dimFS];
        this.bandas = new Bandas [this.dimFB];
    }

    public Discografica() {
    }

    public String getNombreD() {
        return nombreD;
    }

    public void setNombreD(String nombreD) {
        this.nombreD = nombreD;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getNomDueño() {
        return nomDueño;
    }

    public void setNomDueño(String nomDueño) {
        this.nomDueño = nomDueño;
    }

    public int getDimFS() {
        return dimFS;
    }

    public int getDimFB() {
        return dimFB;
    }

    public int getDimLB() {
        return dimLB;
    }
    
    public void agregarSolista(Solista unS){
        if(this.dimLS < this.dimFS){
            this.solistas[this.dimLS] = unS;
            this.dimLS++;
        }
    }
    
    public void agregarBanda(Bandas unaB){
        if(this.dimLB < this.dimFB){
            this.bandas[this.dimLB] = unaB;
            this.dimLB++;
        }
    }
    
    public int cantidadBandas(){
        return this.dimLB;
    }
    
    public int cantSolistaInstrumento (String unI){
        int i,cant=0;
        for(i=0;i < this.dimLS; i++){
            if(this.solistas[i].getInstrumento().equals(unI)){
                cant++;
            }
        }
        return cant;
    }
    
    public String bandaMasIntegrantes(){
        int i, max = 0, max1;
        String bandaMax = " ";
        for(i=0; i < this.dimLB; i++){
            max1 = this.bandas[i].getCantIntegrantes();
            if(max1 > max){
                max = max1;
                bandaMax = this.bandas[i].getNombreB();
            }
        }
        return bandaMax;
    }
    
    public int bandaMismaCiudad (){
        int i, cant=0;
        for(i=0; i< this.dimLB; i++){
            if(this.bandas[i].getCiuFormacion().equals(this.ciudad)){
                cant++;
            }
        }
        return cant;
    }
    
}
