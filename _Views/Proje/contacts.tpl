{extends file='Proje/_layout.tpl'}

<!-- Contracts File -->



<!-- Load Lang Files -->

{if $LANG == 'tr'}

    {include file='Proje/_lang_TR.tpl' scope=parent}

    {block name="title"}Kişiler | BÖTE Projeleri{/block}

{else}

    {include file='Proje/_lang_EN.tpl' scope=parent}

    {block name="title"}Contacts | CEIT Projects{/block}

{/if}





{block name="head"}

    <!-- NProgress -->

    <link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">

{/block}



{block name="body"}

<!-- page content -->

        <div class="right_col" role="main">

          <div class="">

            <div class="page-title">

              <div class="title_left">

                <h3>{$CONTACTS}</h3>

              </div>



              

            </div>



            <div class="clearfix"></div>



            <div class="row">

              <div class="col-xs-12">

                <div class="x_panel">

                  <div class="x_content">

                    <div class="row">

                      <div class="col-md-12 col-sm-12 col-xs-12 text-center">

                      <div class="form-group">

                       <input type="text" id="kisiAdiTxt" placeholder="{$CONTACTS_PLCHOLDER}" required="required" class="form-control" />

                      </div>

                      

                        <div class="form-group text-center">

                            <a class="btn btn-primary" id="araBtn">{$SEARCH}</a>

                        </div>

                      </div>



                      <div class="clearfix"></div>



                      <div id="kisiler">



                     </div>



                    </div>

                  </div>

                </div>

              </div>

            </div>

          </div>

        </div>

        <!-- /page content -->

{/block}



{block name="footer"}

	<!-- FastClick -->

    <script src="../_Vendors/Proje/fastclick/lib/fastclick.js"></script>

    <!-- NProgress -->

    <script src="../_Vendors/Proje/nprogress/nprogress.js"></script>

{/block}



{block name="customJs"}



  <script type="text/javascript">

        





function sonucEkle(ID,Isim,Tur,Foto){

  $('<div class="col-md-4 col-sm-4 col-xs-12 profile_details"><div class="well profile_view"><div class="col-sm-12"><h4 class="brief"><i>{$USER}</i></h4><div class="left col-xs-7"><h2>'+Isim+'</h2><p><strong>{$USER_TYPE}: </strong>'+Tur+'</p></div><div class="right col-xs-5 text-center"><img src="../_Vendors/Proje/images/'+Foto+'?{php}echo time();{/php}" alt="" class="img-circle img-responsive"></div></div><div class="col-xs-12 bottom text-center"><div class="col-xs-12 col-sm-6 emphasis"></div><div class="col-xs-12 col-sm-6 emphasis"><a href="Profile.php?id='+ID+'" target="_blank" class="btn btn-primary btn-xs"><i class="fa fa-user"> </i> {$VIEW_PROFILE}</a></div></div></div></div>').appendTo("#kisiler");

}





var wage = document.getElementById("kisiAdiTxt");

wage.addEventListener("keydown", function (e) {

    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"

        $( "#araBtn" ).click();

    }

});



      $( "#araBtn" ).click(function() {

  var kisiAdi=$("#kisiAdiTxt").val();

  $("#kisiler").html(" ");

  $.ajax({

                    type: 'POST',

                    url: 'AJAX/contacts.php',

                    data: 'kisiAdi='+ kisiAdi,

                    success: function (data) {

                      var data = $.parseJSON(data);

                      if( data.status == 'success' ) {

                         for(var i=0 ; i <= data.dizi.length-1;i++)

                          {

                            var item = data.dizi[i];

                            sonucEkle(item.KullaniciID,item.Isim,item.KullaniciTuru,item.ProfilFoto);

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



  </script>



{/block}