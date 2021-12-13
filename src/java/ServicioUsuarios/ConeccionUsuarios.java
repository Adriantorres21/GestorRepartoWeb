/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ServicioUsuarios;

import Modelo.Usuario;
import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLConnection;
import java.util.regex.Pattern;

/**
 *
 * @author Adrian
 */
public class ConeccionUsuarios {
    
    public static String setUsers(String nombre, String apPaterno, String apMaterno, String col, String calle,String noCalle,String tel, int rol, String cuenta, String pass) {
        String URL_svc = "http://localhost/ServicioPedido/Controlador/UsuarioControl.php?accion=Agregar&nombre="
                +nombre+"&apP="+apPaterno+"&apM="+apMaterno+"&col="+col
                +"&calle="+calle+"&noC="+noCalle+"&tel="+tel+"&rol="+rol
                +"&cuenta="+cuenta+"&pass="+pass;
        String u = null;
        try {
            URL url = new URL(URL_svc);
            URLConnection con = url.openConnection();

            //Lectura
            Reader r = new InputStreamReader(con.getInputStream());
            BufferedReader br = new BufferedReader(r);

            String linea, json = "";
            while ((linea = br.readLine()) != null) {
                json += linea;
            }
           
            br.close();
            System.out.println(json);
            u=json;

        } catch (Exception e) {
            System.out.println(e);
        }
        return u;
    }
    
    public static Usuario[] getUsers() {
        String URL_svc = "http://localhost/ServicioPedido/Controlador/UsuarioControl.php?accion=Listar";
        Gson gson = new Gson();
        Usuario[] us = null;
        try {
            URL url = new URL(URL_svc);
            URLConnection con = url.openConnection();

            //Lectura
            Reader r = new InputStreamReader(con.getInputStream());
            BufferedReader br = new BufferedReader(r);

            String linea, json = "";
            String patron = "\"[0-9]+\":";
            while ((linea = br.readLine()) != null) {
                json += linea;
            }
            Pattern p1 = Pattern.compile(patron);
            json = json.substring(5, json.length() - 1);
            String[] items = p1.split(json);
            json = "";
            for (String s : items) {
                json += s;
            }
            json = "[" + json + "]";
            br.close();
//            System.out.println(json);
            us = new Gson().fromJson(json, Usuario[].class);

        } catch (Exception e) {
            System.out.println(e);
        }
        return us;
    }

    public static void main(String[] args) {
//        Usuario[] prueba = getUsers();
//        
//        for(Usuario u: prueba){
//            System.out.println(u.getIdR());
//        }
            setUsers("Hola", "Torres", "Gama", "Col", "Sabe", "123", "4771234567", 1, "sabe@gmail.com", "12345");
    }
}
