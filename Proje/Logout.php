<?php 

include_once '../_Classes/kullanici.php';

$kullanici = new Kullanici();

$kullanici->CikisYap();

$kullanici->Yonlendir("../Proje");

 ?>