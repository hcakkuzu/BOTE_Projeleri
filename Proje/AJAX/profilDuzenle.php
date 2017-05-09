<?php 
include_once '../../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciID()!=$_POST['ID']){
	exit();
}
$ID = $_POST['ID'];
$isim = $_POST['isim'];
$sehir = $_POST['sehir'];
$unvan = $_POST['unvan'];
$universite = $_POST['universite'];

	if($kullanici->ProfilDuzenle($ID,$isim,$sehir,$unvan,$universite)){
		$response['status'] = 'success';
	}else{
		$response['status'] = 'error';
	}

echo json_encode($response);
?>
