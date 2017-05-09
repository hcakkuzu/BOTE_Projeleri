<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}

$kullanici->db->bind("P_kullaniciID",(int)$kullanici->GecerliKullaniciID());
$dersim = $kullanici->db->row("SELECT * FROM abonelikler INNER JOIN dersler ON dersler.DersID=abonelikler.DersID INNER JOIN kullanicilar ON kullanicilar.KullaniciID=dersler.OgretmenID WHERE OgrenciID=:P_kullaniciID LIMIT 1;");

if(!empty($dersim)){
	$dersim['ders']='var';
	$smarty->assign("dersim", $dersim);
	}else{
	$dersim['ders']='yok';
}




//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/mylectures.tpl');
 ?>