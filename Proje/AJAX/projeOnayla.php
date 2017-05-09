<?php 
include_once '../../_Classes/dersler.php';
$kullanici = new Dersler();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Teacher"){
	exit();
}
$id = $_POST['ID'];
$status = $_POST['status'];
$geriBildirim = $_POST['geriBildirim'];
$suan = date('Y-m-d H:i:s');
		$kullanici->db->bind("id",$id);
		$kullanici->db->bind("geriBildirim",$geriBildirim);
		$kullanici->db->bind("status",$status);
		$kullanici->db->bind("suan",$suan);
		$kullanici->db->query("UPDATE projeler SET Durum=:status,Geribildirim=:geriBildirim,GeribildirimTarih=:suan WHERE ProjeID=:id");
		$response['status'] = 'success';

echo json_encode($response);
?>
