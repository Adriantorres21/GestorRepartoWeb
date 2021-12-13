<%@page import="Dao.ProductoDao"%>
<%@page import="java.io.InputStream"%>
<%@page import="Modelo.Producto"%>
<%
    
    Producto p =  new Producto();
    String nombre = request.getParameter("nombre");
    //Part parte = request.getPart("img") ;
    //InputStream img = parte.getInputStream();
    InputStream img = null;
    String relleno = request.getParameter("relleno");
    String cobertura = request.getParameter("cobertura");
    String pan = request.getParameter("pan");
    String msj = request.getParameter("msj");
    String tl = request.getParameter("tL");
    boolean t = false;
    double peso = Double.parseDouble(String.valueOf(request.getParameter("peso")));
    String tipo = request.getParameter("tipo");
    double precio = Double.parseDouble(String.valueOf(request.getParameter("precio")));
    if(tl!=null){
        t=true;
    }
    p.setNombre(nombre);
    p.setRelleno(relleno);
    p.setCobertura(cobertura);
    p.setPan(pan);
    p.setMensaje(msj);
    p.setTresLeches(t);
    p.setTipo(tipo);
    p.setPeso(peso);
    p.setPrecio(precio);
    out.print(p);
    ProductoDao.add(p);
    response.sendRedirect("../Vista/Admin/Productos.jsp");
%>

