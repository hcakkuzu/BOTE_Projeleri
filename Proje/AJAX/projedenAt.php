<?php 
include_once '../../_Classes/dersler.php';
$kullanici = new Dersler();
if(!$kullanici->GecerliOturum()){
	exit();
}
$ID = $_POST['ID'];
$kullanici->db->bind("davetID",$ID);
$kullanici->db->query("DELETE FROM davetler WHERE DavetID=:davetID;");
$response['status'] = 'success';
echo json_encode($response);
 ?>
