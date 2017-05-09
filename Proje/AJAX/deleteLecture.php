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
$kullanici->db->bind("P_kullaniciID",(int)$kullanici->GecerliKullaniciID());
$kullanici->db->bind("P_dersID",(int)$dersID);
$row = $kullanici->db->row("SELECT * FROM dersler WHERE OgretmenID=:P_kullaniciID AND DersID=:P_dersID LIMIT 1;");

if(empty($row)){
	$response['status'] = 'error';
}else{
	if($kullanici->DersSil($dersID)){
		$response['status'] = 'success';
	}else{
		$response['status'] = 'error';
	}
}

echo json_encode($response);
?>
