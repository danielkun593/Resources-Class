<?php

class DataBase
{
  public static function connect()
  {
	$db = new mysqli("localhost", 'root', '', 'web_service');
	//$db = new mysqli("localhost", 'usuario', 'clave', 'base');
	$db->query("SET NAMES 'utf8'");
	return $db;
  }

}

?>