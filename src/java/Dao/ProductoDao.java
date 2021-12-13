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

    public static boolean listarImg(int id, HttpServletResponse response) {
        String sql = "SELECT * FROM productos WHERE idProducto = " + id;
        boolean imgB = false;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/");
        try {
            outputStream = response.getOutputStream();
            cn = Conexion.getConexionMysql();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("img");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
            inputStream.close();
            outputStream.close();
            bufferedInputStream.close();
        } catch (Exception e) {

        }
        return imgB;
    }

    public static void edit(Producto pro) {
        String sql = "update productos set "
                + "nombre= ?,"
                + "img=?,"
                + "relleno=?,"
                + "cobertura=?,"
                + "pan=?,"
                + "mensaje=?,"
                + "tresLeches=?,"
                + "peso=?,"
                + "tipo=?,"
                + "precio=?"
                + "where idProducto=" + pro.getId();
        try {
            cn = Conexion.getConexionMysql();
            ps = cn.prepareStatement(sql);
            ps.setString(1, pro.getNombre());
            ps.setBlob(2, pro.getImg());
            ps.setString(3, pro.getRelleno());
            ps.setString(4, pro.getCobertura());
            ps.setString(5, pro.getPan());
            ps.setString(6, pro.getMensaje());
            ps.setBoolean(7, pro.isTresLeches());
            ps.setDouble(8, pro.getPeso());
            ps.setString(9, pro.getTipo());
            ps.setDouble(10, pro.getPrecio());

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void add(Producto pro) {
        String sql = "INSERT INTO productos(idProducto, nombre, \n"
                + "img, relleno, cobertura, pan, mensaje, \n"
                + "tresLeches, peso, tipo, precio) \n"
                + "VALUES (NULL,?,NULL,?,?,?,?,?,?,?,?)";
        try {
            cn = Conexion.getConexionMysql();
            ps = cn.prepareStatement(sql);
            ps.setString(1, pro.getNombre());
            ps.setString(2, pro.getRelleno());
            ps.setString(3, pro.getCobertura());
            ps.setString(4, pro.getPan());
            ps.setString(5, pro.getMensaje());
            ps.setBoolean(6, pro.isTresLeches());
            ps.setDouble(7, pro.getPeso());
            ps.setString(8, pro.getTipo());
            ps.setDouble(9, pro.getPrecio());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static boolean delete(int id) {
        String sql = "delete from productos where idProducto= ?";
        try{
            cn=Conexion.getConexionMysql();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch(Exception e){ 
            System.out.println(e);
        }return false;
    }
    
    public static Producto verProducto(int id) {
        String sql = "select * from productos where idProducto=" + id;
        Producto p = new Producto();
        try {
            cn = Conexion.getConexionMysql();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt("idProducto"));
                p.setNombre(rs.getString("nombre"));
                p.setImg(rs.getBinaryStream("img"));
                p.setRelleno(rs.getString("relleno"));
                p.setCobertura(rs.getString("cobertura"));
                p.setPan(rs.getString("pan"));
                p.setMensaje(rs.getString("mensaje"));
                p.setTresLeches(rs.getBoolean("tresLeches"));
                p.setPeso(rs.getDouble("peso"));
                p.setTipo(rs.getString("tipo"));
                p.setPrecio(rs.getDouble("precio"));
            }
        } catch (Exception e) {
        }
        return p;
    }

    public static void main(String[] args) {
        try {
            
            ProductoDao.delete(4);
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
