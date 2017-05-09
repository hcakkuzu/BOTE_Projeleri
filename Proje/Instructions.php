<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();

if(!$kullanici->GecerliOturum()){

	$sonuc = $kullanici->db->query("SELECT * FROM dersNotlari");
	$smarty->assign("DersNotuDizi", $sonuc);


	//SMARTY DEĞİŞKENLERİ - STATIK
	if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
	if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
	$smarty->display('Proje/instructionsGuest.tpl');

}else{

$sonuc = $kullanici->db->query("SELECT * FROM dersNotlari");
$smarty->assign("DersNotuDizi", $sonuc);

//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/instructions.tpl');

}
 ?>