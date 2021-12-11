/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.ArrayList;

public class Carrito {
    
    public static ArrayList<Producto>  agregarCar(int id, String nombre, String img, String relleno, String cobertura, String pan, String mensaje, boolean tresLeches, double peso, String tipo, double precio){
        ArrayList<Producto> carProductos = new ArrayList();
        Producto p = new Producto(id, nombre, img, relleno, cobertura, pan, mensaje, tresLeches, peso, tipo, precio);
        p.setCant(1);
        carProductos.add(p);
        return carProductos;
    }
}
