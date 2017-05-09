<?php 



require '../_Smarty/libs/smartyHeader.php';

include_once '../_Classes/kullanici.php';

$kullanici = new Kullanici();



if(isset($_GET['submit'])){

	$keyword=$_GET['keywordTxt'];

	$university=$_GET['universityTxt'];

	$year=$_GET['yearTxt'];

	$paramDizi=array();



	$sql="SELECT * FROM projeler INNER JOIN kullanicilar ON kullanicilar.KullaniciID=projeler.ProjeYoneticisiID INNER JOIN dersler ON dersler.DersID=projeler.DersID WHERE Durum=2";

	if(!empty($keyword)){

		$paramDizi['KEYWORD'] = "%".htmlspecialchars($keyword)."%";

		$paramDizi['KEYWORD2'] = "%".htmlspecialchars($keyword)."%";

		$sql.=" AND (ProjeAdi LIKE :KEYWORD OR projeler.Aciklama LIKE :KEYWORD2)";



	}

	if(!empty($university)){

		$paramDizi['UNIVERSITE'] = "%".htmlspecialchars($university)."%";

		$sql.=" AND (DersUniversite LIKE :UNIVERSITE)";

	}

	if(!empty($year)){

		$year=explode(';',$year);

		if($year[0]==$year[1]){

			//tek yıl

			$paramDizi['YIL'] = htmlspecialchars($year[0]);

			$sql.=" AND (YEAR(Baslangic)=:YIL)";

		}else{

			//çift yıl

			$paramDizi['YIL1'] = htmlspecialchars($year[0]);

			$paramDizi['YIL2'] = htmlspecialchars($year[1]);

			$sql.=" AND (YEAR(Baslangic) BETWEEN :YIL1 AND :YIL2)";

			

		}

	}




	//query olustur

	$pdo_connection = $kullanici->db->pdo;



	$stmt = $pdo_connection->prepare($sql);

	$stmt->execute($paramDizi);



	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	

	$smarty->assign("AramaSonucu", $result);

	$smarty->assign("Submit", "true");

}





if(!$kullanici->GecerliOturum()){

	

	//SMARTY DEĞİŞKENLERİ - STATIK

	if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }

	if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }

	$smarty->display('Proje/projectDatabaseGuest.tpl');

	

}else{

	//SMARTY DEĞİŞKENLERİ - DATABASE

	$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());

	$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());

	$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());

	$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));



	//SMARTY DEĞİŞKENLERİ - STATIK

	if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }

	if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }

	$smarty->display('Proje/projectDatabase.tpl');

}





 ?>