<?php 
include_once '../../_Classes/dersler.php';
$kullanici = new Dersler();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Teacher"){
	exit();
}
$dersID = $_POST['dersID'];
$dersAdi = $_POST['dersAdi'];
$dersAciklama = $_POST['dersAciklama'];
$dersStatus = $_POST['dersStatus'];

	if($kullanici->DersDuzenle($dersID,$dersAdi,$dersAciklama,$dersStatus)){
		$response['status'] = 'success';
	}else{
		$response['status'] = 'error';
	}


echo json_encode($response);
?>
