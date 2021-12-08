/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import java.sql.Connection;
import Modelo.Producto;
import Persistencia.Conexion;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Adrian
 */
public class ProductoDao {

    public static List<Producto> getProductos() throws Exception{
        Connection cn = Conexion.getConexionMysql();
        List<Producto> productos = new ArrayList<>();
        
        Statement st;
        ResultSet rs;
        
        String sql = "SELECT * FROM productos";
        st=cn.createStatement();
        
        rs = st.executeQuery(sql);
        
        while(rs.next()){
            Producto tempProd = new Producto(rs.getInt("idProducto"),
                                            rs.getString("nombre"),
                                            rs.getString("img"),
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
        
        return productos;
    }
//    public static void main(String[] args) {
//        try {
//            ProductoDao p = new ProductoDao();
//            
//            List<Producto> productos = p.getProductos();
//            
//            for(Producto prod: productos){
//                System.out.println(prod);
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//                
//    }
}
