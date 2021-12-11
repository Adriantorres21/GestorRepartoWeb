/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package LoginService;

import Persistencia.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Adrian
 */

public class Login{
    private static Login log;
    private static String sql = "SELECT l.idRol ,u.idusuario, u.nombre FROM usuario u " +
                         " INNER JOIN login l" +
                         " ON u.idusuario = l.idUsuario" +
                         " WHERE l.cuenta = ?" +
                         " AND l.password = ?";
    private static String usr;
    private static String psw;

    private Login (){     
    }
    
    public static Login getInstance(){
        if(log == null){
            log = new Login();
        }
        return log;
    }
   
    public String getUsr() {
        return usr;
    }

    public void setUsr(String usr) {
        this.usr = usr;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }
    
    public List<String> verificarCuenta(){
        List<String> us = new ArrayList<String>();
        try{
            Connection cn = Conexion.getConexionMysql();
            PreparedStatement pst = null;
            pst = cn.prepareStatement(sql);
            pst.setString(1, usr);
            pst.setString(2, psw);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                System.out.println("Si existe");
                us.add(rs.getString(1));
                us.add(rs.getString(2));
                us.add(rs.getString(3));
            }else{
                System.out.println("No existe");
            }
             
        }catch(Exception e){
            System.out.println(e);
        }
        return us;
    }
//    public static void main(String[] args) {
//        Login log = Login.getInstance();
//        String usr = "mpadilla@gmail.com";
//        String psw = "12345";
//        List<String> ss = new ArrayList<String>();
//        
//        log.setUsr(usr);
//        log.setPsw(psw);
//        for(String ej : log.verificarCuenta() ){
//            System.out.println(ej);
//        }
//        
//    }
}