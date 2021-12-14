<?php
	require("../ModeloDao/Usuario.php");
	require("../Persistencia/Conexion.php");

	$cn = new Conexion();
	$p = new Usuario();

	if(isset($_REQUEST["accion"])){

		switch ($_REQUEST["accion"]) {
			case 'Listar':
				$usuario = array();
				$sql=$p->ListarUsuario($cn);
				while($datos=$sql->fetch_assoc()){
					$usuario[]=array(
						"id"=>$datos["idusuario"],
						"nombre"=>$datos["nombre"],
						"apP"=>$datos["apPaterno"],
						"apM"=>$datos["apMaterno"],
						"col"=>$datos["col"],
						"calle"=>$datos["calle"],
						"noC"=>$datos["noCalle"],
						"tel"=>$datos["Tel"],
						"idL"=>$datos["idlogin"],
						"idR"=>$datos["idRol"],
						"cuenta"=>$datos["cuenta"],
						"pass"=>$datos["password"],
						"idU"=>$datos["idUsuario"],
					);
				}
				print json_encode($usuario,JSON_FORCE_OBJECT);
				break;
			case 'Agregar':
				$nombre=$_REQUEST["nombre"];
				$apPaterno=$_REQUEST["apP"];
				$apMaterno=$_REQUEST["apM"]; 
				$col=$_REQUEST["col"];
				$calle=$_REQUEST["calle"];
				$noCalle=$_REQUEST["noC"];
				$tel=$_REQUEST["tel"];
				$rol=$_REQUEST["rol"]; 
				$cuenta=$_REQUEST["cuenta"];
				$pass=$_REQUEST["pass"];

				$idU=$p->agregarUsuario($cn, $nombre, $apPaterno, $apMaterno, $col, $calle,$noCalle,$tel);
				$p->enlazarUsrRol($cn,$idU, $rol, $cuenta, $pass);

				print json_encode("OK");
				break;
			default:
				print json_encode("Algo salio mal");
				break;
		}

		
	}
?>