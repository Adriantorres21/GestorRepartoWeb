/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Adrian
 */
public class Usuario {
    private int id;
    private String nombre;
    private String apP;
    private String apM;
    private String col;
    private String calle;
    private String noC;
    private String tel;

    public Usuario(String nombre, String apP, String apM, String col, String calle, String noC, String tel) {
        this.nombre = nombre;
        this.apP = apP;
        this.apM = apM;
        this.col = col;
        this.calle = calle;
        this.noC = noC;
        this.tel = tel;
    }

    public Usuario() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApP() {
        return apP;
    }

    public void setApP(String apP) {
        this.apP = apP;
    }

    public String getApM() {
        return apM;
    }

    public void setApM(String apM) {
        this.apM = apM;
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

    public String getNoC() {
        return noC;
    }

    public void setNoC(String noC) {
        this.noC = noC;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
 
}