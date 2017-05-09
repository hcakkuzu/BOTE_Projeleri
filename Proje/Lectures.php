<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}

//if post edit lecture

//end if

$kullanici->db->bind("P_kullaniciID",(int)$kullanici->GecerliKullaniciID());
$dersim = $kullanici->db->row("SELECT * FROM dersler INNER JOIN kullanicilar ON kullanicilar.KullaniciID=dersler.OgretmenID WHERE KullaniciID=:P_kullaniciID LIMIT 1;");

if(!empty($dersim)){
	$dersim['ders']='var';
	$dersID = $dersim['DersID'];
	$kullanici->db->bind("P_dersID",(int)$dersID);
	$dersim['subs'] = $kullanici->db->single("SELECT count(*) FROM abonelikler WHERE DersID=:P_dersID LIMIT 1;");
	$kullanici->db->bind("P_dersID",(int)$dersID);
	$dersim['projects'] = $kullanici->db->single("SELECT count(*) FROM projeler WHERE DersID=:P_dersID LIMIT 1;");
}else{
	$dersim['ders']='yok';
}



$smarty->assign("dersim", $dersim);

//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/lectures.tpl');
 ?>