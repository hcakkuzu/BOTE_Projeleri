<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();

$id=$_GET['id'];

if(!$kullanici->GecerliOturum()){
	
if(isset($id) && !empty($id)){
	$sonuc = $kullanici->db->row('SELECT * FROM dersNotlari WHERE DersNotuID=:ID',array('ID' => $id ));
	if(empty($sonuc)){
		header("Location:Instructions.php");
		exit();
	}
	$smarty->assign("DersNotu", $sonuc);
}else{
	header("Location:Instructions.php");
	exit();
}


//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/instructionDetailsGuest.tpl');

}else{

	if(isset($id) && !empty($id)){
	$sonuc = $kullanici->db->row('SELECT * FROM dersNotlari WHERE DersNotuID=:ID',array('ID' => $id ));
	if(empty($sonuc)){
		header("Location:Instructions.php");
		exit();
	}
	$smarty->assign("DersNotu", $sonuc);
}else{
	header("Location:Instructions.php");
	exit();
}

//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/instructionDetails.tpl');

}


 ?>