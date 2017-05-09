<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/proje.php';
$kullanici = new Proje();


if(!empty($_GET['id'])){

	$id = $_GET['id'];
	
	$kullanici->db->bind("P_projeID",(int)$id);
	
	$projeDosyalari= $kullanici->db->query("SELECT * FROM projeDosyalari INNER JOIN projeler ON projeler.ProjeID=projeDosyalari.ProjeID WHERE projeDosyalari.ProjeID=:P_projeID");

	
	
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

		$baslangicTarihi = new DateTime($projeDetaylari['Baslangic']);
		$bitisTarihi =  new DateTime($projeDetaylari['Bitis']);
		$difference = $baslangicTarihi->diff($bitisTarihi);
		$gunSayisi=$difference->days;

		$Suan =  new DateTime();
		$difference = $baslangicTarihi->diff($Suan);
		$GecenGunSayisi = $difference->days;

		$sonuc=($GecenGunSayisi*100)/$gunSayisi;

		if($sonuc>100) $sonuc=100;
		$smarty->assign("kalanGun", ceil($sonuc));

		$smarty->assign("projeDetaylariDizi", $projeDetaylari);
		$smarty->assign("projeTakimiDizi", $projeTakimi);
		$smarty->assign("projeDosyalariDizi", $projeDosyalari);

	
}

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/projectArchive.tpl');
?>