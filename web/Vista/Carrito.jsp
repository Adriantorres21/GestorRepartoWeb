<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
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
    <title>Carrito</title>
</head>
<body class="fondo">
    <div>
        <!-- Menu -->
        <div id="bar-nav">
            <div id="logo">
                <a href="index.jsp"><img src="../img/logo.svg" alt="Mi logo" id="imagenLogo"></a>
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
                            <li><a class="dropdown-item" href="Login.jsp">Iniciar sesión</a></li>
                            <li><a class="dropdown-item" href="Registro.jsp">Registrarme</a></li>
                        </ul>
                    </div>
                    <% } else { %>
                    <div class="dropdown">
                        <a class="btn dropdown-toggle bar-der animacion textMenu" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"  target="_blank">
                            <i class="fas fa-user"></i>
                        </a>

                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
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
        <br>
        <h2>Carrito de compra</h2>
        <div class="car table-responsive">
            <%  List<Producto> lista = (List<Producto>) session.getAttribute("Carro");
                if(session.getAttribute("Carro") != null && !lista.isEmpty()){ %>
                <table class="table">
                    <thead class="table-dark">
                        <tr>
                            <td>Nombre</td>
                            <td>Descripcion</td>
                            <td>Tipo</td>
                            <td>Peso</td>
                            <td>Precio</td> 
                            <td></td> 
                        </tr>
                    </thead>
                    <tbody class="table-light">
                    <% lista = (List<Producto>) session.getAttribute("Carro");
                        int cont=0;
                        double total=0;
                        for(Producto cp: lista){ %>
                        <tr>
                            <td><%= cp.getNombre() %></td>
                            <td>Pastel con relleno de <%= cp.getRelleno()%>,
                            cobertura de <%= cp.getCobertura() %> <% if( cp.isTresLeches()){ %>
                            <% out.print(", de tres leches");}%></td>
                            <td><%= cp.getTipo() %></td>
                            <td><%= cp.getPeso() %></td>
                            <td><%= cp.getPrecio() %></td> 
                            <td>
                                <form action="../Car/EliminarItem.jsp" method="POST">
                                    <input name="idEliminar" type="hidden" value="<% out.print(cont); %>" >
                                    <input class="btn btn-outline-danger" onclick="" type="submit" value="Eliminar">
                                </form>
                            </td>
                        </tr>
                    <%  total=total+cp.getPrecio();
                        cont=cont+1; }%>
                    </tbody>
                </table>
                        <h3> Total: $<%= total %></h3>
                        <form class="d-flex flex-column" action="../Controlador/Compra.jsp" method="POST">
                            <input type="hidden" name="total" value="<% out.print(total); %>">
                            <input type="hidden" value="compra" name="accion">
                            <button type="submit" class="btn btn-success">Comprar</button>
                        </form>
            <% }else { %>
            <div class="alert alert-warning">
                <br><br><br>
                No tiene productos en el carrito de compra
                <br><br><br>
            </div>
            <br><br><br><br><br><br><br><br><br>
            <% } %>
        </div> 
        <br>
    </div>
    <br><br><br><br><br>
    <div class="pie">
        <h3>Telefono: 4771112345</h3>
        <h3>Direccion Col Casi, Lejos #123</h3>
        <div class="redes">
            <a href=""><i class="fab fa-facebook"></i></a>
            <a href=""><i class="fab fa-twitter"></i></a>
            <a href=""><i class="fab fa-instagram-square"></i></a>
        </div>      
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="../js/btnMenu.js"></script>
</body>
</html>