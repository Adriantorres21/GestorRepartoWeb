<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%
    if (session.getAttribute("Carro") != null) {
        if(request.getParameter("idEliminar")!=null){
            List<Producto> lista = (List<Producto>) session.getAttribute("Carro");
            int indice = Integer.parseInt(request.getParameter("idEliminar"));
            lista.remove(indice);
            session.setAttribute("Carro", lista);
        }
    }
%>
<script type="text/javascript">window.location.href="../Vista/Carrito.jsp"</script>

