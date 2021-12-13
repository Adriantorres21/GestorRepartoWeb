<%@page import="Dao.ProductoDao"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (String.valueOf(String.valueOf(session.getAttribute("Rol"))).equals("1")) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Modo Admin</title>
        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="../../css/styleMenu.css">
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <title>Usuarios</title>
    </head>
    <!-- Menu -->
    <body id="body">
        <header>
            <div class="icon__menu">
                <i class="fas fa-bars" id="btn_open"> </i>
            </div>
            Bienvenido <% out.print(" " + session.getAttribute("Cuenta"));%>
        </header>

        <div class="menu__side" id="menu_side">

            <div class="name__page">
                <i class="fas fa-home"></i>
                <h4>Panaderia Karen</h4>
            </div>

            <div class="options__menu">	

                <a href="Usuarios.jsp" >
                    <div class="option">
                        <i class="far fa-address-book" title="Usuarios"></i>
                        <h4>Usuarios</h4>
                    </div>
                </a>

                <a href="#">
                    <div class="option">
                        <i class="far fa-file" title="Reportes"></i>
                        <h4>Reportes</h4>
                    </div>
                </a>

                <a href="#">
                    <div class="option">
                        <i class="fas fa-truck" title="Repartos"></i>
                        <h4>Repartos</h4>
                    </div>
                </a>
                <a href="Productos.jsp" class="selected">
                    <div class="option">
                        <i class="fas fa-birthday-cake" title="Productos"></i>
                        <h4>Productos</h4>
                    </div>
                </a>


                <a href="../../Controlador/Sesion.jsp?accion=cerrar">
                    <div class="option">
                        <i class="fas fa-sign-out-alt" title="Salir"></i>
                        <h4>Salir</h4>
                    </div>
                </a>
            </div>
        </div>
        <!-- Fin del Menu -->   
        <main>
            <!-- Dentro del main va el contenido del modulo -->
            <h1>Productos</h1><br>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Agregar Producto
            </button><br>
            <!-- Modal Agregar-->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar Producto</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="../../Controlador/AgregarP.jsp" class="d-flex flex-column" method="POST">
                                Nombre : <input name="nombre" type="text" class="input" required>
                                Relleno: <input name="relleno" type="text" class="input" required>
                                Cobertura: <input name="cobertura" type="text" class="input" required>
                                Pan: <input name="pan" type="text" class="input" required>
                                Descripcion <input name="msj" type="text" class="input" required>
                                Tres Leches <input name="tL" type="checkbox" class="input">
                                Peso: <input name="peso" type="number" class="input" >
                                <select name="tipo" class="form-select" aria-label="Default select example" style="margin-top: 5px">
                                    <option value="Redondo" selected>Tipo</option>
                                    <option value="Redondo">Redondo</option>
                                    <option value="Plancha">Plancha</option>
                                    <option value="3 Pisos">3 Pisos</option>
                                </select>
                                Precio: <input name="precio" type="number" class="input" required><br>
                                <button type="submit" class="btn btn-primary">Agregar</button><br>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            </form>
                        </div>
                        <div class="modal-footer">

                        </div>
                    </div>
                </div>
            </div><br>
            <%
                List<Producto> lista = ProductoDao.getProductos();
                request.setAttribute("productos", lista);
            %>
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th  scope="col">ID</th>
                        <th  scope="col">Nombre</th>
                        <th  scope="col">Img</th>
                        <th  scope="col">Relleno</th>
                        <th  scope="col">Cobertura</th>
                        <th  scope="col">Pan</th>
                        <th  scope="col">Mensaje</th>
                        <th  scope="col">Tres Leches</th>
                        <th  scope="col">Peso</th>
                        <th  scope="col">Tipo</th>
                        <th  scope="col">Precio</th>
                        <th  scope="col" colspan="2" class="text-center">Operaciones</th>
                    </tr>  
                </thead>
                <tbody>
                    <c:forEach var="p" items="${productos}">
                        <tr>
                            <td>${p.getId()}</td>
                            <td>${p.getNombre()}</td>
                            <td><img class="imgP" src="${pageContext.request.contextPath}/ControllerImg?idImg=${p.getId()}"></td>
                            <td>${p.getRelleno()}</td>
                            <td>${p.getCobertura()}</td>
                            <td>${p.getPan()}</td>
                            <td>${p.getMensaje()}</td>
                            <td>
                                <c:if test="${p.isTresLeches()}">Si</c:if>     
                                </td>
                                <td>${p.getPeso()}</td>
                            <td>${p.getTipo()}</td>
                            <td>${p.getPrecio()}</td>
                            <td>
                                <form action="../../Controller" method="POST">
                                    <input type="hidden" name="idP" value="${p.getId()}">
                                    <button name="accion" value="editar" type="submit" class="editar btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">Editar</button>
                                </form>
                                <form action="../../Controlador/EliminarP.jsp" method="POST">
                                    <input type="hidden" name="idP" value="${p.getId()}">
                                    <button type="submit" class="btn btn-danger">  Eliminar</button>
                                </form>

                            </td>
                        </tr>  
                    </c:forEach>
                </tbody>
            </table>
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="../../js/scriptMenu.js"></script>
    </body>
</html>
<%
}else{
    response.sendRedirect("../index.jsp");
}
%>

