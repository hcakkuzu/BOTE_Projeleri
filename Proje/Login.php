<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();

if($kullanici->GecerliOturum()==true){
	$kullanici->Yonlendir("Dashboard.php");
}

$smarty->assign("error", "0");

if(isset($_POST['submitRegister'])){
	if($kullanici->KullaniciKayitliMi($_POST['emailTxt'])==false){
		if($kullanici->YeniKullanici($_POST['emailTxt'], $_POST['passTxt'], $_POST['guvenlikSorusuTxt'], $_POST['guvenlikCevabiTxt'], $_POST['kullaniciTuruTxt'], $_POST['isimTxt'])==true){
			if($kullanici->GirisYap($_POST['emailTxt'],$_POST['passTxt'])){
				$kullanici->Yonlendir("Dashboard.php");
			}
		}else{
			$smarty->assign("error", "2");
		}
	}else{
			$smarty->assign("error", "3");
		}
}

if(isset($_POST['submitLogin'])){
	if($kullanici->GirisYap($_POST['emailTxt'],$_POST['passTxt'])==true){
		$kullanici->Yonlendir("Dashboard.php");
	}else{
		$smarty->assign("error", "1");
	}
}



//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/login.tpl');

 ?>