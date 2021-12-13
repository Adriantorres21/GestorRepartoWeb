package Control;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Dao.ProductoDao;
import Modelo.Producto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Adrian
 */
@MultipartConfig
@WebServlet(urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        Producto p = new Producto();
        List<Producto> lista = ProductoDao.getProductos();
        
        switch (accion) {
            case "Listar":
                
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("Vista/index.jsp").forward(request, response);
                break;
            case "editar":
                int id = Integer.parseInt(String.valueOf(request.getParameter("idP")));
                p = ProductoDao.verProducto(id);
                request.setAttribute("ProductoEditar", p);
                request.getRequestDispatcher("Vista/Admin/EditarP.jsp").forward(request, response);
                break;
            case "agregarEdit":
                
                int idp = Integer.parseInt(String.valueOf(request.getParameter("IdProducto")));
                String nombre = request.getParameter("nombre");
                Part parte = request.getPart("img") ;
                InputStream img = parte.getInputStream();
                String relleno  = request.getParameter("relleno");
                String cobertura  = request.getParameter("cobertura");
                String pan  = request.getParameter("pan");
                String msj  = request.getParameter("msj");
                String tl  = request.getParameter("tL");
                boolean t = false;
                double peso  = Double.parseDouble(request.getParameter("peso"));
                String tipo  = request.getParameter("tipo");
                double precio  = Double.parseDouble(request.getParameter("precio"));
                if(tl.equals("1")){
                   t = true; 
                }
                if(img == null){
                    img = ProductoDao.verProducto(idp).getImg();
                }
                p.setId(idp);
                p.setNombre(nombre);
                p.setImg(img);
                p.setRelleno(relleno);
                p.setCobertura(cobertura);
                p.setPan(pan);
                p.setMensaje(msj);
                p.setTresLeches(t);
                p.setTipo(tipo);
                p.setPeso(peso);
                p.setPrecio(precio);
                ProductoDao.edit(p);
                response.sendRedirect("Vista/Admin/Productos.jsp");
                break;
            default:
                request.getRequestDispatcher("Controller?accion=Listar").forward(request, response);
                break;
        }
    }

}
