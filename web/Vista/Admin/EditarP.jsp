<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (String.valueOf(String.valueOf(session.getAttribute("Rol"))).equals("1")) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <% Producto p = (Producto) request.getAttribute("ProductoEditar");%>
        <!--fom Editar -->
        <form action="Controlador/ModificarP.jsp" type="POST" enctype="multipart/formdata" class="d-flex flex-column" style="width: 30%; margin: auto; margin-top: 2rem;">
            <h5 align="center">Editar Producto</h5>
            <input name="IdProducto" value="<%= p.getId()%>" type="hidden">
            Nombre : <input name="nombre" value="<%= p.getNombre()%>" type="text" class="input" required>
            Imagen: <input name="img"  type="file" class="input" >
            Relleno: <input name="relleno" value="<%= p.getRelleno()%>" type="text" class="input" required>
            Cobertura: <input name="cobertura" value="<%= p.getCobertura()%>" type="text" class="input" required>
            Pan: <input name="pan" type="text" value="<%= p.getPan()%>" class="input" required>
            Descripcion <input name="msj" value="<%= p.getMensaje()%>" type="text" class="input" required>
            <% if (p.isTresLeches()) { %>
            Tres Leches <input name="tL" type="checkbox" class="input" checked="yes">
            <% } else {%>
            Tres Leches <input name="tL" type="checkbox" class="input" >
            <% }%>
            Peso: <input name="peso" type="number" value="<%= p.getPeso()%>" class="input" required>
            <select name="tipo"s class="form-select" aria-label="Default select example" style="margin-top: 5px">
                <option value="Redondo" selected><%= p.getTipo()%></option>
                <option value="Redondo">Redondo</option>
                <option value="Plancha">Plancha</option>
                <option value="3 Pisos">3 Pisos</option>
            </select>
            Precio: <input name="precio" value="<%= p.getPrecio()%>" type="number" class="input" required><br>
            <button type="submit" name="accion" value="agregarEdit" class="btn btn-primary">Editar</button><br>
            <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        </form>
    </body>
</html>
<%
}else{
    response.sendRedirect("../index.jsp");
}
%>