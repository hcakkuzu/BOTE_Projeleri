<?php 
include_once '../_Classes/kullanici.php';
$kullanici = new Kullanici();
if($kullanici->GecerliOturum()==true){
	header("Location:Dashboard.php");
	exit();
}else{
	header("Location:Login.php");
	exit();
}
 ?>