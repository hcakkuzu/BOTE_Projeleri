<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/proje.php';
$kullanici = new Proje();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}

$ID=(int)$_GET['id'];


if(isset($_POST['submit'])){
    

          //Get the temp file path
            $tmpFilePath = $_FILES['filesToUpload']['tmp_name'];

            //Make sure we have a filepath
            if($tmpFilePath != ""){
            
                //save the filename
                $shortname = $_FILES['filesToUpload']['name'];

                //save the url and the file
                $filePath = "../projectFiles/" . date('d-m-Y-H-i-s').'-'.$_FILES['filesToUpload']['name'];
		
		        //size check
		        if($_FILES["filesToUpload"]["size"] < 100000000 ){

                //Upload the file into the temp dir
                if(move_uploaded_file($tmpFilePath, $filePath)) {

                    //insert into db 
                    $kullanici->db->bind("id",$ID);
                    $kullanici->db->bind("kid",$kullanici->GecerliKullaniciID());
                    $kullanici->db->bind("isim",$filePath);
                    $kullanici->db->bind("adi",$shortname);
                    $kullanici->db->bind("txt",$_POST['Yazi']);
                    $kullanici->db->query("INSERT INTO projepano(DosyaYolu,DosyaAdi,Yazi,ProjeID,KullaniciID) VALUES(:isim,:adi,:txt,:id,:kid)");
                    
                    //use $shortname for the filename
                    //use $filePath for the relative url to the file

                }
		        }
                
              }else{
                    $kullanici->db->bind("id",$ID);
                    $kullanici->db->bind("kid",$kullanici->GecerliKullaniciID());
                    $kullanici->db->bind("txt",$_POST['Yazi']);
                    $kullanici->db->query("INSERT INTO projepano(Yazi,ProjeID,KullaniciID) VALUES(:txt,:id,:kid)");
              }

                    
    

    header("Location:ProjectDetails.php?id=".$ID);
}




//SMARTY DEĞİŞKENLERİ - DATABASE
$smarty->assign("USERID", (string)$kullanici->GecerliKullaniciID());
$smarty->assign("Name", (string)$kullanici->GecerliKullaniciIsim());
$smarty->assign("KullaniciTuru", (string)$kullanici->GecerliKullaniciTuru());
$smarty->assign("KullaniciProfilFoto", (string)$kullanici->KullaniciFoto($kullanici->GecerliKullaniciID()));

//SMARTY DEĞİŞKENLERİ - STATIK
if($kullanici->Dil()=="tr") { $smarty->assign("LANG", "tr"); }
if($kullanici->Dil()=="en") { $smarty->assign("LANG", "en"); }
$smarty->display('Proje/pin.tpl');
 ?>