<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../css/styleRegistro.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<title>Registro</title>
<body>
    <img class="wave" src="../img/wave2.png">
    <div class="container">
        <div class="login-content">
            <form action="../Controlador/Sesion.jsp" method="POST">
                <img src="../img/avatar.svg">
                <h2 class="title">Registrarme</h2>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>Nombre</h5>
                        <input name="nombre" type="text" class="input" required>
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>Apellido Paterno</h5>
                        <input name="apP" type="text" class="input" required>
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>Apellido Materno</h5>
                        <input name="apM" type="text" class="input" required>
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>Colonia</h5>
                        <input name="col" type="text" class="input" required>
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>Calle</h5>
                        <input name="calle" type="text" class="input" required>
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>No. Exterior</h5>
                        <input name="noC" type="text" class="input" required>
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>Tel</h5>
                        <input name="tel" type="text" class="input" required>
                    </div>
                </div>
                <div class="input-div one">
                    <div class="i">
                        <i class="fas fa-use
                           r"></i>
                    </div>
                    <div class="div">
                        <h5>Correo</h5>
                        <input name="usr" type="email" class="input" required>
                    </div>
                </div>
                <div class="input-div pass">
                    <div class="i"> 
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <h5>Contraseña</h5>
                        <input name="psw" type="password" class="input" required>
                        <input name="accion" type="hidden" value="registrar">
                    </div>
                 </div>
                 <input type="submit" class="btn" value="Registrar">
            </form>
        </div>
        <div class="img">
                <img src="../img/bg2.svg">
        </div>
    </div>
    <script type="text/javascript" src="../js/main.js"></script>
</body>