<%@page import="Modelo.Usuario"%>
<%@page import="Dao.UsuarioDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="LoginService.Login"%>
<% 
    
    String accion = request.getParameter("accion");
    List<String> ss = new ArrayList<String>();
    switch(accion){
        case "cerrar":
            session.invalidate();
            out.print("Se cerro la sesión");
            response.sendRedirect("../Vista/Login.jsp");
            break;
        case "iniciar":
            Login log = Login.getInstance();
            String usr = request.getParameter("usr");
            String psw = request.getParameter("psw");
                    
            log.setUsr(usr);
            log.setPsw(psw);
            ss = log.verificarCuenta();
            if(ss.isEmpty()){
                session.setAttribute("LogError", "Contraseña y/o usuario incorrecto");
                response.sendRedirect("../Vista/Login.jsp");
            }else{
                session.setAttribute("LogError",null);
                session.setAttribute("Rol", ss.get(0));
                session.setAttribute("ID", ss.get(1));
                session.setAttribute("Cuenta", ss.get(2));
                if(session.getAttribute("Rol").equals("2")){
                    response.sendRedirect("../Vista/index.jsp");
                }else{
                    response.sendRedirect("../Vista/Admin/Usuarios.jsp");
                }
            }
            break;
        case "registrar":
            String nombre = String.valueOf(request.getParameter("nombre"));
            String apP = String.valueOf(request.getParameter("apP"));
            String apM = String.valueOf(request.getParameter("apM"));
            String col = String.valueOf(request.getParameter("col"));
            String calle = String.valueOf(request.getParameter("calle"));
            String noC = String.valueOf(request.getParameter("noC"));
            String tel = String.valueOf(request.getParameter("tel"));
            String user = String.valueOf(request.getParameter("usr"));
            String pass = String.valueOf(request.getParameter("psw"));
            
            if(nombre!="" && apP!="" && apM!="" && col!="" && calle!=""
               && noC!="" && tel!="" && user!="" && pass!=""){
                Usuario us = new Usuario(nombre,apP,apM,col,calle,noC,tel);
                int idu=UsuarioDao.registrarUsuario(us);
                UsuarioDao.enlazarLogUser(idu, 2, user, pass);
                response.sendRedirect("../Vista/Login.jsp");
            }else{
                session.setAttribute("LogErrorR", "Revise los campos");
                response.sendRedirect("../Vista/Registro.jsp");
            }
            break;
    }
%>