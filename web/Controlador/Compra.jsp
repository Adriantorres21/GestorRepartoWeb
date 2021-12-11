<%@page import="java.time.LocalDateTime"%>
<%@page import="Modelo.PedidoProducto"%>
<%@page import="Modelo.Producto"%>
<%@page import="Dao.PedidoDao"%>
<%@page import="Modelo.Pedido"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<% 
    String accion = request.getParameter("accion");
    if(accion.equals("compra") && session.getAttribute("Cuenta")!=null && session.getAttribute("ID")!=null){  
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime today = LocalDateTime.now(); 
        String hoyF = dtf.format(LocalDateTime.now());
        String mF = dtf.format(today.plusDays(1));
        
        double total = Double.parseDouble(String.valueOf(request.getParameter("total")));
        List<Producto> lista = (List<Producto>) session.getAttribute("Carro");
        
        int idUsr = Integer.parseInt(String.valueOf(session.getAttribute("ID")));
        
        Pedido ped = new Pedido(idUsr, hoyF, total , 0.0f, mF);
        int idPed = PedidoDao.comprarPedido(ped);
        
        for(Producto p: lista){
            PedidoDao.enlazarProdPedido(idPed, p);
        }
        session.setAttribute("Carro", null);
        response.sendRedirect("../Vista/Carrito.jsp");
    }else{
        response.sendRedirect("../Vista/Login.jsp");
    }
%>