<%@page import="Dao.ProductoDao"%>
<%
    int id = Integer.parseInt(String.valueOf(request.getParameter("idP")));
    ProductoDao.delete(id);
    response.sendRedirect("../Vista/Admin/Productos.jsp");
%>
