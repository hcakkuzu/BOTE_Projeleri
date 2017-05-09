<?php 
include_once '../../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	exit();
}
/*if($kullanici->GecerliKullaniciTuru()!="Teacher"){
	exit();
}*/
$ID = $_POST['ID'];
$projeAdi = $_POST['projeAdi'];
$projeTuru = $_POST['projeTuru'];
$projeAciklama = $_POST['projeAciklama'];
$baslangic = $_POST['baslangic'];
$bitis = $_POST['bitis'];


	if($kullanici->ProjeDuzenle($ID,$projeAdi,$projeTuru,$projeAciklama,$baslangic,$bitis)){
		$response['status'] = 'success';
	}else{
		$response['status'] = 'error';
	}


echo json_encode($response);
?>
