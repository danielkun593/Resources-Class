<?php

include('../bd/conexion.php');
$db = DataBase::connect();
date_default_timezone_set("America/Guayaquil");

$fecha = date("Y-m-d H:i:s");

$var=$_GET['valor'];
$var_h=$_GET['valor_h'];

$sql="INSERT INTO temperatura(valor, fecha) values(".$var.",'".$fecha."')";
$result = $db->query($sql);

$sql_h="INSERT INTO humedad(valor, fecha) values(".$var_h.",'".$fecha."')";
$result_h = $db->query($sql_h);


?>