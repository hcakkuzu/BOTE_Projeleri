<?php 

require '../_Smarty/libs/smartyHeader.php';
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();

if(!$kullanici->GecerliOturum()){
	header("Location:Login.php");
	exit();
}

$ID=$kullanici->GecerliKullaniciID();
$kullanici->Yonlendir("Profile.php?id=$ID");

 ?>