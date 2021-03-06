<?php
#03.CrearAtencionPH.sql
# public function ... ($conexion) {...
# Llamada a PL_CrearAtencionPH

$query=sprintf("
  BEGIN
    PL_CrearAtencionPH(
      '%s'
      ,%s
      ,%s
      ,%s
      ,:msg
      ,:res
    );
  END;
",
  $this->observacion
  ,$this->idParamedico
  ,$this->idAmbulancia
  ,$this->idExpediente
);
$resultado=$conexion->query($query);
oci_bind_by_name($resultado, ':msg', $msg, 2000);
oci_bind_by_name($resultado, ':res', $res);
oci_execute($resultado);
oci_free_statement($resultado);
$respuesta=[];
$respuesta['mensaje'] = $msg;
$respuesta['resultado'] = $res == 1;
return json_encode($respuesta);

?>