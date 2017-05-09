{extends file='Proje/_layout.tpl'}

<!-- Index File -->



<!-- Load Lang Files -->

{if $LANG == 'tr'} 

{include file='Proje/_lang_TR.tpl' scope=parent} 

{block name="title"}Profil | BÖTE Projeleri{/block}

{else} 

{include file='Proje/_lang_EN.tpl' scope=parent} 

{block name="title"}Profile | CEIT Projects{/block} {/if} {block

name="head"}

<!-- NProgress -->

<link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">

<!-- iCheck -->

<link href="../_Vendors/Proje/iCheck/skins/flat/green.css" rel="stylesheet"> 







{/block} 



{block name="body"}

<!-- page content -->

<div class="right_col" role="main">

  <div class="">

    <div class="page-title">

      <div class="title_left">

        <h3>{$PROF_USR}</h3>

      </div>

    </div>



    <div class="clearfix"></div>





    <div class="modal fade editPhoto" tabindex="-1" role="dialog" aria-hidden="true">

      <div class="modal-dialog modal-md">

        <div class="modal-content">



          <div class="modal-header">

            <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>

                  </button>

            <h4 class="modal-title" id="myModalLabel">{$PHOTO_EDIT}</h4>

          </div>

          <div class="modal-body">

            <p class="alert alert-info"> {$PHOTO_EDIT_P}</p>

            <form action="ProfilFotoYukle.php" method="POST" enctype="multipart/form-data">

            <img id="output" class="img-responsive avatar-view" width="200" height="200" src="../_Vendors/Proje/images/{$KullaniciProfilFoto}?{php}echo time();{/php}"

                    alt="Avatar">

            <label class="control-label">{$PHOTO_SELECT}</label>

            <input required name="profilFoto" type="file" accept="image/*" onchange="loadFile(event)">



            



          </div>

          <div class="modal-footer">

            <button type="submit" name="submit" class="btn btn-primary">{$MODAL_SAVE}</button>

            </form>

            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>

          </div>



        </div>

      </div>

    </div>



    <div class="modal fade editProfile" tabindex="-1" role="dialog" aria-hidden="true">

      <div class="modal-dialog modal-lg">

        <div class="modal-content">



          <div class="modal-header">

            <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>

                  </button>

            <h4 class="modal-title" id="myModalLabel">{$PROF_EDIT}</h4>

          </div>

          <div class="modal-body">



            <form onsubmit="return false;" class="form-horizontal form-label-left" novalidate="">

              <div class="form-group" id="giris">

                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROF_NAME}</label>

                <div class="col-md-6 col-sm-6 col-xs-12">

                  <input type="text" id="isimTxt" placeholder="İsminiz..." required="required" class="form-control col-md-7 col-xs-12" value="{$kullaniciBilgileri.Isim}">

                </div>

              </div>

              <div class="form-group" id="giris">

                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROF_CITY}</label>

                <div class="col-md-6 col-sm-6 col-xs-12">

                  <input type="text" id="sehirTxt" placeholder="Edirne..." required="required" class="form-control col-md-7 col-xs-12" value="{$kullaniciBilgileri.Sehir}">

                </div>

              </div>

              <div class="form-group">

                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROF_TITLE}</label>

                <div class="col-md-6 col-sm-6 col-xs-12">

                  <select id="unvanTxt" class="form-control" value="{$kullaniciBilgileri.Unvan}">

                    <option value="" disabled>{$PROF_SELECT}</option>

                    <option value="Prof. Dr.">Prof. Dr.</option>

                    <option value="Doç. Dr.">Doç. Dr.</option>

                    <option value="Yrd. Doç. Dr.">Yrd. Doç. Dr.</option>

                    <option value="Öğretim Görevlisi">Öğretim Görevlisi</option>

                    <option value="Araştırma Görevlisi">Araştırma Görevlisi</option>

                    <option value="Öğrenci">Öğrenci</option>

	                </select>

                </div>

              </div>

              <div class="form-group">

                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$PROF_UNIV}</label>

                <div class="col-md-6 col-sm-6 col-xs-12">

                  <select id="universiteTxt" class="form-control" value="{$kullaniciBilgileri.Universite}">      

                    <option value="" disabled>{$PROF_SELECT}</option>

                    <option value="Abant İzzet Baysal Üniversitesi">Abant İzzet Baysal Üniversitesi</option>

                    <option value="Abdullah Gül Üniversitesi">Abdullah Gül Üniversitesi</option>

                    <option value="Acıbadem Üniversitesi">Acıbadem Üniversitesi</option>

                    <option value="Adana Bilim ve Teknoloji Üniversitesi">Adana Bilim ve Teknoloji Üniversitesi</option>

                    <option value="Adnan Menderes Üniversitesi">Adnan Menderes Üniversitesi</option>

                    <option value="Adıyaman Üniversitesi">Adıyaman Üniversitesi</option>

                    <option value="Afyon Kocatepe Üniversitesi">Afyon Kocatepe Üniversitesi</option>

                    <option value="Ahi Evran Üniversitesi">Ahi Evran Üniversitesi</option>

                    <option value="Akdeniz Üniversitesi">Akdeniz Üniversitesi</option>

                    <option value="Akev Üniversitesi">Akev Üniversitesi</option>

                    <option value="Aksaray Üniversitesi">Aksaray Üniversitesi</option>

                    <option value="Alanya Alaaddin Keykubat Üniversitesi">Alanya Alaaddin Keykubat Üniversitesi</option>

                    <option value="Alanya Hamdullah Emin Paşa Üniversitesi">Alanya Hamdullah Emin Paşa Üniversitesi</option>

                    <option value="Amasya Üniversitesi">Amasya Üniversitesi</option>

                    <option value="Anadolu Üniversitesi">Anadolu Üniversitesi</option>

                    <option value="Anka Teknoloji Üniversitesi">Anka Teknoloji Üniversitesi</option>

                    <option value="Ankara Sosyal Bilimler Üniversitesi">Ankara Sosyal Bilimler Üniversitesi</option>

                    <option value="Ankara Üniversitesi">Ankara Üniversitesi</option>

                    <option value="Ardahan Üniversitesi">Ardahan Üniversitesi</option>

                    <option value="Artvin Çoruh Üniversitesi">Artvin Çoruh Üniversitesi</option>

                    <option value="Atatürk Üniversitesi">Atatürk Üniversitesi</option>

                    <option value="Atılım Üniversitesi">Atılım Üniversitesi</option>

                    <option value="Avrasya Üniversitesi">Avrasya Üniversitesi</option>

                    <option value="Ağrı İbrahim Çeçen Üniversitesi">Ağrı İbrahim Çeçen Üniversitesi</option>

                    <option value="Bahçeşehir Üniversitesi">Bahçeşehir Üniversitesi</option>

                    <option value="Balıkesir Üniversitesi">Balıkesir Üniversitesi</option>

                    <option value="Bandırma Onyedi Eylül Üniversitesi">Bandırma Onyedi Eylül Üniversitesi</option>

                    <option value="Bartın Üniversitesi">Bartın Üniversitesi</option>

                    <option value="Batman Üniversitesi">Batman Üniversitesi</option>

                    <option value="Bayburt Üniversitesi">Bayburt Üniversitesi</option>

                    <option value="Başkent Üniversitesi">Başkent Üniversitesi</option>

                    <option value="Beykent Üniversitesi">Beykent Üniversitesi</option>

                    <option value="Bezmiâlem Vakıf Üniversitesi">Bezmiâlem Vakıf Üniversitesi</option>

                    <option value="Bilecik Şeyh Edebali Üniversitesi">Bilecik Şeyh Edebali Üniversitesi</option>

                    <option value="Bilkent Üniversitesi">Bilkent Üniversitesi</option>

                    <option value="Bingöl Üniversitesi">Bingöl Üniversitesi</option>

                    <option value="Biruni Üniversitesi">Biruni Üniversitesi</option>

                    <option value="Bitlis Eren Üniversitesi">Bitlis Eren Üniversitesi</option>

                    <option value="Bozok Üniversitesi">Bozok Üniversitesi</option>

                    <option value="Boğaziçi Üniversitesi">Boğaziçi Üniversitesi</option>

                    <option value="Bursa Orhangazi Üniversitesi">Bursa Orhangazi Üniversitesi</option>

                    <option value="Bursa Teknik Üniversitesi">Bursa Teknik Üniversitesi</option>

                    <option value="Bülent Ecevit Üniversitesi">Bülent Ecevit Üniversitesi</option>

                    <option value="Canik Başarı Üniversitesi">Canik Başarı Üniversitesi</option>

                    <option value="Celal Bayar Üniversitesi">Celal Bayar Üniversitesi</option>

                    <option value="Cumhuriyet Üniversitesi">Cumhuriyet Üniversitesi</option>

                    <option value="Çanakkale Onsekiz Mart Üniversitesi">Çanakkale Onsekiz Mart Üniversitesi</option>

                    <option value="Çankaya Üniversitesi">Çankaya Üniversitesi</option>

                    <option value="Çankırı Karatekin Üniversitesi">Çankırı Karatekin Üniversitesi</option>

                    <option value="Çağ Üniversitesi">Çağ Üniversitesi</option>

                    <option value="Çukurova Üniversitesi">Çukurova Üniversitesi</option>

                    <option value="Deniz Harp Okulu">Deniz Harp Okulu</option>

                    <option value="Dicle Üniversitesi">Dicle Üniversitesi</option>

                    <option value="Dokuz Eylül Üniversitesi">Dokuz Eylül Üniversitesi</option>

                    <option value="Doğuş Üniversitesi">Doğuş Üniversitesi</option>

                    <option value="Dumlupınar Üniversitesi">Dumlupınar Üniversitesi</option>

                    <option value="Düzce Üniversitesi">Düzce Üniversitesi</option>

                    <option value="Ege Üniversitesi">Ege Üniversitesi</option>

                    <option value="Erciyes Üniversitesi">Erciyes Üniversitesi</option>

                    <option value="Erzincan Üniversitesi">Erzincan Üniversitesi</option>

                    <option value="Erzurum Teknik Üniversitesi">Erzurum Teknik Üniversitesi</option>

                    <option value="Eskişehir Osmangazi Üniversitesi">Eskişehir Osmangazi Üniversitesi</option>

                    <option value="Fatih Sultan Mehmet Üniversitesi">Fatih Sultan Mehmet Üniversitesi</option>

                    <option value="Fatih Üniversitesi">Fatih Üniversitesi</option>

                    <option value="Fırat Üniversitesi">Fırat Üniversitesi</option>

                    <option value="Galatasaray Üniversitesi">Galatasaray Üniversitesi</option>

                    <option value="Gazi Üniversitesi">Gazi Üniversitesi</option>

                    <option value="Gaziantep Üniversitesi">Gaziantep Üniversitesi</option>

                    <option value="Gaziosmanpaşa Üniversitesi">Gaziosmanpaşa Üniversitesi</option>

                    <option value="Gebze Teknik Üniversitesi">Gebze Teknik Üniversitesi</option>

                    <option value="Gedik Üniversitesi">Gedik Üniversitesi</option>

                    <option value="Gediz Üniversitesi">Gediz Üniversitesi</option>

                    <option value="Giresun Üniversitesi">Giresun Üniversitesi</option>

                    <option value="Gülhane Askeri Tıp Akademisi">Gülhane Askeri Tıp Akademisi</option>

                    <option value="Gümüşhane Üniversitesi">Gümüşhane Üniversitesi</option>

                    <option value="Hacettepe Üniversitesi">Hacettepe Üniversitesi</option>

                    <option value="Hakkari Üniversitesi">Hakkari Üniversitesi</option>

                    <option value="Haliç Üniversitesi">Haliç Üniversitesi</option>

                    <option value="Harran Üniversitesi">Harran Üniversitesi</option>

                    <option value="Hasan Kalyoncu Üniversitesi">Hasan Kalyoncu Üniversitesi</option>

                    <option value="Hava Harp Okulu">Hava Harp Okulu</option>

                    <option value="Hitit Üniversitesi">Hitit Üniversitesi</option>

                    <option value="Iğdır Üniversitesi">Iğdır Üniversitesi</option>

                    <option value="Işık Üniversitesi">Işık Üniversitesi</option>

                    <option value="Kadir Has Üniversitesi">Kadir Has Üniversitesi</option>

                    <option value="Kafkas Üniversitesi">Kafkas Üniversitesi</option>

                    <option value="Kahramanmaraş Sütçü İmam Üniversitesi">Kahramanmaraş Sütçü İmam Üniversitesi</option>

                    <option value="Kanuni Üniversitesi">Kanuni Üniversitesi</option>

                    <option value="Kara Harp Okulu">Kara Harp Okulu</option>

                    <option value="Karabük Üniversitesi">Karabük Üniversitesi</option>

                    <option value="Karadeniz Teknik Üniversitesi">Karadeniz Teknik Üniversitesi</option>

                    <option value="Karamanoğlu Mehmetbey Üniversitesi">Karamanoğlu Mehmetbey Üniversitesi</option>

                    <option value="Karatay Üniversitesi">Karatay Üniversitesi</option>

                    <option value="Kastamonu Üniversitesi">Kastamonu Üniversitesi</option>

                    <option value="Kilis 7 Aralık Üniversitesi">Kilis 7 Aralık Üniversitesi</option>

                    <option value="Kocaeli Üniversitesi">Kocaeli Üniversitesi</option>

                    <option value="Konya Gıda Tarım Üniversitesi">Konya Gıda Tarım Üniversitesi</option>

                    <option value="Koç Üniversitesi">Koç Üniversitesi</option>

                    <option value="Kırklareli Üniversitesi">Kırklareli Üniversitesi</option>

                    <option value="Kırıkkale Üniversitesi">Kırıkkale Üniversitesi</option>

                    <option value="MEF Üniversitesi">MEF Üniversitesi</option>

                    <option value="Maltepe Üniversitesi">Maltepe Üniversitesi</option>

                    <option value="Mardin Artuklu Üniversitesi">Mardin Artuklu Üniversitesi</option>

                    <option value="Marmara Üniversitesi">Marmara Üniversitesi</option>

                    <option value="Mehmet Akif Ersoy Üniversitesi">Mehmet Akif Ersoy Üniversitesi</option>

                    <option value="Melikşah Üniversitesi">Melikşah Üniversitesi</option>

                    <option value="Mersin Üniversitesi">Mersin Üniversitesi</option>

                    <option value="Mevlana Üniversitesi">Mevlana Üniversitesi</option>

                    <option value="Mimar Sinan Güzel Sanatlar Üniversitesi">Mimar Sinan Güzel Sanatlar Üniversitesi</option>

                    <option value="Murat Hüdavendigar Üniversitesi">Murat Hüdavendigar Üniversitesi</option>

                    <option value="Mustafa Kemal Üniversitesi">Mustafa Kemal Üniversitesi</option>

                    <option value="Muğla Sıtkı Koçman Üniversitesi">Muğla Sıtkı Koçman Üniversitesi</option>

                    <option value="Muş Alparslan Üniversitesi">Muş Alparslan Üniversitesi</option>

                    <option value="Namık Kemal Üniversitesi">Namık Kemal Üniversitesi</option>

                    <option value="Necmettin Erbakan Üniversitesi**">Necmettin Erbakan Üniversitesi**</option>

                    <option value="Nevşehir Hacı Bektaş Veli Üniversitesi">Nevşehir Hacı Bektaş Veli Üniversitesi</option>

                    <option value="Niğde Üniversitesi">Niğde Üniversitesi</option>

                    <option value="Nişantaşı Üniversitesi">Nişantaşı Üniversitesi</option>

                    <option value="Nuh Naci Yazgan Üniversitesi">Nuh Naci Yazgan Üniversitesi</option>

                    <option value="İbn-u Haldun Üniversitesi">İbn-u Haldun Üniversitesi</option>

                    <option value="İnönü Üniversitesi">İnönü Üniversitesi</option>

                    <option value="İpek Üniversitesi**">İpek Üniversitesi**</option>

                    <option value="İskenderun Teknik Üniversitesi">İskenderun Teknik Üniversitesi</option>

                    <option value="İstanbul 29 Mayıs Üniversitesi">İstanbul 29 Mayıs Üniversitesi</option>

                    <option value="İstanbul Arel Üniversitesi">İstanbul Arel Üniversitesi</option>

                    <option value="İstanbul Aydın Üniversitesi">İstanbul Aydın Üniversitesi</option>

                    <option value="İstanbul Bilgi Üniversitesi">İstanbul Bilgi Üniversitesi</option>

                    <option value="İstanbul Bilim Üniversitesi">İstanbul Bilim Üniversitesi</option>

                    <option value="İstanbul Esenyurt Üniversitesi">İstanbul Esenyurt Üniversitesi</option>

                    <option value="İstanbul Gelişim Üniversitesi">İstanbul Gelişim Üniversitesi</option>

                    <option value="İstanbul Kemerburgaz Üniversitesi">İstanbul Kemerburgaz Üniversitesi</option>

                    <option value="İstanbul Kültür Üniversitesi">İstanbul Kültür Üniversitesi</option>

                    <option value="İstanbul Medeniyet Üniversitesi">İstanbul Medeniyet Üniversitesi</option>

                    <option value="İstanbul Medipol Üniversitesi">İstanbul Medipol Üniversitesi</option>

                    <option value="İstanbul Rumeli Üniversitesi">İstanbul Rumeli Üniversitesi</option>

                    <option value="İstanbul Sabahattin Zaim Üniversitesi">İstanbul Sabahattin Zaim Üniversitesi</option>

                    <option value="İstanbul Teknik Üniversitesi">İstanbul Teknik Üniversitesi</option>

                    <option value="İstanbul Ticaret Üniversitesi">İstanbul Ticaret Üniversitesi</option>

                    <option value="İstanbul Üniversitesi">İstanbul Üniversitesi</option>

                    <option value="İstanbul Şehir Üniversitesi">İstanbul Şehir Üniversitesi</option>

                    <option value="İstinye Üniversitesi">İstinye Üniversitesi</option>

                    <option value="İzmir Ekonomi Üniversitesi">İzmir Ekonomi Üniversitesi</option>

                    <option value="İzmir Kâtip Çelebi Üniversitesi">İzmir Kâtip Çelebi Üniversitesi</option>

                    <option value="İzmir Yüksek Teknoloji Enstitüsü">İzmir Yüksek Teknoloji Enstitüsü</option>

                    <option value="İzmir Üniversitesi">İzmir Üniversitesi</option>

                    <option value="Okan Üniversitesi">Okan Üniversitesi</option>

                    <option value="Ondokuz Mayıs Üniversitesi">Ondokuz Mayıs Üniversitesi</option>

                    <option value="Ordu Üniversitesi">Ordu Üniversitesi</option>

                    <option value="Orta Doğu Teknik Üniversitesi">Orta Doğu Teknik Üniversitesi</option>

                    <option value="Osmaniye Korkut Ata Üniversitesi">Osmaniye Korkut Ata Üniversitesi</option>

                    <option value="Özyeğin Üniversitesi">Özyeğin Üniversitesi</option>

                    <option value="Pamukkale Üniversitesi">Pamukkale Üniversitesi</option>

                    <option value="Piri Reis Üniversitesi">Piri Reis Üniversitesi</option>

                    <option value="Polis Akademisi">Polis Akademisi</option>

                    <option value="Recep Tayyip Erdoğan Üniversitesi">Recep Tayyip Erdoğan Üniversitesi</option>

                    <option value="Sabancı Üniversitesi">Sabancı Üniversitesi</option>

                    <option value="Sakarya Üniversitesi">Sakarya Üniversitesi</option>

                    <option value="Sanko Üniversitesi">Sanko Üniversitesi</option>

                    <option value="Sağlık Bilimleri Üniversitesi">Sağlık Bilimleri Üniversitesi</option>

                    <option value="Selahattin Eyyubi Üniversitesi">Selahattin Eyyubi Üniversitesi</option>

                    <option value="Selçuk Üniversitesi">Selçuk Üniversitesi</option>

                    <option value="Siirt Üniversitesi">Siirt Üniversitesi</option>

                    <option value="Sinop Üniversitesi">Sinop Üniversitesi</option>

                    <option value="Süleyman Demirel Üniversitesi">Süleyman Demirel Üniversitesi</option>

                    <option value="Süleyman Şah Üniversitesi">Süleyman Şah Üniversitesi</option>

                    <option value="Şifa Üniversitesi">Şifa Üniversitesi</option>

                    <option value="Şırnak Üniversitesi">Şırnak Üniversitesi</option>

                    <option value="TED Üniversitesi">TED Üniversitesi</option>

                    <option value="TOBB Ekonomi ve Teknoloji Üniversitesi">TOBB Ekonomi ve Teknoloji Üniversitesi</option>

                    <option value="Toros Üniversitesi">Toros Üniversitesi</option>

                    <option value="Trakya Üniversitesi">Trakya Üniversitesi</option>

                    <option value="Tunceli Üniversitesi">Tunceli Üniversitesi</option>

                    <option value="Turgut Özal Üniversitesi">Turgut Özal Üniversitesi</option>

                    <option value="Türk Alman Üniversitesi">Türk Alman Üniversitesi</option>

                    <option value="Türk Hava Kurumu Üniversitesi">Türk Hava Kurumu Üniversitesi</option>

                    <option value="Türkiye Uluslararası İslam, Bilim ve Teknoloji Üniversitesi">Türkiye Uluslararası İslam, Bilim ve Teknoloji Üniversitesi</option>

                    <option value="Ufuk Üniversitesi">Ufuk Üniversitesi</option>

                    <option value="Uludağ Üniversitesi">Uludağ Üniversitesi</option>

                    <option value="Uluslararası Antalya Üniversitesi">Uluslararası Antalya Üniversitesi</option>

                    <option value="Uşak Üniversitesi">Uşak Üniversitesi</option>

                    <option value="Üsküdar Üniversitesi">Üsküdar Üniversitesi</option>

                    <option value="Yalova Üniversitesi">Yalova Üniversitesi</option>

                    <option value="Yaşar Üniversitesi">Yaşar Üniversitesi</option>

                    <option value="Yeditepe Üniversitesi">Yeditepe Üniversitesi</option>

                    <option value="Yeni Yüzyıl Üniversitesi">Yeni Yüzyıl Üniversitesi</option>

                    <option value="Yüksek İhtisas Üniversitesi**">Yüksek İhtisas Üniversitesi**</option>

                    <option value="Yüzüncü Yıl Üniversitesi">Yüzüncü Yıl Üniversitesi</option>

                    <option value="Yıldırım Beyazıt Üniversitesi">Yıldırım Beyazıt Üniversitesi</option>

                    <option value="Yıldız Teknik Üniversitesi">Yıldız Teknik Üniversitesi</option>

                    <option value="Zirve Üniversitesi">Zirve Üniversitesi</option>

	                </select>

                </div>

              </div>





              <p id="hata" class="alert alert-danger" style="display:none;">Error!</p>

            </form>



          </div>

          <div class="modal-footer">

            <button id="kaydetBtn" onclick="profilKaydet({$USERID})" type="button" class="btn btn-primary" data-dismiss="modal">{$MODAL_SAVE}</button>

            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>

          </div>



        </div>

      </div>

    </div>





    <div class="row">

      <div class="col-md-12 col-sm-12 col-xs-12">

        <div class="x_panel">

          <div class="x_title">

            <h2>{$PROF_USR}</h2>

            <ul class="nav navbar-right panel_toolbox">

              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>

              </li>

              {if $KendiProfili=='yes'}

                <li><a data-toggle="modal" data-target=".editProfile"><i class="fa fa-pencil"></i> {$PROF_EDIT}</a></li>

              {else}

                <!--Kendi profili değil-->

              {/if}

            </ul>

            <div class="clearfix"></div>

          </div>

          <div class="x_content">

            <div class="col-md-3 col-sm-3 col-xs-12 profile_left">

              <div class="profile_img">

                <div id="crop-avatar">

                  <!-- Current avatar -->

                  <img class="img-responsive avatar-view" width="200" height="200" src="../_Vendors/Proje/images/{$kullaniciBilgileri.ProfilFoto}?{php}echo time();{/php}"

                    alt="Avatar" title="Change the avatar">

                    {if $KendiProfili=='yes'}

                      <div class="text-left" style="margin-top: -24px;margin-left: 2px;"><button data-toggle="modal" data-target=".editPhoto" id="editPhotoBtn" class="btn btn-warning btn-xs"><i class="fa fa-pencil"></i> {$PHOTO_EDIT}</button></div>

                    {else}

                     <!--Kendi profili değil-->

                    {/if}

                  

                </div>

              </div>

              <h3>{$kullaniciBilgileri.Isim}</h3>



              <ul class="list-unstyled user_data">

                <li><i class="fa fa-map-marker user-profile-icon"></i> {$kullaniciBilgileri.Sehir}

                </li>



                <li>

                  <i class="fa fa-briefcase user-profile-icon"></i> {$kullaniciBilgileri.Unvan}

                </li>



                <li class="m-top-xs">

                  <i class="fa fa-globe user-profile-icon"></i> {$kullaniciBilgileri.Universite}

                </li>

                <li class="m-top-xs">

                  <i class="fa fa-external-link user-profile-icon"></i>

                  <a href="mailto:{$kullaniciBilgileri.Eposta}"> {$kullaniciBilgileri.Eposta}</a>

                </li>

              </ul>



              <br />



            </div>

            <div class="col-md-9 col-sm-9 col-xs-12">



              <div class="profile_title">

                <div class="col-md-6">

                  <h2>{$kullaniciBilgileri.KullaniciTuru}</h2>

                </div>





              </div>







              <div class="" role="tabpanel" data-example-id="togglable-tabs">

                <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">

                  <li role="presentation" class="active"><a href="#tab_content1" id="profile-tab" role="tab" data-toggle="tab" aria-expanded="true">

                      Lectures  

                    </a>

                  </li>

                  {if $kullaniciBilgileri.KullaniciTuru=='Student'}

                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="project-tab" data-toggle="tab" aria-expanded="false">Projects</a></li>

                  {/if}

                  </li>

                </ul>

                <div id="myTabContent" class="tab-content">

                  <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="profile-tab">

                    <!-- start user projects -->

                    <table class="data table table-striped no-margin">

                      <thead>

                        <tr>

                          <th>Lecture Name</th>

                          <th>Teacher</th>

                          <th>Created Date</th>

                          <th>Status</th>

                        </tr>

                      </thead>

                      <tbody>

                        <tr>

                          <td>{$dersBilgisi.DersAdi}</td>

                          <td><a href="#">{$dersBilgisi.Isim}</a></td>

                          <td>{$dersBilgisi.Tarih|date_format:"%D"}</td>

                          <td>

                            {if {$dersBilgisi.Aktif}=='1'}

                              <button type="button" class="btn btn-success btn-xs">{$PROJECT_ACTIVE}</button>

                            {else}

                              <button type="button" class="btn btn-danger btn-xs">{$PROJECT_PASSIVE}</button>

                            {/if}

                          </td>

                        </tr>

                      </tbody>

                    </table>

                    <!-- end user projects -->



                  </div>

                  <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="project-tab">



                    <!-- start user projects -->

                    <table class="data table table-striped no-margin">

                      <thead>

                        <tr>

                          <th>{$PROJECT_NAME}</th>

                          <th>{$PROJECT_JOB}</th>

                          <th>{$_DATE}</th>

                          <th>{$PROJECT_STATUS}</th>

                        </tr>

                      </thead>

                      <tbody>

                          {if {$projeBilgisi.ProjeID}>'0'}

                              <tr>

                                <td>{$projeBilgisi.ProjeAdi}</td>

                                <td>{$projeGorev}</td>

                                <td>{$projeBilgisi.Baslangic|date_format:"%D"}</td>

                                <td>

                                  {if {$projeBilgisi.Durum}=='2'}

                                    <button type="button" class="btn btn-success btn-xs">{$_APPROVED}</button>

                                  {else}

                                    <button type="button" class="btn btn-danger btn-xs">{$_UNAPPROVED}</button>

                                  {/if}

                                </td>

                              </tr>

                          {/if}

                        

                      </tbody>

                    </table>

                    <!-- end user projects -->



                  </div>



                </div>

              </div>

            </div>

          </div>

        </div>

      </div>

    </div>

  </div>

