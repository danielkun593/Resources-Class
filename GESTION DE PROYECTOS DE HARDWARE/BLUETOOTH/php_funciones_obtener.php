<?php

include('conexion.php');
$db = DataBase::connect();
date_default_timezone_set("America/Guayaquil");

$variable=$_GET['enviar'];
$valor = 0;

$sql="SELECT * FROM led WHERE estado=1 and led_id=".$variable;
$result = $db->query($sql);
if($result) {
    while ($row = $result->fetch_array()){
        $valor = $row['valor'];
    }

}

echo 'var:'.$valor;

?>