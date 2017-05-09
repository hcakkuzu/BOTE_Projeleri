<?php

/**

 * Basit kullanıcı işlemlerini yapabilen sınıf

 *

 * Date: 11.12.2016

 *

 * @author      Halil Çağrı AKKUZU (hcakkuzu)

 * @git         https://github.com/hcakkuzu

 * @version     0.4_alpha

 *

 * UPDATE

 * construct Güncellendi

 * KullaniciDili Eklendi

 */



# Veritabanı işlemleri için kullanılacak sınıf çağırılıyor.

require("db.class.php");



class kullanici

{

    # @object Veritabanı nesnesi

    public $db;



    # @string Parolaları şifrelerken kullanılan sabit

    private $sifrelemeSabiti="h0Dc6m1AG7";



    /**

     *   Constructor Görevleri

     *

     *	1.Veritabanı nesnesini oluştur

     */

    public function __construct()

    {

        if (session_status() == PHP_SESSION_NONE) {

            session_start();

        }

        $this->db = new Db();

    }



    /**

     * @void    Email adresi ile kayıt olmuş kullanıcı var mı? yoksa false varsa true

     *

     * @param   string $Eposta

     *

     * @return  mixed

     */

    public function KullaniciKayitliMi($Eposta)

    {

        $this->db->bind("P_eposta",(string)$Eposta);

        $row = $this->db->row("SELECT KullaniciID FROM kullanicilar WHERE Eposta=:P_eposta LIMIT 1");

        	

        	if(empty($row)){

        		return false;

        	}else{

        		return true;

        	}



    }





    /**

     * @void    Yeni kullanıcı kayıt eder ve true döndürür.

     *

     * @param   string $Eposta

     * @param   string $Parola

     * @param   string $GuvenlikSorusu

     * @param   string $GuvenlikCevabı

     * @param   string $Isim

     * @param   string $KullaniciTuru

     *

     * @return  mixed

     */

    public function YeniKullanici($Eposta, $Parola, $GuvenlikSorusu, $GuvenlikCevabı, $KullaniciTuru, $Isim)

    {

        $SifrelenmisParola=crypt((string)$Parola, $this->sifrelemeSabiti);

        $this->db->bind("P_eposta",(string)$Eposta);

        $this->db->bind("P_parola", $SifrelenmisParola);

        $this->db->bind("P_guvenlikSorusu",(string)$GuvenlikSorusu);

        $this->db->bind("P_guvenlikCevabi",(string)$GuvenlikCevabı);

        $this->db->bind("P_isim",(string)ucwords(strtolower($Isim)));

        $this->db->bind("P_kullaniciTuru",(string)$KullaniciTuru);

        if($this->db->query("INSERT INTO kullanicilar(Eposta,Parola,GuvenlikSorusu,GuvenlikCevabi,Isim,KullaniciTuru) VALUES(:P_eposta,:P_parola,:P_guvenlikSorusu,:P_guvenlikCevabi,:P_isim,:P_kullaniciTuru);")==1){

        		return true;

        }else{ return false;}



    }



    /**

     * @void    Sisteme giriş yapar ve SESSION oluşturur

     *

     * @param   string $Eposta

     * @param   string $Parola

     *

     * @return  mixed

     */

    public function GirisYap($Eposta, $Parola)

    {

        $SifrelenmisParola=crypt((string)$Parola, $this->sifrelemeSabiti);

        $this->db->bind("P_eposta",(string)$Eposta);

        $row = $this->db->row("SELECT * FROM kullanicilar WHERE Eposta=:P_eposta LIMIT 1;");

        if(!empty($row)){

            if(hash_equals($row['Parola'], $SifrelenmisParola)){

                $_SESSION['GecerliOturum']=true;

                $_SESSION['GecerliKullaniciID']=$row['KullaniciID'];

                $_SESSION['GecerliKullaniciEposta']=$row['Eposta'];

                $_SESSION['GecerliKullaniciIsim']=$row['Isim'];

                $_SESSION['GecerliKullaniciTuru']=$row['KullaniciTuru'];

                return true;

            }else {return false;}

        }else {return false;}

    }



    /**

     * @void    Çıkış yapar ve tüm SESSION ları siler

     *

     */



    public function CikisYap()

    {

        session_unset();

        session_destroy();

    }



    /**

     * @void    Kullanıcının parolasını değiştirir.

     *

     * @param   string $Eposta

     * @param   string $Parola

     * @param   string $YeniParola

     *

     * @return  mixed

     */

    public function ParolaDegistir($ID, $Parola, $YeniParola)

