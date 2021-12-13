<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Dao.ProductoDao"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <!-- Boostrap -->
        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Estilo catalogo -->
        <link rel="stylesheet" href="../css/styleCatalogo.css">
        <!-- Estilo car -->
        <link rel="stylesheet" href="../css/styleCarrito.css">
        <title>Pasteles</title>
    </head>
    <%
        List<Producto> lista = ProductoDao.getProductos();
        request.setAttribute("lista", lista);
    %>
    <body class="fondo">
        <div>
            <!-- Menu -->
            <div id="bar-nav">
                <div id="logo">
                    <a href="${pageContext.request.contextPath}/Vista/index.jsp"><img src="../img/logo.svg" alt="Mi logo" id="imagenLogo"></a>
                </div>
                <!-- <form action="" method="POST" id="busqueda">
                    <input type="text" name="txtBusqueda"  id="txtBusqueda" placeholder="Buscar...">
                    <button type="submit" value="Buscar" id="btnBuscar"><i class="fas fa-search"></i></button>
                </form> -->
                <a class="btnMenu"><i class="fas fa-bars"></i></a>
                <div id="der" class="derOcultar">
                    <% if (session.getAttribute("Cuenta") == null) { %>
                    <div class="dropdown">
                        <a class="btn dropdown-toggle bar-der animacion textMenu" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"  target="_blank">
                            <i class="fas fa-user"></i>
                        </a>

                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item" href="Login.jsp" target="_blank">Iniciar sesión</a></li>
                            <li><a class="dropdown-item" href="Registro.jsp" target="_blank">Registrarme</a></li>
                        </ul>
                    </div>
                    <% } else { %>
                    <div class="dropdown">
                        <a class="btn dropdown-toggle bar-der animacion textMenu" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"  target="_blank">
                            <% out.print(session.getAttribute("Cuenta") + " "); %><i class="fas fa-user"></i>
                        </a>

                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item bar-der textMenu" href="#" style="border: none; color: rgb(216, 138, 75); background:none">Mi perfil</a></li>
                            <form action="../Controlador/Sesion.jsp" method="POST">
                                <input name="accion" type="hidden" value="cerrar">
                                <input type="submit" class="bar-der textMenu" value="Cerrar Sesión" style="border: none; color: rgb(216, 138, 75); background:none">
                            </form>
                        </ul>
                    </div> 
                    <% }%>
                    <a class="bar-der animacion textMenu" href="Pedidos.jsp">Pedidos</a>
                    <a class="bar-der animacion carrito" href="Carrito.jsp"><i class="fas fa-shopping-cart"></i></a>
                </div>
            </div>
            <!-- Menu fin -->
            <!-- banner -->
            <br>
            <div class="banner">
                <h1>Bienvenido</h1>
            </div>
            <!-- banner fin -->

            <div class="catalogo">
                <c:forEach var="dato" items="${lista}">
                    <form action="" method="POST" class="cards">
                        <div class="card-pastel">
                           <img class="imgp" src="../ControllerImg?idImg=${dato.getId()}"> 
                        </div>
                        <div class="descripcion">
                            <h2>Pastel ${dato.getNombre()}</h2>
                            <p>Pastel con relleno de ${dato.getRelleno()}, <br>
                                cobertura de 
                                ${dato.getCobertura()} 
                                <c:if test="${dato.isTresLeches()}">, de tres leches</c:if>
                                </p>
                                <h3>Precio: ${dato.getPrecio()}</h3>
                            <input name="id" type="hidden" value="${dato.getId()}" />
                            <input type="submit" onclick="alert('Agregado')" style="cursor: pointer;color: white;background: none;margin-top: 10px;border: white 1px solid;padding: 1rem 6rem;border-radius: 2%;" type="submit" value="Añadir" />
                        </div>
                    </form>
                </c:forEach>                      
            </div>
        </div>
    
    <jsp:include page="../Car/SesionCar.jsp"/>    
    <div class="pie">
        <h3>Telefono: 4771112345</h3>
        <h3>Direccion Col Casi, Lejos #123</h3>
        <div class="redes">
            <a href=""><i class="fab fa-facebook"></i></a>
            <a href=""><i class="fab fa-twitter"></i></a>
            <a href=""><i class="fab fa-instagram-square"></i></a>
        </div>      
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>  
<script src="../js/btnMenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/agregarCar.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
</html>