/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Pedido;
import Modelo.PedidoProducto;
import Modelo.Producto;
import Persistencia.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class PedidoDao {
    
    public static int comprarPedido(Pedido ped) throws Exception{
        String sql = "INSERT INTO pedido (idPedido, idusuario, "
               + "fecha, total, costoEnvio, entregado, fechaEntrega) "
               + "VALUES (NULL, ?, ?, ?, ?, ?, ?);";
        int last = -1;
        Connection cn = Conexion.getConexionMysql();
        PreparedStatement pst = null;
        pst = cn.prepareStatement(sql);
        try{
            pst.setInt(1, ped.getIdUsuario());
            pst.setString(2, ped.getFecha());
            pst.setDouble(3, ped.getTotal());
            pst.setDouble(4, ped.getCostoEnvio());
            pst.setBoolean(5, ped.isEntregado());
            pst.setString(6, ped.getFechaEntrega());
            pst.execute();
            pst = cn.prepareStatement("SELECT MAX(idPedido) AS id FROM pedido");
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                last = rs.getInt(1);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        
        return last;
    }
    
    public static void enlazarProdPedido(int id, Producto p) throws Exception{
        
        if(p.getNombre() == "Custom"){
            String sql = "INSERT INTO pedido_producto(idPp, idPedido, idCustom, idProd) "
                    + "VALUES (NULL , ?, ?, NULL)";
            Connection cn = Conexion.getConexionMysql();
            PreparedStatement pst = null;
            pst = cn.prepareStatement(sql);
            try{
                pst.setInt(1, id);
                pst.setInt(2, p.getId());
                pst.execute();
            }catch(Exception e){
                System.out.println(e);
            }
        }else{
            String sql = "INSERT INTO pedido_producto(idPp, idPedido, idCustom, idProd) "
                + "VALUES (NULL , ?, NULL, ?)";
            Connection cn = Conexion.getConexionMysql();
            PreparedStatement pst = null;
            pst = cn.prepareStatement(sql);
            try{
                pst.setInt(1, id);
                pst.setInt(2, p.getId());
                pst.execute();
            }catch(Exception e){
                System.out.println(e);
            }
        }
    }
    
    public static List<PedidoProducto> getPedidoProd(int id) throws Exception{
        Connection cn = Conexion.getConexionMysql();
        List<PedidoProducto> pp = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs;
        
        String sql = "SELECT p.idPedido, p.fecha,p.fechaEntrega,p.entregado " +
                        ",pr.nombre,pr.relleno,pr.cobertura, " +
                        "pr.pan, pr.tresLeches,pr.peso,pr.tipo,pr.precio " +
                        ",p.total " +
                        "FROM usuario u INNER JOIN pedido p  " +
                        "ON p.idusuario = u.idusuario " +
                        "INNER JOIN pedido_producto pp " +
                        "ON pp.idPedido = p.idPedido " +
                        "INNER JOIN productos pr " +
                        "ON pr.idProducto = pp.idProd " +
                        "WHERE u.idusuario = ? ORDER BY P.fecha DESC";
        
        pst = cn.prepareStatement(sql);
        try{
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while(rs.next()){
                PedidoProducto tempProd = new PedidoProducto();
                tempProd.setIdPedido(rs.getInt(1));
                tempProd.setFecha(rs.getString(2));
                tempProd.setFechaEn(rs.getString(3));
                tempProd.setEntregador(rs.getBoolean(4));
                tempProd.setNombre(rs.getString(5));
                tempProd.setRelleno(rs.getString(6));
                tempProd.setCobertura(rs.getString(7));
                tempProd.setPan(rs.getString(8));
                tempProd.setTresLeches(rs.getBoolean(9));
                tempProd.setPeso(rs.getDouble(10));
                tempProd.setTipo(rs.getString(11));
                tempProd.setPrecio(rs.getDouble(12));
                tempProd.setTotal(rs.getDouble(13));
                pp.add(tempProd);
            }
        }catch(Exception e){
            System.out.println(e);
        }
        return pp;
    }
}
