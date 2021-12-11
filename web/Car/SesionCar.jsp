<%@page import="Dao.ProductoDao"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%  
    if (session.getAttribute("Carro") == null) {
         List<Producto> lista = new ArrayList<Producto>();
         if(request.getParameter("id")!=null){
             List<Producto> listaP = ProductoDao.getProductos();
             for(Producto cp: listaP){
                 if(String.valueOf(cp.getId()).equals(request.getParameter("id"))){
                     cp.setCant(1);
                     lista.add(cp);
                 }
             }
             session.setAttribute("Carro", lista);
         }
     }else if(request.getParameter("id")!=null){
             List<Producto> lista = (List<Producto>) session.getAttribute("Carro");
             List<Producto> listaP = ProductoDao.getProductos();
             for(Producto cp: listaP){
                 if(String.valueOf(cp.getId()).equals(request.getParameter("id"))){
                     cp.setCant(1);
                     lista.add(cp);
                 }
             }
             session.setAttribute("Carro", lista);                  
   }
   
%>
