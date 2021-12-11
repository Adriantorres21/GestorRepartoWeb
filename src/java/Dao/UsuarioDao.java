/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Producto;
import Modelo.Usuario;
import Persistencia.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Adrian
 */
public class UsuarioDao {
    
    Connection cn = Conexion.getConexionMysql();
    List<Producto> productos = new ArrayList<>();
    Statement st;
    ResultSet rs;
    PreparedStatement pst = null;
    
    public static int registrarUsuario(Usuario u) throws Exception{
        String sql = "INSERT INTO usuario(idusuario, nombre, apPaterno, "
                + "apMaterno, col, calle, noCalle, Tel) "
                + "VALUES (NULL,?,?,?,?,?,?,?)";
        int last = -1;
        Connection cn = Conexion.getConexionMysql();
        PreparedStatement pst = null;
        pst = cn.prepareStatement(sql);
        try{
            pst.setString(1, u.getNombre());
            pst.setString(2, u.getApP());
            pst.setString(3, u.getApM());
            pst.setString(4, u.getCol());
            pst.setString(5, u.getCalle());
            pst.setString(6, u.getNoC());
            pst.setString(7, u.getTel());
            pst.execute();
            pst = cn.prepareStatement("SELECT MAX(idusuario) AS id FROM usuario");
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                last = rs.getInt(1);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        
        return last;
    }
    
    public static void enlazarLogUser(int id, int rol, String usr, String pass) throws Exception{
        
        if(rol == 2){
            String sql = "INSERT INTO login(idlogin, idRol, "
                    + "cuenta, password, idUsuario) "
                    + "VALUES (NULL,?,?,?,?)";
            Connection cn = Conexion.getConexionMysql();
            PreparedStatement pst = null;
            pst = cn.prepareStatement(sql);
            try{
                pst.setInt(1, rol);
                pst.setString(2, usr);
                pst.setString(3, pass);
                pst.setInt(4, id);
                pst.execute();
            }catch(Exception e){
                System.out.println(e);
            }
        }else{
            
        }
    }
    public static void main(String[] args) throws Exception {
        Usuario u = new Usuario("Prueba","Prueba","Prueba","Col","Calle","123","4771234567");
        int id =  registrarUsuario(u);
        System.out.println(id);
        
        enlazarLogUser(id, id, "pPrueba@gmail.com", "12345");
        
    }
}
