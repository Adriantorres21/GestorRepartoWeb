<%@page import="Dao.PedidoDao"%>
<%@page import="Modelo.PedidoProducto"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>

<%
    if (session.getAttribute("Cuenta") == null) {
        response.sendRedirect("Login.jsp");
    } else {
%>
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
        <!-- Estilo car -->
        <link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet">
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
            <br>
            <h2>Pedidos </h2>
            <div class="car table-responsive">
                <%
                    int id = Integer.parseInt(String.valueOf(session.getAttribute("ID")));
                    List<PedidoProducto> listaP = PedidoDao.getPedidoProd(id);
                    if (!listaP.isEmpty()) {
                %>
                <table id="tablax" class="display">
                    <thead class="">
                        <tr>
                            <th>No. Orden</th>
                            <th>Fecha</th>
                            <th>Entrega</th>
                            <th>Envio</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>tipo</th>
                            <th>Precio</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody class="">
                        <% for (PedidoProducto tp : listaP) {%>
                        <tr>
                            <td>#<%= tp.getIdPedido()%></td>
                            <td><%= tp.getFecha()%></td>
                            <td><%= tp.getFechaEn()%></td>
                            <td><% if (tp.isEntregador()) {
                                    out.print("Si");
                                } else {
                                    out.print("No");
                                }%></td>
                            <td><%= tp.getNombre()%></td>
                            <td>Pastel con relleno de <%= tp.getRelleno()%>, <br>
                                cobertura de <%= tp.getCobertura()%> <% if (tp.isTresLeches()) { %>
                                <% out.print(", de tres leches");
                                    }%></td>
                            <td><%= tp.getTipo()%></td>
                            <td class="precio"><%= tp.getPrecio()%></td>
                            <td><%= tp.getTotal()%></td>
                        </tr>
                        <% }%> 
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>No. Orden</th>
                            <th>Fecha</th>
                            <th>Entrega</th>
                            <th>Envio</th>
                            <th>Descripcion</th>
                            <th>Tipo</th>
                            <th>Precio</th>
                            <th>Total</th>
                        </tr>
                    </tfoot>
                </table>
                <% } else { %>
                <div class="alert alert-warning">
                    <br><br><br>
                    No tiene pedidos
                    <br><br><br>
                </div>
                <br><br><br><br><br><br><br><br><br>
                <% }%>
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
        <!-- JQUERY -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <!-- DATATABLES -->
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js">
        </script>
        <script>
            $(document).ready(function () {
                $('#tablax').DataTable({
                    language: {
                        processing: "Tratamiento en curso...",
                        search: "Buscar&nbsp;:",
                        lengthMenu: "Agrupar de _MENU_ items",
                        info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                        infoEmpty: "No existen datos.",
                        infoFiltered: "(filtrado de _MAX_ elementos en total)",
                        infoPostFix: "",
                        loadingRecords: "Cargando...",
                        zeroRecords: "No se encontraron datos con tu busqueda",
                        emptyTable: "No hay datos disponibles en la tabla.",
                        paginate: {
                            first: "Primero",
                            previous: "Anterior",
                            next: "Siguiente",
                            last: "Ultimo"
                        },
                        aria: {
                            sortAscending: ": active para ordenar la columna en orden ascendente",
                            sortDescending: ": active para ordenar la columna en orden descendente"
                        }
                    },
                    scrollY: 400,
                    lengthMenu: [
                        [10, 20, -1],
                        [10, 20, "Todos"]
                    ],
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="../js/btnMenu.js"></script>
    </body>
</html>
<% }%>