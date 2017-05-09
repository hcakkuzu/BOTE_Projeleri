<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}


if(!empty($_GET['id'])){

	$id = $_GET['id'];
	
	$kullanici->db->bind("P_projeID",(int)$id);
	
	$projeDosyalari= $kullanici->db->query("SELECT * FROM projeDosyalari INNER JOIN projeler ON projeler.ProjeID=projeDosyalari.ProjeID WHERE projeDosyalari.ProjeID=:P_projeID");

	
		$kullanici->db->bind("P_projeID",(int)$id);
		$projePano = $kullanici->db->query("SELECT * FROM projepano INNER JOIN kullanicilar ON kullanicilar.KullaniciID=projepano.KullaniciID WHERE ProjeID=:P_projeID ORDER BY PanoID DESC;");
		$kullanici->db->bind("P_projeID",(int)$id);
		$projeDetaylari = $kullanici->db->row("SELECT GeribildirimTarih,Geribildirim,ProfilFoto,ProjeID,ProjeAdi,Aciklama,Baslangic,Bitis,Durum,ProjeYoneticisiID,Isim,Eposta,YoneticiGorev,ProjeTuru FROM projeler INNER JOIN kullanicilar ON kullanicilar.KullaniciID=projeler.ProjeYoneticisiID WHERE ProjeID=:P_projeID;");
		$kullanici->db->bind("P_projeID",(int)$id);
		$dersID = $kullanici->db->single("SELECT DersID FROM projeler WHERE ProjeID=:P_projeID");
		$kullanici->db->bind("dersID",(int)$dersID);
		$hocaID = $kullanici->db->single("SELECT OgretmenID FROM dersler WHERE DersID=:dersID");
		$kullanici->db->bind("hocaID",(int)$hocaID);
		$ogretmenAdi = $kullanici->db->single("SELECT Isim FROM kullanicilar WHERE KullaniciID=:hocaID");
		$smarty->assign("ogretmenAdi", $ogretmenAdi);
		$kullanici->db->bind("P_projeID",(int)$id);
		$projeTakimi= $kullanici->db->query("SELECT DavetID,ProfilFoto,KullaniciID,Isim,Eposta,Gorev FROM davetler INNER JOIN kullanicilar ON kullanicilar.KullaniciID=davetler.DavetEdilenID WHERE ProjeID=:P_projeID AND Onay=1;");

		if($kullanici->GecerliKullaniciID()==$projeDetaylari['ProjeYoneticisiID']){
			$smarty->assign("projeYoneticisi", 'yes');
		}else{
			$smarty->assign("projeYoneticisi", 'no');
		}

		$baslangicTarihi = new DateTime($projeDetaylari['Baslangic']);
		$bitisTarihi =  new DateTime($projeDetaylari['Bitis']);
		$difference = $baslangicTarihi->diff($bitisTarihi);
		$gunSayisi=$difference->days;

		$Suan =  new DateTime();
		$difference = $baslangicTarihi->diff($Suan);
		$GecenGunSayisi = $difference->days;

		$sonuc=($GecenGunSayisi*100)/$gunSayisi;

if($kullanici->GecerliKullaniciTuru()!="Teacher"){

if(!$kullanici->AboneOlmusMu($kullanici->GecerliKullaniciID())){
	$kullanici->Yonlendir("MyLectures.php?error=1");
}

if($kullanici->ProjesiVarMi($kullanici->GecerliKullaniciID())==false){
	$kullanici->Yonlendir("ProjectProposal.php");
}

if(!$kullanici->BuProjeyeUyeMi($kullanici->GecerliKullaniciID(),(int)$id)){
		$kullanici->Yonlendir("ProjectProposal.php");
}
}else{

	if(!$kullanici->DersiMi($kullanici->GecerliKullaniciID(),$id)){
	$kullanici->Yonlendir("Projects.php?error=1");
	}
}


		
		if($sonuc>100) $sonuc=100;
		$smarty->assign("kalanGun", ceil($sonuc));

		$smarty->assign("projeDetaylariDizi", $projeDetaylari);
		$smarty->assign("projeTakimiDizi", $projeTakimi);
		$smarty->assign("projeDosyalariDizi", $projeDosyalari);
		$smarty->assign("projePanoDizi", $projePano);
	
	
	
}




//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/projectDetails.tpl');
?>