package Persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    public Connection Conectar() throws ClassNotFoundException {
        String url = "jdbc:mysql://localhost/pasteleriakaren";
        String usuario = "root";
        String password = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conectar = DriverManager.getConnection(url, usuario, password);
            //System.out.println("Conexión Exitosa");
            return conectar;
        } catch (SQLException ex) {
            System.out.println("Error al abrir Conexión: " + ex.getMessage());
        }
        return null;
    }
}