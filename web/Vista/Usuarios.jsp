<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Menú</title>
        <link rel="stylesheet" href="../css/styleMenu.css">
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
        <title>Usuarios</title>
    </head>
    <!-- Menu -->
    <body id="body">
        <header>
            <div class="icon__menu">
                <i class="fas fa-bars" id="btn_open"></i>
            </div>
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

                <a href="#">
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
            <h1>Usuarios Disponibles</h1><br>
            <table>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido Paterno</th>
                    <th>Apellido Materno</th>
                    <th>Colonia</th>
                    <th>Calle</th>
                    <th>Número de Calle</th>
                    <th>Teléfono</th>
                </tr>
                <tr>

                </tr>
            </table>
        </main>

        <script src="../js/scriptMenu.js"></script>
    </body>
</html>
