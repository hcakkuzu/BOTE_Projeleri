<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}



if(isset($_POST['submit'])){
    if(count($_FILES['filesToUpload']['name']) > 0){
        //Loop through each file
        for($i=0; $i<count($_FILES['filesToUpload']['name']); $i++) {
          //Get the temp file path
            $tmpFilePath = $_FILES['filesToUpload']['tmp_name'][$i];

            //Make sure we have a filepath
            if($tmpFilePath != ""){
            
                //save the filename
                $shortname = $_FILES['filesToUpload']['name'][$i];

                //save the url and the file
                $filePath = "../projectFiles/" . date('d-m-Y-H-i-s').'-'.$_FILES['filesToUpload']['name'][$i];
		
		        //size check
		        if($_FILES["filesToUpload"]["size"][$i] < 100000000 ){

                //Upload the file into the temp dir
                if(move_uploaded_file($tmpFilePath, $filePath)) {

                    $files[] = $shortname;
                    //insert into db 
                    $kullanici->db->bind("projeID",$kullanici->ProjesiVarMi($kullanici->GecerliKullaniciID()));
                    $kullanici->db->bind("isim",$filePath);
                    $kullanici->db->bind("adi",$shortname);
                    $kullanici->db->query("INSERT INTO projeDosyalari(DosyaYolu,ProjeID,DosyaAdi) VALUES(:isim,:projeID,:adi)");
                    
                    //use $shortname for the filename
                    //use $filePath for the relative url to the file

                }
		        }
                
              }
        }
    }

    header("Location:ProjectProposal.php");
}




//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/uploadFile.tpl');
 ?>