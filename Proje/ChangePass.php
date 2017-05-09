<?php 



require '../_Smarty/libs/smartyHeader.php';


include_once '../_Classes/kullanici.php';


$kullanici = new Kullanici();




if(!$kullanici->GecerliOturum()){
	
	
	header("Location:Login.php");
	
	
	exit();
	
	
}




if(isset($_POST['submit'])){

	if($kullanici->ParolaDegistir($kullanici->GecerliKullaniciID(), $_POST['eskiPass'], $_POST['yeniPass'])){
		$smarty->assign("PASS", 'true');
	} else{
		$smarty->assign("PASS", 'false');
	}

}





//SMARTY DEĞİŞKENLERİ - DATABASE

$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());


$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());


$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());


$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));




//SMARTY DEĞİŞKENLERİ - STATIK

if($kullanici->Dil()=="tr") {
	$smarty->assign("LANG", "tr");
}


if($kullanici->Dil()=="en") {
	$smarty->assign("LANG", "en");
}


$smarty->display('Proje/changePass.tpl');


?>