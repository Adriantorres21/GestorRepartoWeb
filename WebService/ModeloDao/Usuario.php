<?php
	Class Usuario{


		public function agregarUsuario($conn, 
               			$nombre, $apPaterno, $apMaterno, $col, $calle,$noCalle,$tel){
			$bd = $conn->conectarBD();

			$consulta = "INSERT INTO `usuario`(`idusuario`, `nombre`, `apPaterno`, `apMaterno`, `col`, `calle`, `noCalle`, `Tel`) VALUES (NULL, 
               			'$nombre', '$apPaterno', '$apMaterno', '$col', '$calle','$noCalle','$tel')";
			$st1 = $bd->query($consulta);

			$consulta2 = "SELECT MAX(idusuario) AS id FROM usuario";
			$st2 = $bd->query($consulta2);
			$id = -1;
			if ($fila=$st2->fetch_assoc()) { 
				$id = $fila['id'];
			}
			return $id;
		}

		public function enlazarUsrRol($cn,$id, $rol, $cuenta, $pass){
			$bd = $cn->conectarBD();
			$consulta3 = "INSERT INTO `login`(`idlogin`, `idRol`, `cuenta`, `password`, `idUsuario`) VALUES (NULL,'$rol','$cuenta','$pass','$id')";
			$st3 = $bd->query($consulta3);
			return $st3;
		}

		public function modificarUsuario($conn, $id,$estado){
			$bd = $conn->conectarBD();
			$consulta = "";
			$st = $bd->query($consulta);
			return $st;
		}

		public function ListarUsuario($conn){
			$bd = $conn->conectarBD();
			$consulta = "SELECT * FROM usuario u INNER JOIN login l ON u.idusuario = l.idUsuario";
			$st = $bd->query($consulta);
			return $st;
		}

		public function eliminarUsuario($conn, $id){
			$bd = $conn->conectarBD();
			$consulta = "DELETE FROM login WHERE idUsuario=$id";
			$st = $bd->query($consulta);
			$consulta2 = "DELETE FROM pedido WHERE idusuario=$id";
			$st = $bd->query($consulta2);
			return $st;
		}
	}
?>