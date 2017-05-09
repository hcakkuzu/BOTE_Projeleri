<?php 
include_once '../../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	exit();
}

$kisiAdi = $_POST['kisiAdi'];

$kullanici->db->bind("P_kisiAdi",$kisiAdi);
$row = $kullanici->db->query("SELECT KullaniciID,Isim,KullaniciTuru,ProfilFoto FROM kullanicilar WHERE Isim LIKE concat('%', :P_kisiAdi, '%') LIMIT 9;");

if(empty($row)){
	$response['status'] = 'error';
}else{
		$response['status'] = 'success';
		$response['dizi']=$row;
}

echo json_encode($response);
?>
