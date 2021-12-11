
package Modelo;

public class Producto {
    private int id;
    private String nombre;
    private String img;
    private String relleno;
    private String cobertura;
    private String pan;
    private String mensaje;
    private boolean tresLeches;
    private double peso;
    private String tipo;
    private double precio;
    private int cant;

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public Producto(int id, String nombre, String img, String relleno, String cobertura, String pan, String mensaje, boolean tresLeches, double peso, String tipo, double precio) {
        this.id = id;
        this.nombre = nombre;
        this.img = img;
        this.relleno = relleno;
        this.cobertura = cobertura;
        this.pan = pan;
        this.mensaje = mensaje;
        this.tresLeches = tresLeches;
        this.peso = peso;
        this.tipo = tipo;
        this.precio = precio;
    }
    
    public int getId() {
        return id;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getRelleno() {
        return relleno;
    }

    public void setRelleno(String relleno) {
        this.relleno = relleno;
    }

    public String getCobertura() {
        return cobertura;
    }

    public void setCobertura(String cobertura) {
        this.cobertura = cobertura;
    }

    public String getPan() {
        return pan;
    }

    public void setPan(String pan) {
        this.pan = pan;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public boolean isTresLeches() {
        return tresLeches;
    }

    public void setTresLeches(boolean tresLeches) {
        this.tresLeches = tresLeches;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Producto{" + "nombre=" + nombre + ", img=" + img + ", relleno=" + relleno + ", cobertura=" + cobertura + ", pan=" + pan + ", mensaje=" + mensaje + ", tresLeches=" + tresLeches + ", peso=" + peso + ", tipo=" + tipo + ", precio=" + precio + '}';
    }
    
    
}
