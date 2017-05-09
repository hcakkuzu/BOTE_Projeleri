<?php 
include_once '../../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Student"){
	exit();
}
$ID = $_POST['ID'];

$projeID = $kullanici->ProjesiVarMi($kullanici->GecerliKullaniciID());

if($projeID>0){
	if($kullanici->DavetGonder($ID,$projeID)==true){
		$response['status'] = 'success';
	}else{
		$response['status'] = 'error';
	}
}else{
	$response['status'] = 'error';
}

echo json_encode($response);
?>
