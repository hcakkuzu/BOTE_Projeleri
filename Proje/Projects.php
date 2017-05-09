<?php 



require '../_Smarty/libs/smartyHeader.php';

include_once '../_Classes/dersler.php';

$kullanici = new dersler();



if(!$kullanici->GecerliOturum()){

	header("Location:Login.php");

	exit();

}

if($kullanici->GecerliKullaniciTuru()!="Teacher"){

	$kullanici->Yonlendir("Dashboard.php");

}



if(!$kullanici->DersiVarMi($kullanici->GecerliKullaniciID())){

	$kullanici->Yonlendir("Lectures.php");

}



$kullanici->db->bind("P_kullaniciID",(int)$kullanici->GecerliKullaniciID());

$dersID = $kullanici->db->single("SELECT DersID FROM dersler WHERE OgretmenID=:P_kullaniciID;");



$kullanici->db->bind("P_dersID",(int)$dersID);

$projeler = $kullanici->db->query("SELECT * FROM projeler INNER JOIN kullanicilar ON kullanicilar.KullaniciID=projeler.ProjeYoneticisiID WHERE DersID=:P_dersID;");



$data = array();

for ($i=0; $i < count($projeler) ; $i++) { 

		$baslangicTarihi = new DateTime($projeler[$i]['Baslangic']);

		$bitisTarihi =  new DateTime($projeler[$i]['Bitis']);

		$difference = $baslangicTarihi->diff($bitisTarihi);

		$gunSayisi=$difference->days;



		$Suan =  new DateTime();

		$difference = $baslangicTarihi->diff($Suan);

		$GecenGunSayisi = $difference->days;



		$sonuc=($GecenGunSayisi*100)/$gunSayisi;
		if($sonuc>100) $sonuc=100;
	 	array_push($data, ceil($sonuc));

}



$smarty->assign("projelerDizi", $projeler);

$smarty->assign("projeSureleri", $data);



//SMARTY DEĞİŞKENLERİ - DATABASE

$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());

$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());

$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());

$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));



//SMARTY DEĞİŞKENLERİ - STATIK

if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }

if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }

$smarty->display('Proje/projects.tpl');

 ?>