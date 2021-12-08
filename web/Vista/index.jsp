<%@page import="Dao.ProductoDao"%>
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
    <!-- Estilo catalogo -->
    <link rel="stylesheet" type="text/css" href="../css/styleCatalogo.css">
    <title>Pasteles</title>
</head>
<body class="fondo">
    <div>
        <!-- Menu -->
        <div id="bar-nav">
            <div id="logo">
                <a href="Vista/index.jsp"><img src="../img/logo.svg" alt="Mi logo" id="imagenLogo"></a>
            </div>
            <!-- <form action="" method="POST" id="busqueda">
                <input type="text" name="txtBusqueda"  id="txtBusqueda" placeholder="Buscar...">
                <button type="submit" value="Buscar" id="btnBuscar"><i class="fas fa-search"></i></button>
            </form> -->
            <a class="btnMenu"><i class="fas fa-bars"></i></a>
            <div id="der" class="derOcultar">
                <% session.setAttribute("cuenta", "OK");
                   if(session.getAttribute("cuenta")==null){ %>
                    <a class="bar-der animacion textMenu" href="Login.html" target="_blank">Iniciar sesión</a>        
                <% }else if(session.getAttribute("cuenta")== "OK"){ %>
                    <a class="bar-der animacion textMenu" onclick="cerrarSesion();" href="#">Cerrar sesión</a>
                <% } %>
                <a class="bar-der animacion textMenu" href="">Pedidos</a>
                <a class="bar-der animacion textMenu" href="">Mi Pastel</a>
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
            <% List<Producto> listaP = ProductoDao.getProductos(); %>
            <% for(Producto tp : listaP) { %>
            <div class="cards">
                <img src="<%= tp.getImg() %>" alt="">
                <div class="descripcion">
                    <h2>Pastel <%= tp.getNombre() %></h2>
                    <p>Pastel con relleno de <%= tp.getRelleno()%>, <br>
                        cobertura de <%= tp.getCobertura() %> <% if( tp.isTresLeches()){ %>
                        <% out.print(", de tres leches");}%></p>
                    <h3>Precio: <%= tp.getPrecio() %></h3>
                    <a onclick="agregarArticulo();" href="">Añadir</a>
                </div>
            </div>
            <% } %>                       
        </div>
    </div>
    <div class="pie">
        <h3>Telefono: 4771112345</h3>
        <h3>Direccion Col Casi, Lejos #123</h3>
        <div class="redes">
            <a href=""><i class="fab fa-facebook"></i></a>
            <a href=""><i class="fab fa-twitter"></i></a>
            <a href=""><i class="fab fa-instagram-square"></i></a>
        </div>      
    </div>
    <script src="../js/btnMenu.js"></script>
    <script src="../js/carrito.js"></script>
</body>
</html>