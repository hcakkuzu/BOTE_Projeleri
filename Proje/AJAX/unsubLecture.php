<?php 
include_once '../../_Classes/dersler.php';
$kullanici = new Dersler();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Student"){
	exit();
}
$dersID = $_POST['dersID'];
$ogrenciID = $kullanici->GecerliKullaniciID();
$unsub=$kullanici->AboneliktenCik($ogrenciID,$dersID);
if($unsub){
	$response['status'] = 'success';
}else{
	$response['status'] = 'error';
}


echo json_encode($response);
 ?>
