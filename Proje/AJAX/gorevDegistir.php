<?php 
include_once '../../_Classes/dersler.php';
$kullanici = new Dersler();

if(!$kullanici->GecerliOturum()){
	exit();
}
if($kullanici->GecerliKullaniciTuru()!="Student"){
	exit();
}
$gorev = $_POST['Gorev'];
	$yonetici = $kullanici->db->single("SELECT ProjeID FROM projeler WHERE ProjeYoneticisiID = :id ", array('id' => $kullanici->GecerliKullaniciID() ) );

	if($yonetici>0){		
		$kullanici->db->bind("P_gorev",$gorev);
		$kullanici->db->bind("P_id",$kullanici->GecerliKullaniciID());
		$kullanici->db->query("UPDATE projeler SET YoneticiGorev=:P_gorev WHERE ProjeYoneticisiID=:P_id");
		$response['status'] = 'success';
	}else{
		$kullanici->db->bind("P_gorev",$gorev);
		$kullanici->db->bind("P_id",$kullanici->GecerliKullaniciID());
		$kullanici->db->query("UPDATE davetler SET Gorev=:P_gorev WHERE DavetEdilenID=:P_id");
		$response['status'] = 'success';
	}


echo json_encode($response);
?>
