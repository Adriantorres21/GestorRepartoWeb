<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/styleLogin.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<title>Inicio de Sesión</title>
<body>
    <img class="wave" src="../img/wave.png">
    <div class="container">
        <div class="img">
                <img src="../img/bg.svg">
        </div>
        <div class="login-content">
            <form action="../Controlador/Sesion.jsp" method="POST">
                <img src="../img/avatar.svg">
                <h2 class="title">Iniciar Sesión</h2>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>Usuario</h5>
                        <input name="usr" type="text" class="input">
                    </div>
                </div>
                <div class="input-div pass">
                    <div class="i"> 
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <h5>Contraseña</h5>
                        <input name="psw" type="password" class="input">
                        <input name="accion" type="hidden" value="iniciar">
                    </div>
                 </div>
                <% if(session.getAttribute("LogError")!=null){ %>
                    <h5><%= session.getAttribute("LogError")%></h5>
                <% } %>
                 <input type="submit" class="btn" value="Login">
            </form>
        </div>
    </div>
    <script type="text/javascript" src="../js/main.js"></script>
</body>