    {

        $SifrelenmisParola=crypt((string)$Parola, $this->sifrelemeSabiti);

        $SifrelenmisYeniParola=crypt((string)$YeniParola, $this->sifrelemeSabiti);

        $this->db->bind("P_ID",(string)$ID);

        $this->db->bind("P_parola",$SifrelenmisParola);

        $KullanilanParola = $this->db->single("SELECT Parola FROM kullanicilar WHERE KullaniciID=:P_ID AND Parola=:P_parola LIMIT 1; ");

        if(hash_equals((string)$KullanilanParola,(string)$SifrelenmisParola)){

            $this->db->bind("P_ID",(string)$ID);

            $this->db->bind("P_parola",$SifrelenmisYeniParola);

            $this->db->query("UPDATE kullanicilar SET Parola=:P_parola WHERE KullaniciID=:P_ID;");

            return true;

        }else{

            return false;

        }





    }





    /**

     * @void    Kullanıcının parolasını değiştirir.

     *

     * @param   string $Eposta

     * @param   string $Parola

     * @param   string $YeniParola

     *

     * @return  mixed

     */

    public function ProfilDuzenle($ID,$isim,$sehir,$unvan,$universite)

    { 

        $this->db->bind("P_ID",(int)$ID);

        $this->db->bind("P_isim",$isim);

        $this->db->bind("P_sehir",$sehir);

        $this->db->bind("P_unvan",$unvan);

        $this->db->bind("P_universite",$universite);

        

        if($this->db->query("UPDATE kullanicilar SET Isim=:P_isim,Unvan=:P_unvan,Sehir=:P_sehir,Universite=:P_universite WHERE KullaniciID=:P_ID;")==1){

        	return true;

        }

        else{ 

        	return false;

        }

    }







    /**

     * @void    İstenilen sayfaya yönlendirilir.

     *

     * @param   string $Sayfa

     * @param   string $Sure

     *

     */

    public function Yonlendir($Sayfa = null, $Sure = null)

    {

    	//Eğer hiç parametre verilmemişse

    	if(empty($Sayfa) && empty($sure)){

    		header('Location: '.$_SERVER['REQUEST_URI']);

    		exit();

    	}

    	//Eğer süre verilmemişse

        if(empty((string)$Sure)){

            header("Location:".(string)$Sayfa);

            exit();

        }else{//Tüm parametreler verilmişse

            header( "refresh:".(string)$Sure.";url=".(string)$Sayfa );

            exit();

        }



    }



    /**

     * @void    Giriş yapmış kullanıcının ID'sini döndürür, yapmamışsa -1 döndürür.

     */

    public function GecerliKullaniciID()

    {

        if(isset($_SESSION['GecerliKullaniciID'])){

            return $_SESSION['GecerliKullaniciID'];

        }else { return -1; }

    }



    /**

     * @void    Giriş yapmış kullanıcının türünü döndürür, yapmamışsa -1 döndürür.

     */

    public function GecerliKullaniciTuru()

    {

        if(isset($_SESSION['GecerliKullaniciTuru'])){

            return $_SESSION['GecerliKullaniciTuru'];

        }else { return -1; }

    }



    /**

     * @void    Giriş yapmış kullanıcının ismini döndürür, yapmamışsa -1 döndürür.

     */

    public function GecerliKullaniciIsim()

    {

        if(isset($_SESSION['GecerliKullaniciIsim'])){

            return $_SESSION['GecerliKullaniciIsim'];

        }else { return -1; }

    }



    /**

     * @void    Giriş yapmış kullanıcının epostasını döndürür, yapmamışsa -1 döndürür.

     */

    public function GecerliKullaniciEposta()

    {

        if(isset($_SESSION['GecerliKullaniciEposta'])){

            return $_SESSION['GecerliKullaniciEposta'];

        }else { return -1; }

    }





    /**

     * @void    Giriş yapmış kullanıcının epostasını döndürür, yapmamışsa -1 döndürür.

     */

    public function KullaniciFoto($ID)

    {

        $this->db->bind("P_ID",(int)$ID);

        return $this->db->single("SELECT ProfilFoto FROM kullanicilar WHERE KullaniciID=:P_ID");

    }





    /**

     * @void    Giriş yapmış kullanıcının epostasını döndürür, yapmamışsa -1 döndürür.

     */

    public function KullaniciTuru($ID)

    {

        $this->db->bind("P_ID",(int)$ID);

        return $this->db->single("SELECT KullaniciTuru FROM kullanicilar WHERE KullaniciID=:P_ID");

    }



    /**

     * @void    Giriş yapılmış ise true yapılmamış ise false döndürür.

     */

    public function GecerliOturum()

    {

        if(isset($_SESSION['GecerliOturum'])){

            return true;

        }else { return false; }

    }



    /**

     * @void    Kullanıcının tercih ettiği dili döndürür.Eğer tercih yapmamışsa tr döndürür.

     *

     * @return string

     */

    public function Dil()

    {

        if(!isset($_COOKIE["Lang"])){

            setcookie("Lang", "tr", time() + (86400 * 30), "/"); // 86400 = 1 day

            return "tr"; 

        }else{

            return $_COOKIE["Lang"];

        }

    }



}



?>