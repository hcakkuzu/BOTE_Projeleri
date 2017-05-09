<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}

if(!$kullanici->AboneOlmusMu($kullanici->GecerliKullaniciID())){
	$kullanici->Yonlendir("MyLectures.php?error=1");
}

$projeID=$kullanici->ProjesiVarMi($kullanici->GecerliKullaniciID());
if($projeID!=false){
	$kullanici->Yonlendir("ProjectDetails.php?id=$projeID");
}

$kullanici->db->bind("P_kullaniciID",(int)$kullanici->GecerliKullaniciID());
$davetler = $kullanici->db->query("SELECT * FROM davetler INNER JOIN projeler ON davetler.ProjeID=projeler.ProjeID WHERE DavetEdilenID=:P_kullaniciID;");

$smarty->assign("davetlerDizi", $davetler);

//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/projectProposal.tpl');
 ?>