<?php

class DataBase
{
  public static function connect()
  {
	$db = new mysqli("localhost", 'proyecto_gestionHardware', 'GestionHardware', 'proyecto_gestionHardware');
	//$db = new mysqli("localhost", 'usuario', 'clave', 'base');
	$db->query("SET NAMES 'utf8'");
	return $db;
  }

}

?>