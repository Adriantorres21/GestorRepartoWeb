/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    static Connection contacto = null;
    //mysql
    private static String driver = "com.mysql.jdbc.Driver";
    private static String cadenaConeccion ="jdbc:mysql://localhost/pasteleria";
    private static String usuario="root";
    private static String contra="";
    public static Connection conMysql;
    
    public static Connection getConexionMysql(){
        try{
            Class.forName(driver);
            conMysql =(Connection) DriverManager.getConnection(cadenaConeccion, usuario, contra);
            System.out.println("Conexion mysql exitosa");
        }catch(Exception e){
            System.out.println(e);
        }
        return conMysql;
    }
    public static void main(String[] args) {
        try {
            Connection conn = Conexion.getConexionMysql();
            conn.close();
        } catch (Exception e) {
           
        }
    }
}