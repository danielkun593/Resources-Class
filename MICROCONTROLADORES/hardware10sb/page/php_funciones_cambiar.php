<?php
include('conexion.php');
$db = DataBase::connect();
date_default_timezone_set("America/Guayaquil");

$variable=$_GET['valor'];
// $id_sensor=$_GET['sensor'];

//$sql="UPDATE led set valor=".$variable." WHERE estado=1 and led_id=".$id_sensor;
$sql="UPDATE led set valor=".$variable." WHERE estado=1 and led_id=1";
$result = $db->query($sql);


?>