<?php

/**

 * Basit admin işlemlerini yapabilen sınıf

 *

 * Date: 11.12.2016

 *

 * @author      Halil Çağrı AKKUZU (hcakkuzu)

 * @git         https://github.com/hcakkuzu

 * @version     0.1_alpha

 *

 * UPDATE

 * construct Güncellendi

 * KullaniciDili Eklendi

 */



# Veritabanı işlemleri için kullanılacak sınıf çağırılıyor.

require("db.class.php");



class admin

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

        $row = $this->db->row("SELECT * FROM admin WHERE Eposta=:P_eposta LIMIT 1;");

        if(!empty($row)){

            if(hash_equals($row['Parola'], $SifrelenmisParola)){

                $_SESSION['admin_GecerliOturum']=true;

                $_SESSION['GecerliAdminID']=$row['AdminID'];

                $_SESSION['GecerliAdminEposta']=$row['Eposta'];

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

        $KullanilanParola = $this->db->single("SELECT Parola FROM admin WHERE AdminID=:P_ID AND Parola=:P_parola LIMIT 1; ");

        if(hash_equals((string)$KullanilanParola,(string)$SifrelenmisParola)){

            $this->db->bind("P_ID",(string)$ID);

            $this->db->bind("P_parola",$SifrelenmisYeniParola);

            $this->db->query("UPDATE admin SET Parola=:P_parola WHERE AdminID=:P_ID;");

            return true;

        }else{

            return false;

        }





    }





   



    /**

     * @void    Giriş yapmış kullanıcının ID'sini döndürür, yapmamışsa -1 döndürür.

     */

    public function GecerliAdminID()

    {

        if(isset($_SESSION['GecerliAdminID'])){

            return $_SESSION['GecerliAdminID'];

        }else { return -1; }

    }





    /**

     * @void    Giriş yapmış kullanıcının epostasını döndürür, yapmamışsa -1 döndürür.

     */

    public function GecerliAdminEposta()

    {

        if(isset($_SESSION['GecerliAdminEposta'])){

            return $_SESSION['GecerliAdminEposta'];

        }else { return -1; }

    }




    /**

     * @void    Giriş yapılmış ise true yapılmamış ise false döndürür.

     */

    public function GecerliOturum()

    {

        if(isset($_SESSION['admin_GecerliOturum'])){

            return true;

        }else { return false; }

    }




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


}



?>