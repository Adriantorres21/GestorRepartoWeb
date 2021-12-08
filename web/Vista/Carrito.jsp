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
        <br>
        <h2>Carrito de compra</h2>
        <div class="car table-responsive">
            <table class="table">
                <thead class="table-dark">
                    <tr>
                        <td>Nombre</td>
                        <td>Descripcion</td>
                        <td>Tipo</td>
                        <td>Peso</td>
                        <td>Texto</td>
                        <td>Precio</td> 
                        <td></td> 
                    </tr>
                </thead>
                <tbody class="table-light">
                    <tr>
                        <td>Nombre</td>
                        <td>Descripcion</td>
                        <td>Tipo</td>
                        <td>Peso</td>
                        <td>Texto</td>
                        <td>Precio</td> 
                        <td><button  class="btn btn-danger">Eliminar</button></td> 
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td>Descripcion</td>
                        <td>Tipo</td>
                        <td>Peso</td>
                        <td>Texto</td>
                        <td>Precio</td> 
                        <td><button  class="btn btn-danger">Eliminar</button></td> 
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td>Descripcion</td>
                        <td>Tipo</td>
                        <td>Peso</td>
                        <td>Texto</td>
                        <td>Precio</td> 
                        <td><button  class="btn btn-danger">Eliminar</button></td> 
                    </tr>
                </tbody>
            </table>
        </div>
        <br>
        <button type="button" class="btn btn-success">Comprar</button>
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
    <script src="js/btnMenu.js"></script>
</body>
</html>