<%@page import="Modelo.Producto"%>
<%@page import="Dao.ProductoDao"%>
<%@page import="java.io.InputStream"%>
<%
    Producto p =  new Producto();
    int idp = Integer.parseInt(String.valueOf(request.getParameter("IdProducto")));
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
    
    if (img == null) {
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
    response.sendRedirect("../Vista/Admin/Productos.jsp");
%>
