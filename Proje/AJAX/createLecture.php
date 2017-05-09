<?php 
include_once '../../_Classes/dersler.php';
$kullanici = new Dersler();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Teacher"){
	exit();
}
$dersAdi = $_POST['dersAdi'];
$univ = $_POST['univ'];
$ogretmenID = $kullanici->GecerliKullaniciID();
$Kod=$kullanici->DersOlustur($dersAdi,$univ,$ogretmenID);
if($Kod!=false){
	$response['status'] = 'success';
	$response['kod'] = $Kod;
}else{
	$response['status'] = 'error';
}


echo json_encode($response);
 ?>
