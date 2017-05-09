<!DOCTYPE html>

<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- Meta, title, CSS, favicons, etc. -->

	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1">



	<title>Sıkça Sorulan Sorular</title>

	<!-- Bootstrap -->

	<link href="../_Vendors/Proje/css/bootstrap.min.css" rel="stylesheet">

	<!-- Font Awesome -->

	<link href="../_Vendors/Proje/css/font-awesome.css" rel="stylesheet">

  <style>

  p{
    font-size:16px!important;
  }
  a{
    font-weight: bold!important;
  }

  </style>


	{block name="head"}{/block}



	<!-- Custom Theme Style -->

	<link href="../_Vendors/Proje/css/custom.css" rel="stylesheet">

</head>

<body class="nav-md">

	<div class="container body">

		<div class="main_container">

				<!-- page content -->

				{block name="body"}{/block}

				<!-- /page content -->


			</div>

		</div>



		<!-- jQuery -->

		<script src="../_Vendors/Proje/js/jquery.min.js"></script>

		<!-- Bootstrap -->

		<script src="../_Vendors/Proje/js/bootstrap.min.js"></script>



		{block name="footer"}{/block}



		<!-- Custom Theme Scripts -->

		<script src="../_Vendors/Proje/js/custom.js"></script>



		

		{block name="customJs"}{/block}


</body>

</html>
<!-- Index File -->


{block name="head"}
<!-- NProgress -->
<link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="../_Vendors/Proje/iCheck/skins/flat/green.css" rel="stylesheet">
<link href="../_Vendors/Proje/bootstrap-datetimepicker-master/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

{/block}

