<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}

$ID=(int)$_GET['id'];


$kullanici->db->bind("P_kullaniciID",(int)$ID);
$user = $kullanici->db->row("SELECT Eposta,Isim,Sehir,Universite,Unvan,ProfilFoto,KullaniciTuru FROM kullanicilar WHERE kullaniciID=:P_kullaniciID");
$smarty->assign("kullaniciBilgileri", $user);

if($kullanici->KullaniciTuru($ID)=="Teacher"){
	$kullanici->db->bind("P_kullaniciID",(int)$ID);
	$ders = $kullanici->db->row("SELECT * FROM dersler INNER JOIN kullanicilar ON kullanicilar.KullaniciID=dersler.OgretmenID WHERE OgretmenID=:P_kullaniciID");
	$smarty->assign("dersBilgisi", $ders);
}else{
	$kullanici->db->bind("P_kullaniciID",(int)$ID);
	$ders = $kullanici->db->row("SELECT * FROM abonelikler INNER JOIN dersler ON dersler.DersID=abonelikler.DersID INNER JOIN kullanicilar ON kullanicilar.KullaniciID=dersler.OgretmenID WHERE OgrenciID=:P_kullaniciID");
	$smarty->assign("dersBilgisi", $ders);

	$kullanici->db->bind("P_kullaniciID",(int)$ID);
	$Yonetici = $kullanici->db->row("SELECT * From projeler WHERE ProjeYoneticisiID=:P_kullaniciID");

	if($Yonetici){
		$smarty->assign("projeBilgisi", $Yonetici);
		$smarty->assign("projeGorev", $Yonetici['YoneticiGorev']);
	}else{
		$kullanici->db->bind("P_kullaniciID",(int)$ID);
		$proje = $kullanici->db->row("SELECT * FROM projeler INNER JOIN davetler ON projeler.ProjeID=davetler.ProjeID WHERE DavetEdilenID=:P_kullaniciID AND Onay=1");
		$smarty->assign("projeBilgisi", $proje);
		$smarty->assign("projeGorev", $proje['Gorev']);
	}
	
}

$smarty->assign("KendiProfili", "no");
if($ID==$kullanici->GecerliKullaniciID()){
	$smarty->assign("KendiProfili", "yes");
}

//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/profile.tpl');
 ?>