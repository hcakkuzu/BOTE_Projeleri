<?php 
include_once '../../_Classes/dersler.php';
$kullanici = new Dersler();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Teacher"){
	exit();
}
$ID = $_GET['ID'];
$kullanici->db->bind("abonelikID",$ID);
$ogrenciID = $kullanici->db->single("SELECT OgrenciID FROM abonelikler WHERE AbonelikID=:abonelikID;");

$kullanici->db->bind("ogrenciID",$ogrenciID);
$kullanici->db->query("DELETE FROM projeler WHERE ProjeYoneticisiID=:ogrenciID;");

$kullanici->db->bind("ogrenciID",$ogrenciID);
$kullanici->db->query("DELETE FROM davetler WHERE DavetEdilenID=:ogrenciID;");

$kullanici->db->bind("abonelikID",$ID);
$kullanici->db->query("DELETE FROM abonelikler WHERE AbonelikID=:abonelikID;");
$response['status'] = 'success';

echo json_encode($response);
 ?>