{block name="body"}
<!-- page content -->
<div class="right_col" role="main">
  <div class="">


    <div class="row">

        <div class="x_panel">
          <div class="x_title">
            <h2>Sıkça Sorulan Sorular</h2>
           <div class="clearfix"></div>
         </div>




         
    <div class="panel" id="faqAccordion">
        
        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question0">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Nasıl ders oluşturulur?</a>
              </h4>

            </div>
            <div id="question0" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                      Öncelikle ders oluşturmak için öğretmen olmanız gerekmektedir! Sisteme giriş yaptıktan sonra sol menüden
                      <a target="_blank" href="http://boteprojeleri.com/Proje/Lectures.php">Ders</a> sayfasına gidin.
                      Sağ üst bölümdeki <b>Ders Oluştur</b> butonuna basarak ders oluşturma diyaloğunu çalıştırın. Bu ekrandaki talimatları kullanarak dersinizi oluşturabilirsiniz.
                       </p>
                </div>
            </div>
        </div>

        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Nasıl Derse Abone Olunur?</a>
              </h4>

            </div>
            <div id="question1" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                      Öncelikle derse abone olmak için öğrenci olmanız gerekmektedir! Sisteme giriş yaptıktan sonra sol menüden
                      <a target="_blank" href="http://boteprojeleri.com/Proje/MyLectures.php">Dersim</a> sayfasına gidin.
                      Sağ üst bölümdeki <b>Derse Abone Ol</b> butonuna basarak abone olma diyaloğunu çalıştırın. Bu ekrandaki talimatları ve öğretmeninizin verdiği kodu kullanarak 
                      dersinize abone olabilirsiniz.
                       </p>
                </div>
            </div>
        </div>


        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question2">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Nasıl Proje Oluşturulur?</a>
              </h4>

            </div>
            <div id="question2" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                      Öncelikle proje oluşturmak için öğrenci olmanız gerekmektedir! Sisteme giriş yaptıktan sonra sol menüden
                      <a target="_blank" href="ProjectProposal.php">Projem</a> sayfasına gidin.
                      Sağ üst bölümdeki <b>Proje Oluştur</b> butonuna basarak proje oluşturma diyaloğunu çalıştırın. Bu ekrandaki talimatları kullanarak 
                      proje oluşturabilirsiniz.<br>
                      Eğer proje yöneticisi değilseniz proje oluşturmayın! Proje oluşturan kişi otomatik olarak yönetici olacaktır ve bu değiştirilemez. Proje üyeleri, yöneticinin davetini beklemelidir.
                       </p>
                </div>
            </div>
        </div>

        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question3">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Dersimde Yapılmakta Olan Projeleri Nasıl İnceleyebilirim?</a>
              </h4>

            </div>
            <div id="question3" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                      Öğretmen olarak kullanıcı girişi yaptığınız takdirde sol menüdeki <a target="_blank" href="Projects.php">Projeler</a> kısmına tıklayınız.
                      Projeler sayfasında yer alan projelerin sağında bulunan İncele butonuna tıklayarak projeleri inceleyebilirsiniz.
                       </p>
                </div>
            </div>
        </div>


        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question4">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Onaylanmış Projeleri(geçmiş projeler de dahil) Nasıl İnceleyebilirim?</a>
              </h4>

            </div>
            <div id="question4" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                      
                      Giriş yaptığınız zaman (Ziyaretçi hesabı ile de giriş yapabilirsiniz) sol menüde bulunan <a target="_blank" href="ProjectDatabase.php">Proje Veritabanı</a>  kısmına tıklayınız. Proje veritabanı sayfasında bulunan 
                      “anahtar kelime”, “üniversite”, “yıl” bilgilerini girerek istediğiniz projeleri ya da 
                      sadece ara butonuna basarak tüm projeleri inceleyebilirsiniz.
                       </p>
                </div>
            </div>
        </div>


        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question5">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Proje Geliştirme Dersi İle ilgili İçeriğe Nasıl Ulaşabilirim?</a>
              </h4>

            </div>
            <div id="question5" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                      Sisteme giriş yaptığınız zaman (Ziyaretçi hesabı ile de giriş yapabilirsiniz) sol menüde bulunan <a target="_blank" href="Instructions.php">Ders Notları</a> kısmına tıklayınız. 
                      Burada bulunan ders içeriğini isteğinize göre seçip inceleyebilirsiniz.
                       </p>
                </div>
            </div>
        </div>
        

         <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question6">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Sisteme Kayıtlı Kişileri Nasıl Görebilirim, Profillerini Nasıl İnceleyebilirim??</a>
              </h4>

            </div>
            <div id="question6" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>

                      Sisteme eğer üye olduysanız giriş yapıp sol kısımdaki menüden <a target="_blank" href="Contacts.php">İletişim</a> kısmına tıklayınız. 
                      Burada bulunan ara butonuna basarsanız kayıtlı 
                      tüm kişileri görebilirsiniz ve profillerini inceleyebilirsiniz ya da isim ve/veya soy isim bilgisi girerek sadece istediğiniz kişinin profilini inceleyebilirsiniz.   
                       </p>
                </div>
            </div>
        </div>


         <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question7">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Profil Ayarlarımı Nasıl Yapabilirim?</a>
              </h4>

            </div>
            <div id="question7" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                      Sisteme giriş yaptıktan sonra sağ üst kısımda bulunan isminizin bulunduğu açılır menüden 
                      profil kısmına tıklayıp profil ayarlarınızı yapabilirsiniz ya da sol menünün alt kısmında bulunan ayarlar butonuna tıklayıp profil ayarlarınızı yapabilirsiniz.
                       </p>
                </div>
            </div>
        </div>



         <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question8">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Dersime Abone Olan Öğrencileri Nasıl Görebilirim?</a>
              </h4>

            </div>
            <div id="question8" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                     Sisteme öğretmen olarak giriş yaptıysanız ve derse abonelik isteği gönderen öğrencileri kabul ettiyseniz sol menüde 
                     bulunan <a target="_blank" href="http://boteprojeleri.com/Proje/MyLectures.php">Dersim</a> butonuna tıklayınız. 
                     Bu sayfada bulunan aboneler kısmında kaç tane abone olduğunu görebilirsiniz ve 
                     bu kişi sayısına tıklayarak derse abone olanların daha ayrıntılı bir ilstesini görebilirsiniz. Ayrıca dersinize abone olan kişiler arasında arama yapabilirsiniz isterseniz 
                     bu kişileri dersten çıkartabilirsiniz*.

                     <br><br>
                     * Eğer dersten çıkartırsanız varsa projesi silinecektir.
                       </p>
                </div>
            </div>
        </div>



         <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question9">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Abonelik Kodu Nedir? Nasıl Alabilirim?</a>
              </h4>

            </div>
            <div id="question9" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                     Abonelik kodu dersi oluşturan öğretmene sistem tarafından verilen ders kodudur. Böylece öğretmen 
                     öğrencilerine bu kodu vererek sadece kendi öğrencilerinin derse abone olmasını sağlayabilir.
                     <br>
                      Sisteme üye olan öğretmen sol menüde buluna <a target="_blank" href="http://boteprojeleri.com/Proje/Lectures.php">Ders</a> 
                      butonuna tıklayıp dersim sayfasına giriniz. 
                      Eğer dersiniz yoksa bu sayfada bulunan sağ üst kısımdaki Ders oluştur butonuna tıklayınız ve 
                      bilgileri girip dersi oluşturunuz. Sistem ders oluşturduğunuz anda size ders kodunuzu verecektir. Eğer dersiniz varsa abonelik kodunu bu sayfada bulabilirsiniz.
                       </p>
                </div>
            </div>
        </div>



         <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question10">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Sisteme Ziyaretçi Girişi Yaparsak Neleri Görebiliriz?</a>
              </h4>

            </div>
            <div id="question10" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                    Sisteme ziyaretçi olarak giriş yaptıysanız sadece proje veritabanına(daha önce yapılmış projeler) ve ders notlarına ulaşabilirsiniz.
                       </p>
                </div>
            </div>
        </div>


        <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question11">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Proje Detaylarını Nasıl Ayarlarım ve Projeye Dosya Nasıl Eklerim?</a>
              </h4>

            </div>
            <div id="question11" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                    Öğrenci olarak giriş yaptığınız zaman sol menüde bulunan <a target="_blank" href="ProjectProposal.php">Projem</a> butonuna tıklayınız. 
                    Daha sonra bu sayfada bulunan proje ile ilgili detayları ayarlayabilirsiniz ve sisteme projeniz ile ilgili dosyaları ekleyebilirsiniz.
                       </p>
                </div>
            </div>
        </div>


         <div class="panel panel-default ">
            <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question11">
                 <h4 class="panel-title">
                    <a href="#" class="ing">S: Öğrencilerime Nasıl Dönüt Verebilirim?</a>
              </h4>

            </div>
            <div id="question11" class="panel-collapse collapse" style="height: 0px;">
                <div class="panel-body">
                     <h5><span class="label label-primary">Cevap</span></h5>

                    <p>
                    Eğer öğretmen olarak giriş yaptıysanız sol menüde bulunan projeler butonuna tıklayınız. Daha sonra bu sayfada bulunan projeler arasından istediğiniz bir projeyi seçip 
                    o projenin sağ kısmında bulunan incele butonuna tıklayınız. Proje ile ilgili detaylara ulaşabileceğiniz bu sayfanın en alt kısmında pano vardır. Bu panodan 
                    istediğiniz mesajı veya dosyayı projeyi yapan öğrencilerinizle paylaşabilirsiniz.
                    Eğer öğrenci olarak giriş yaptıysanız sol menüde bulunan projem butonuna tıklayınız. Projem sayfasının en alt kısmında 
                    bulunan panoya mesajlarınızı yazabilir ve dosya ekleyebilirsiniz.
                       </p>
                </div>
            </div>
        </div>

    </div>
 

             


        <!-- end project-detail sidebar -->

      </div>
    
  </div>