</div>

<!-- /page content -->

{/block} {block name="footer"}

<!-- FastClick -->

<script src="../_Vendors/Proje/fastclick/lib/fastclick.js"></script>

<!-- NProgress -->

<script src="../_Vendors/Proje/nprogress/nprogress.js"></script>

<!-- iCheck -->

<script src="../_Vendors/Proje/iCheck/icheck.min.js"></script>

<!-- morris.js -->

<script src="../_Vendors/Proje/raphael/raphael.min.js"></script>

<script src="../_Vendors/Proje/morris.js/morris.min.js"></script>

<!-- bootstrap-progressbar -->

<script src="../_Vendors/Proje/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

<!-- bootstrap-daterangepicker -->

<script src="../_Vendors/Proje/moment/min/moment.min.js"></script>

<script src="../_Vendors/Proje/bootstrap-daterangepicker/daterangepicker.js"></script>







{/block} {block name="customJs"}





<script>  



  var wage = document.getElementById("isimTxt");

wage.addEventListener("keydown", function (e) {

    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"

        $( "#kaydetBtn" ).click();

    }

});

  var wage = document.getElementById("unvanTxt");

wage.addEventListener("keydown", function (e) {

    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"

        $( "#kaydetBtn" ).click();

    }

});

  var wage = document.getElementById("universiteTxt");

wage.addEventListener("keydown", function (e) {

    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"

        $( "#kaydetBtn" ).click();

    }

});

  var wage = document.getElementById("sehirTxt");

wage.addEventListener("keydown", function (e) {

    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"

        $( "#kaydetBtn" ).click();

    }

});





$( document ).ready(function() {

    $("#universiteTxt").val("{$kullaniciBilgileri.Universite}").change();

    $("#unvanTxt").val("{$kullaniciBilgileri.Unvan}").change();

});



var loadFile = function(event) {

    var output = document.getElementById('output');

    output.src = URL.createObjectURL(event.target.files[0]);

  };



function profilKaydet(ID){

  var isim=$("#isimTxt").val();

  var sehir=$("#sehirTxt").val();

  var unvan=$("#unvanTxt").val();

  var universite=$("#universiteTxt").val();



     $.ajax({

      type: 'POST',

      url: 'AJAX/profilDuzenle.php',

      data: 'ID='+ ID+'&isim='+isim+'&sehir='+sehir+'&unvan='+unvan+'&universite='+universite,

      success: function (data) {

        var data = $.parseJSON(data);

        if( data.status == 'success' ) {



          location.reload();



        }else{

          

        }

      },

      error: function () {

        

      }

    });

}







</script>

{/block}