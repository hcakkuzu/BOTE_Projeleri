<?php 



require '../_Smarty/libs/smartyHeader.php';

include_once '../_Classes/kullanici.php';

$kullanici = new Kullanici();


if(!$kullanici->GecerliOturum()){

	header("Location:Login.php");

	exit();

}

if($kullanici->GecerliKullaniciTuru()=="Teacher"){

	//profil düzenlenmiş mi ?
	$sonuc = $kullanici->db->single('SELECT Universite FROM kullanicilar WHERE KullaniciID=:ID LIMIT 1',array('ID' => $kullanici->GecerliKullaniciID() ));
	$smarty->assign("Profil", $sonuc);

	//dersi var mı?
	$sonuc2 = $kullanici->db->row('SELECT * FROM dersler WHERE OgretmenID=:ID LIMIT 1',array('ID' => $kullanici->GecerliKullaniciID() ));
	$smarty->assign("hocaDers", $sonuc2);

	$sonuc3 = $kullanici->db->single('SELECT Count(*) FROM abonelikler WHERE DersID=(SELECT DersID FROM dersler WHERE OgretmenID=:ID)',array('ID' => $kullanici->GecerliKullaniciID() ));
	$smarty->assign("hocaAboneSayi", $sonuc3);
	
	$sonuc4 = $kullanici->db->single('SELECT Count(*) FROM projeler WHERE DersID=(SELECT DersID FROM dersler WHERE OgretmenID=:ID)',array('ID' => $kullanici->GecerliKullaniciID() ));
	$smarty->assign("hocaProjeSayi", $sonuc4);

}else{

	//profil düzenlenmiş mi ?
	$sonuc = $kullanici->db->single('SELECT Universite FROM kullanicilar WHERE KullaniciID=:ID LIMIT 1',array('ID' => $kullanici->GecerliKullaniciID() ));
	$smarty->assign("Profil", $sonuc);

	//dersi var mı?
	$sonuc2 = $kullanici->db->row('SELECT * FROM dersler INNER JOIN abonelikler ON abonelikler.DersID=dersler.DersID WHERE OgrenciID=:ID LIMIT 1',array('ID' => $kullanici->GecerliKullaniciID() ));
	$smarty->assign("ogrenciDers", $sonuc2);

	//proje var mı?

}








//SMARTY DEĞİŞKENLERİ - DATABASE

$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());

$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());

$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());

$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));



//SMARTY DEĞİŞKENLERİ - STATIK

if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }

if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }

$smarty->display('Proje/index.tpl');

 ?>