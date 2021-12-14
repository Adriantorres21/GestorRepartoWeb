<?php
	Class Conexion{
		private $server = "localhost";
		private $usuario = "root";
		private $contra = "";
		private $bd = "pasteleria";

		public function conectarBD(){
			$conn = new mysqli($this->server, $this->usuario, $this->contra, $this->bd);
			return $conn;
		}

	}
?>