</div>
</div>
</div>
<!-- /page content -->
{/block}

{block name="footer"}
<!-- jquery ui-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<!-- FastClick -->
<script src="../_Vendors/Proje/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="../_Vendors/Proje/nprogress/nprogress.js"></script>
<!-- EChart.js -->
<script src="../_Vendors/Proje/echarts/dist/echarts.min.js"></script>


{/block}

{block name="customJs"}
  <script>
  $( function() {
    $( "#baslangicTarihTxt" ).datepicker();
    $( "#bitisTarihTxt" ).datepicker();
    $( "#baslangicTarihTxt" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
    $( "#bitisTarihTxt" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
  } );
  </script>
<script type="text/javascript">




$( document ).ready(function() {
    $("#projeTuruTxt").val("{$projeDetaylariDizi.ProjeTuru}").change();
    $("#baslangicTarihTxt").val('{$projeDetaylariDizi.Baslangic|date_format:"%Y-%m-%d"}');
    $("#bitisTarihTxt").val('{$projeDetaylariDizi.Bitis|date_format:"%Y-%m-%d"}');
    $("#projeAciklama").val('{$projeDetaylariDizi.Aciklama}');


    var wage = document.getElementById("kisiAdiTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#araBtn" ).click();
    }
});

var wage = document.getElementById("projeAdiTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#projeDuzenleBtn" ).click();
    }
});

var wage = document.getElementById("projeTuruTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#projeDuzenleBtn" ).click();
    }
});
var wage = document.getElementById("baslangicTarihTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#projeDuzenleBtn" ).click();
    }
});
var wage = document.getElementById("bitisTarihTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#projeDuzenleBtn" ).click();
    }
});

