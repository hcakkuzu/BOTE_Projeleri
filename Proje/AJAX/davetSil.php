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
$kullanici->db->bind("P_kullaniciID",(int)$kullanici->GecerliKullaniciID());
$kullanici->db->bind("P_davetID",(int)$davetID);
$row = $kullanici->db->row("SELECT * FROM davetler WHERE DavetEdilenID=:P_kullaniciID AND DavetID=:P_davetID LIMIT 1;");

if(empty($row)){
	$response['status'] = 'error';
}else{
	if($kullanici->DavetSil($davetID)){
		$response['status'] = 'success';
	}else{
		$response['status'] = 'error';
	}
}

echo json_encode($response);
?>
