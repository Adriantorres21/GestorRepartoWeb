/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection;
import Modelo.Producto;
import Persistencia.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adrian
 */
public class ProductoDao {
    static Statement st;
    static PreparedStatement ps;
    static ResultSet rs;
    static Connection cn;
    
    public static List<Producto> getProductos() {
        
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT * FROM productos";
        try {
            cn = Conexion.getConexionMysql();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                Producto tempProd = new Producto(rs.getInt("idProducto"),
                        rs.getString("nombre"),
                        rs.getBinaryStream("img"),
                        rs.getString("relleno"),
                        rs.getString("cobertura"),
                        rs.getString("pan"),
                        rs.getString("mensaje"),
                        rs.getBoolean("tresLeches"),
                        rs.getDouble("peso"),
                        rs.getString("tipo"),
                        rs.getDouble("precio"));
                productos.add(tempProd);
            }
        } catch (Exception e) {
            System.out.print(e);
        }
        return productos;
    }
    
    public static void listarImg(int id, HttpServletResponse response){
        String sql = "SELECT * FROM productos WHERE idProducto = "+id;
        InputStream inputStream=null;
        OutputStream outputStream=null;
        BufferedInputStream bufferedInputStream=null;
        BufferedOutputStream bufferedOutputStream=null;
        response.setContentType("image/");
        try{
           outputStream=response.getOutputStream();
           cn=Conexion.getConexionMysql();
           ps=cn.prepareStatement(sql);
           rs=ps.executeQuery();
           if(rs.next()){
               inputStream = rs.getBinaryStream("img");
           }
           bufferedInputStream = new BufferedInputStream(inputStream);
           bufferedOutputStream = new BufferedOutputStream(outputStream);
           int i = 0;
           while((i=bufferedInputStream.read())!=-1){
               bufferedOutputStream.write(i);
           }
           inputStream.close();
           outputStream.close();
           bufferedInputStream.close();
        }catch(Exception e){
            
        }
    }
//    public static void main(String[] args){
//        try {
//            ProductoDao p = new ProductoDao();
//            
//            List<Producto> productos = p.getProductos();
//            
//            for(Producto prod: productos){
//                System.out.println(prod.getId());
//            }
//        } catch (Exception ex) {
//            System.out.println(ex);
//        }
//    }
}