var wage = document.getElementById("gorevTxt");
wage.addEventListener("keydown", function (e) {
    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"
        $( "#gorevKaydet" ).click();
    }
});

});

  function gorevDegistir(str){
    $('#gorevTxt').val(str);
  }

  function sonucEkle(ID,Isim,Foto){
    $('<div class="col-md-4 col-sm-4 col-xs-12 profile_details"><div class="well profile_view"><div class="col-sm-12"><div class="left col-xs-7"><h2>'+Isim+'</h2></div><div class="right col-xs-5 text-center"><img alt="" class="img-circle img-responsive" src="../_Vendors/Proje/images/'+Foto+'?{php}echo time();{/php}"></div></div><div class="col-xs-12 bottom text-center"><div class="col-xs-12 text-center"><a id="btn'+ID+'" class="btn btn-primary btn-xs" onclick="davetEt('+ID+')"><i class="fa fa-user"></i> Davet Et</a></div></div></div></div>').appendTo("#sonuclarDiv");
  }




  $( "#gorevKaydet" ).click(function() {
    var gorev=$('#gorevTxt').val();

    $.ajax({
      type: 'POST',
      url: 'AJAX/gorevDegistir.php',
      data: 'Gorev='+ gorev,
      success: function (data) {

        var data = $.parseJSON(data);
        if( data.status == 'success' ) {

          location.reload();

        }else{
          $('#hata').show( "slow" );
        }
      },
      error: function () {
        $('#hata').show( "slow" );
      }
    });
  });


  $( "#araBtn" ).click(function() {
    var kisiAdi=$("#kisiAdiTxt").val();
    $("#sonuclarDiv").html(" ");
    $.ajax({
      type: 'POST',
      url: 'AJAX/kisilerdeAra.php',
      data: 'kisiAdi='+ kisiAdi,
      success: function (data) {

        var data = $.parseJSON(data);

        if( data.status == 'success' ) {

          $('#hata').hide();
          for(var i=0 ; i <= data.dizi.length-1;i++)
          {
            var item = data.dizi[i];
            sonucEkle(item.KullaniciID,item.Isim,item.ProfilFoto);
          } 

        }else{
          $('#hata').show( "slow" );
        }
      },
      error: function () {
        $('#hata').show( "slow" );
      }
    });
  });


function projeDuzenle(ID){
  var projeAdi=$("#projeAdiTxt").val();
  var projeAciklama=$("#aciklamaTxt").val();
  var projeTuru=$("#projeTuruTxt").val();
  var baslangic=$("#baslangicTarihTxt").val();
  var bitis=$("#bitisTarihTxt").val();

     $.ajax({
      type: 'POST',
      url: 'AJAX/projeDuzenle.php',
      data: 'ID='+ ID+'&projeAdi='+projeAdi+'&projeAciklama='+projeAciklama+'&projeTuru='+projeTuru+'&baslangic='+baslangic+'&bitis='+bitis,
      success: function (data) {
        var data = $.parseJSON(data);
        if( data.status == 'success' ) {

          location.reload();

        }else{
          alert('ERROR!');
        }
      },
      error: function () {
        alert('ERROR!');
      }
    });
  }

  function davetEt(ID){
    var btn = $("#btn"+ID);
    $.ajax({
      type: 'POST',
      url: 'AJAX/projeyeDavetEt.php',
      data: 'ID='+ ID,
      success: function (data) {
        var data = $.parseJSON(data);
        if( data.status == 'success' ) {

          btn.html('Invited');
          btn.attr('class', 'btn btn-success btn-xs');
          btn.attr('onclick', '');

        }else{
          alert('ERROR!');
        }
      },
      error: function () {
        alert('ERROR!');
      }
    });
  }

  function kick(ID){
    $.ajax({
      type: 'POST',
      url: 'AJAX/projedenAt.php',
      data: 'ID='+ ID,
      success: function (data) {
        var data = $.parseJSON(data);
        if( data.status == 'success' ) {

          $("#uye"+ID).hide();

        }else{
          alert('ERROR!');
        }
      },
      error: function () {
        alert('ERROR!');
      }
    });
  }
</script>



<!-- ECharts -->
<script src="../_Vendors/Proje/echarts/dist/echartsCustom.js"></script>
<!-- /ECharts -->

{/block}