package Modelo;

public class Usuario {

    private int idusuario;
    private String nombre;
    private String apPaterno;
    private String apMaterno;
    private String col;
    private String calle;
    private int noCalle;
    private String Tel;

    //Contructor
    public Usuario(int idusuario, String nombre, String apPaterno, String apMaterno, String col, String calle, int noCalle, String Tel) {
        this.idusuario = idusuario;
        this.nombre = nombre;
        this.apPaterno = apPaterno;
        this.apMaterno = apMaterno;
        this.col = col;
        this.calle = calle;
        this.noCalle = noCalle;
        this.Tel = Tel;
    }
    
    //Set's y Get's
    public int getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApPaterno() {
        return apPaterno;
    }

    public void setApPaterno(String apPaterno) {
        this.apPaterno = apPaterno;
    }

    public String getApMaterno() {
        return apMaterno;
    }

    public void setApMaterno(String apMaterno) {
        this.apMaterno = apMaterno;
    }

    public String getCol() {
        return col;
    }

    public void setCol(String col) {
        this.col = col;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getNoCalle() {
        return noCalle;
    }

    public void setNoCalle(int noCalle) {
        this.noCalle = noCalle;
    }

    public String getTel() {
        return Tel;
    }

    public void setTel(String Tel) {
        this.Tel = Tel;
    }
    
    //toString

    @Override
    public String toString() {
        return "Usuario{" + "idusuario=" + idusuario + ", nombre=" + nombre + ", apPaterno=" + apPaterno + ", apMaterno=" + apMaterno + ", col=" + col + ", calle=" + calle + ", noCalle=" + noCalle + ", Tel=" + Tel + '}';
    }
}
