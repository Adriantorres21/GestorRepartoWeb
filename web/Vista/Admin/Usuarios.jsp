
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="ServicioUsuarios.ConeccionUsuarios"%>
<%@page import="Modelo.Usuario"%>
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
        <link href="//cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css" rel="stylesheet">
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

                <a href="#" class="selected">
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
                <a href="Productos.jsp">
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
            <%
                Usuario[] lista = ConeccionUsuarios.getUsers();
                request.setAttribute("usuarios", lista);
            %>
            <!-- Dentro del main va el contenido del modulo -->
            <h1>Usuarios</h1><br>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Agregar Usuario
            </button><br>
            <!-- Modal Agregar-->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar Usuario</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="../../Controlador/AgregarU.jsp" class="d-flex flex-column" method="POST">
                                Nombre : <input name="nombre" type="text" class="input" required>
                                Ap. Paterno: <input name="apP" type="text" class="input" required>
                                Ap. Materno: <input name="apM" type="text" class="input" required>
                                Colonia: <input name="col" type="text" class="input" required>
                                Calle: <input name="calle" type="text" class="input" required>
                                No. Exterior: <input name="noC" type="text" class="input">
                                Tel: <input name="tel" type="text" class="input" required>
                                <select name="rol" class="form-select" aria-label="Default select example" style="margin-top: 5px">
                                    <option value="2" selected>Rol</option>
                                    <option value="2">Cliente</option>
                                    <option value="1">Administrador</option>
                                </select>
                                Correo: <input name="cuenta" type="email" class="input" required>
                                Contraseña: <input name="pass" type="password" class="input" required><br>
                                <button type="submit" class="btn btn-primary">Agregar</button><br>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            </form>
                        </div>
                        <div class="modal-footer">

                        </div>
                    </div>
                </div>
            </div><br>

            <table  id="tablax" class="display">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Ap. Paterno</th>
                        <th>Ap. Materno</th>
                        <th>Colonia</th>
                        <th>Calle</th>
                        <th>No. Exterior</th>
                        <th>Tel</th>
                        <th>Rol</th>
                        <th>Cuenta</th>
                        <th>Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${usuarios}">
                        <tr>
                            <td>${u.getId()}</td>
                            <td>${u.getNombre()}</td>
                            <td>${u.getApP()}</td>
                            <td>${u.getApM()}</td>
                            <td>${u.getCol()}</td>
                            <td>${u.getCalle()}</td>
                            <td>${u.getNoC()}</td>
                            <td>${u.getTel()}</td>
                            <td>${u.getIdR()}</td>
                            <td>${u.getCuenta()}</td>
                            <td>
                                <form action="" method="POST">
                                    <input type="hidden" name="idP" value="${u.getId()}">
                                    <button name="accion" value="editar" type="submit" class="editar btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">Editar</button>
                                </form>
                                <form action="" method="POST">
                                    <input type="hidden" name="idP" value="${u.getId()}">
                                    <button type="submit" class="btn btn-danger">  Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
        </main>
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
        <script src="../../js/scriptMenu.js"></script>
    </body>
</html>
<%
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
