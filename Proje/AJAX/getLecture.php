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
$kullanici->db->bind("P_dersID",(int)$dersID);
$row = $kullanici->db->row("SELECT * FROM dersler WHERE DersID=:P_dersID LIMIT 1;");

if(empty($row)){
	$response['status'] = 'error';
}else{
		$response['status'] = 'success';
		$response['name'] = $row['DersAdi'];
		$response['desc'] = $row['Aciklama'];
		$response['active'] = $row['Aktif'];
		$response['code'] = $row['Kod'];
		$kullanici->db->bind("P_dersID",(int)$dersID);
		$response['subs'] = $kullanici->db->single("SELECT count(*) FROM abonelikler WHERE DersID=:P_dersID LIMIT 1;");
		$kullanici->db->bind("P_dersID",(int)$dersID);
		$response['projects'] = $kullanici->db->single("SELECT count(*) FROM projeler WHERE DersID=:P_dersID LIMIT 1;");


		/*$("#lectureName").val(data.name);
                        $("#lectureDesc").val(data.desc);
                        $("#lectureSubs").val(data.subs);
                        $("#lectureProjects").val(data.projects);
                        $("#lectureStatus").val(data.status);
                        $("#lectureCode").val(data.code);*/

}

echo json_encode($response);
?>
