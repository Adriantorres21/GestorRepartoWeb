<%@page import="Modelo.Usuario"%>
<%@page import="ServicioUsuarios.ConeccionUsuarios"%>
<%
    Usuario u = new Usuario();
    u.setNombre(request.getParameter("nombre"));
    u.setApP(request.getParameter("apP")); 
    u.setApM(request.getParameter("apM")); 
    u.setCol(request.getParameter("col")); 
    u.setCalle(request.getParameter("calle"));
    u.setNoC(request.getParameter("noC"));
    u.setTel(request.getParameter("tel")); 
    u.setIdR(Integer.parseInt(String.valueOf(request.getParameter("rol")))); 
    u.setCuenta(request.getParameter("cuenta"));
    u.setPass(request.getParameter("pass"));

    String s =ConeccionUsuarios.setUsers(u.getNombre(), u.getApP(), u.getApM(), u.getCol(), u.getCalle(), u.getNoC(), u.getTel(), u.getIdR(), u.getCuenta(), u.getPass());
    System.out.println(s);
%>