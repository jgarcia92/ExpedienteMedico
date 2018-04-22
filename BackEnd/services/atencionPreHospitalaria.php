<?php
include_once('../class/Conexion.php');
include_once('../class/AtencionPreHospitalaria.php');
if(isset($_POST['accion'])){
$conexion = new Conexion();
switch ($_POST['accion']) {
case 'crear':

  if(isset($_POST['observacion'])){
    $observacion= $_POST['observacion'];
  }else{
    $observacion=null;
    $res['mensaje']='Se necesita campo: observacion';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['idParamedico']) && $_POST['idParamedico']!=''){
    $idParamedico= $_POST['idParamedico'];
  }else{
    $idParamedico='null';
    $res['mensaje']='Se necesita campo: idParamedico';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['idAmbulancia']) && $_POST['idAmbulancia']!=''){
    $idAmbulancia= $_POST['idAmbulancia'];
  }else{
    $idAmbulancia='null';
    $res['mensaje']='Se necesita campo: idAmbulancia';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['idExpediente']) && $_POST['idExpediente']!=''){
    $idExpediente= $_POST['idExpediente'];
  }else{
    $idExpediente='null';
    $res['mensaje']='Se necesita campo: idExpediente';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }
  $atencionprehospitalaria=new AtencionPreHospitalaria();
  $atencionprehospitalaria->setObservacion($observacion);
  $atencionprehospitalaria->setIdParamedico($idParamedico);
  $atencionprehospitalaria->setIdAmbulancia($idAmbulancia);
  $atencionprehospitalaria->setIdExpediente($idExpediente);
  echo $atencionprehospitalaria->crear($conexion);
break;

case 'listarPorParamedico':
  $atencionprehospitalaria=new AtencionPreHospitalaria();
  echo $atencionprehospitalaria->listarPorParamedico($conexion);
break;

case 'listarPorPaciente':

  if(isset($_POST['idExpediente']) && $_POST['idExpediente']!=''){
    $idExpediente= $_POST['idExpediente'];
  }else{
    $idExpediente='null';
    $res['mensaje']='Se necesita campo: idExpediente';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }
  $atencionprehospitalaria=new AtencionPreHospitalaria();
  $atencionprehospitalaria->setIdExpediente($idExpediente);
  echo $atencionprehospitalaria->listarPorPaciente($conexion);
break;

case 'actualizar':

  if(isset($_POST['idAtencion']) && $_POST['idAtencion']!=''){
    $idAtencion= $_POST['idAtencion'];
  }else{
    $idAtencion='null';
    $res['mensaje']='Se necesita campo: idAtencion';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['observacion'])){
    $observacion= $_POST['observacion'];
  }else{
    $observacion=null;
    $res['mensaje']='Se necesita campo: observacion';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['fechaHoraAtencion'])){
    $fechaHoraAtencion= $_POST['fechaHoraAtencion'];
  }else{
    $fechaHoraAtencion=null;
    $res['mensaje']='Se necesita campo: fechaHoraAtencion';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['idParamedico']) && $_POST['idParamedico']!=''){
    $idParamedico= $_POST['idParamedico'];
  }else{
    $idParamedico='null';
    $res['mensaje']='Se necesita campo: idParamedico';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['idAmbulancia']) && $_POST['idAmbulancia']!=''){
    $idAmbulancia= $_POST['idAmbulancia'];
  }else{
    $idAmbulancia='null';
    $res['mensaje']='Se necesita campo: idAmbulancia';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['idExpediente']) && $_POST['idExpediente']!=''){
    $idExpediente= $_POST['idExpediente'];
  }else{
    $idExpediente='null';
    $res['mensaje']='Se necesita campo: idExpediente';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }
  $atencionprehospitalaria=new AtencionPreHospitalaria();
  $atencionprehospitalaria->setIdAtencion($idAtencion);
  $atencionprehospitalaria->setObservacion($observacion);
  $atencionprehospitalaria->setFechaHoraAtencion($fechaHoraAtencion);
  $atencionprehospitalaria->setIdParamedico($idParamedico);
  $atencionprehospitalaria->setIdAmbulancia($idAmbulancia);
  $atencionprehospitalaria->setIdExpediente($idExpediente);
  echo $atencionprehospitalaria->actualizar($conexion);
break;

case 'listarPorCentroMedico':

  if(isset($_POST['nombreCentro'])){
    $nombreCentro= $_POST['nombreCentro'];
  }else{
    $nombreCentro=null;
    $res['mensaje']='Se necesita campo: nombreCentro';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }

  if(isset($_POST['idCentroMedico']) && $_POST['idCentroMedico']!=''){
    $idCentroMedico= $_POST['idCentroMedico'];
  }else{
    $idCentroMedico='null';
    $res['mensaje']='Se necesita campo: idCentroMedico';
    $res['resultado']=false;
    echo json_encode($res);
    break;
  }
  $atencionprehospitalaria=new AtencionPreHospitalaria();
  $atencionprehospitalaria->setNombreCentro($nombreCentro);
  $atencionprehospitalaria->setIdCentroMedico($idCentroMedico);
  echo $atencionprehospitalaria->listarPorCentroMedico($conexion);
break;

default:
    $res['mensaje']='Accion no reconocida';
    $res['resultado']=false;
    echo json_encode($res);

}
$conexion->close();
}else{
  $res['mensaje']='Accion no especificada';
  $res['resultado']=false;
  echo json_encode($res);
}
?>