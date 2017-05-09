<?php 
include_once '../../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Student"){
	exit();
}
$kisiAdi = $_POST['kisiAdi'];


$kullaniciID=$kullanici->GecerliKullaniciID();

$kullanici->db->bind("ID",$kullaniciID);
$DersID = $kullanici->db->single("SELECT DersID FROM abonelikler WHERE OgrenciID=:ID LIMIT 1;");

$kullanici->db->bind("P_kisiAdi",$kisiAdi);
$kullanici->db->bind("P_GecerliKullaniciID",$kullanici->GecerliKullaniciID());


$kullanici->db->bind("P_dersID",$DersID);

$row = $kullanici->db->query("SELECT Isim,KullaniciID,ProfilFoto FROM kullanicilar INNER JOIN abonelikler ON abonelikler.OgrenciID=kullanicilar.KullaniciID WHERE Isim LIKE concat('%', :P_kisiAdi, '%') AND KullaniciID<>:P_GecerliKullaniciID AND DersID=:P_dersID LIMIT 6;");

if(empty($row)){
	$response['status'] = 'error';
}else{
		$response['status'] = 'success';
		$response['dizi']=$row;
}

echo json_encode($response);
?>
