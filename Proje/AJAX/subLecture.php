<?php 
include_once '../../_Classes/dersler.php';
$kullanici = new Dersler();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Student"){
	exit();
}
$subCode = $_POST['subCode'];
$ogrenciID = $kullanici->GecerliKullaniciID();
$DersAdi=$kullanici->DerseAboneOl($ogrenciID,$subCode);
if($DersAdi!=false){
	$response['status'] = 'success';
	$response['dersAdi'] = $DersAdi;
}else{
	$response['status'] = 'error';
}


echo json_encode($response);
 ?>
