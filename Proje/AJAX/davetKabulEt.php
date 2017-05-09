<?php 
include_once '../../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Student"){
	exit();
}
$davetID = $_POST['davetID'];

if($kullanici->DavetVarMi($kullanici->GecerliKullaniciID(),$davetID)==true){
	if($kullanici->DavetiKabulEt($davetID)){
		$response['status'] = 'success';
	}
	else{
		$response['status'] = 'error';
	}
}else{
	$response['status'] = 'error';
}


echo json_encode($response);
?>
