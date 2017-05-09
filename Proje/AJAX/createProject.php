<?php 
include_once '../../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Student"){
	exit();
}
$projeAdi = $_POST['projeAdi'];
$projeTuru = $_POST['projeTuru'];
$baslangic = date( 'Y-m-d', strtotime($_POST['baslangic']));
$bitis = date( 'Y-m-d', strtotime($_POST['bitis']));
$ogrenciID = $kullanici->GecerliKullaniciID();
if($kullanici->ProjeOlustur($ogrenciID,$projeAdi,$projeTuru,$baslangic,$bitis)==true){
	$response['status'] = 'success';
	$response['projeAdi'] = $projeAdi;
}
else{
	$response['status'] = 'error';
}


echo json_encode($response);
 ?>
