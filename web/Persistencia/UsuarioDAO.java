package Persistencia;

import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UsuarioDAO {

    public ResultSet lecturaUsuarios() throws ClassNotFoundException, SQLException {
        Conexion c = new Conexion();
        Connection ctn = c.Conectar();

        Statement s = ctn.createStatement();
        String query = "SELECT * FROM usuario";
        ResultSet rs = s.executeQuery(query);

        return rs;
        /*
        while (rs.next()) {
            String idUsuario = rs.getString(1);
            String nombre = rs.getString(2);
            String apPaterno = rs.getString(3);
            String apMaterno = rs.getString(4);
            String col = rs.getString(5);
            String calle = rs.getString(6);
            String noCalle = rs.getString(7);
            String Tel = rs.getString(8);

            System.out.println("ID usuario = " + idUsuario + " , Nombre = "
                    + nombre + " , A. Paterno = " + apPaterno + " , A. Materno = "
                    + apMaterno + " , Colonia = " + col + " , Calle = " + calle + " , No.Calle = "
                    + noCalle + " , Teléfono = " + Tel + "\n");
        }
        */
    }

    //Pendiente
    public void buscarUsuarioPorId(int id) throws ClassNotFoundException, SQLException {
        Conexion c = new Conexion();
        Connection ctn = c.Conectar();

        Statement s = ctn.createStatement();
        String query = "SELECT * FROM usuario WHERE idusuario='" + id + "'";
        ResultSet rs = s.executeQuery(query);

        while (rs.next()) {
            String idUsuario = rs.getString(1);
            String nombre = rs.getString(2);
            String apPaterno = rs.getString(3);
            String apMaterno = rs.getString(4);
            String col = rs.getString(5);
            String calle = rs.getString(6);
            String noCalle = rs.getString(7);
            String Tel = rs.getString(8);

            System.out.println("ID usuario = " + idUsuario + " , Nombre = "
                    + nombre + " , A. Paterno = " + apPaterno + " , A. Materno = "
                    + apMaterno + " , Colonia = " + col + " , Calle = " + calle + " , No.Calle = "
                    + noCalle + " , Teléfono = " + Tel + "\n");
        }
    }

    //Método para ingresar usuario
    public void insertarUsuario(Usuario usuario) throws ClassNotFoundException, SQLException {
        Conexion c = new Conexion();
        Connection ctn = c.Conectar();
        
        String insertar = "INSERT INTO usuario (nombre,apPaterno,apMaterno,col,calle,noCalle,Tel) "
        + "VALUES ('"+usuario.getNombre()+"' , '"+usuario.getApPaterno()+"' , '"+usuario.getApMaterno()+"' , '"
        +usuario.getCol()+"' , '"+usuario.getCalle()+"' , "+usuario.getNoCalle()+" , '"+usuario.getTel()+"')";
        
        PreparedStatement stm = ctn.prepareStatement(insertar);
        //stm.executeUpdate();
        if (stm.executeUpdate()==1) {
            System.out.println("Usuario Agregado");
        } else System.out.println("Error al Registrar");
    }
    
    //Método de modificar usuario según su ID
    public void modificarUsuario(int id, Usuario usuario) throws ClassNotFoundException, SQLException{
        Conexion c = new Conexion();
        Connection ctn = c.Conectar();
        
        String modificar = "UPDATE usuario SET nombre='"+usuario.getNombre()+"' , apPaterno='"
        +usuario.getApPaterno()+"' , apMaterno='"+usuario.getApMaterno()+"' , col='"
        +usuario.getCol()+"' , calle='"+usuario.getCalle()+"' , noCalle="+usuario.getNoCalle()+
        " , Tel='"+usuario.getTel()+"' WHERE idusuario='"+id+"'";
        
        PreparedStatement stm = ctn.prepareStatement(modificar);
        if (stm.executeUpdate()==1){
            System.out.println("Usuario Modificado");
        } else System.out.println("Error al modificar");
    }
    
    //Método para la eliminación de un usuario según ID
    public void eliminarUsuario(int id) throws SQLException, ClassNotFoundException{
        Conexion c = new Conexion();
        Connection ctn = c.Conectar();
        
        String eliminar = "DELETE FROM usuario WHERE idusuario='"+id+"'";
        
        PreparedStatement stm = ctn.prepareStatement(eliminar);
        if(stm.executeUpdate()==1){
            System.out.println("Usuario eliminado");
        } else System.out.println("Error al eliminar");
    }
}