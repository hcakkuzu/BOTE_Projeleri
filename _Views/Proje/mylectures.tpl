{extends file='Proje/_layout.tpl'}

<!-- Index File -->



<!-- Load Lang Files -->

{if $LANG == 'tr'}

{include file='Proje/_lang_TR.tpl' scope=parent}

{block name="title"}Dersim | BÖTE Projeleri{/block}

{else}

{include file='Proje/_lang_EN.tpl' scope=parent}

{block name="title"}My Lecture | CEIT Projects{/block}

{/if}





{block name="head"}

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

        <h3>{$MENU_MYLECTURES}</h3>

      </div>

    </div>

    

    <div class="clearfix"></div>



    <div class="row">

      <div class="col-md-12">

        <div class="x_panel">

          <div class="x_title">

            <h2>{$MENU_MYLECTURES}</h2>

            <ul class="nav navbar-right panel_toolbox">

              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>

              </li>

              

              {if {$dersim.ders}=='var'}

                <li><a class="" onclick="aboneliktenCik({$dersim.DersID})"><i class="fa fa-minus"></i> {$LECT_UNSUB}</a></li>

                {else}

                <li><a class="" data-toggle="modal" data-target=".subLecture"><i class="fa fa-plus"></i> {$LECT_SUB}</a></li>

                {/if}

            </ul>

            <div class="clearfix"></div>

          </div>

          <div class="x_content">



             <div class="modal fade subLecture" tabindex="-1" role="dialog" aria-hidden="true">

                    <div class="modal-dialog modal-lg">

                      <div class="modal-content">



                        <div class="modal-header">

                          <button type="button" class="close" data-dismiss="modal" onclick="location.reload()"><span aria-hidden="true">×</span>

                          </button>

                          <h4 class="modal-title" id="myModalLabel">{$LECT_SUB}</h4>

                        </div>

                        <div class="modal-body">







                          <p>{$LECT_SUB_P}</p><p><i>

                            *{$LECT_SUB_P2}</i>

                          </p>

                          <form onsubmit="return false;" class="form-horizontal form-label-left" novalidate="">

                          <div class="form-group" id="giris">

                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">{$LECTURE_SUB_CODE}

                            </label>

                            <div class="col-md-6 col-sm-6 col-xs-12">

                              <input type="text" id="subCodeTxt" placeholder="37952 {$ETC}..." required="required" class="form-control col-md-7 col-xs-12">

                            </div>

                          </div>

                          <p id="hata" class="alert alert-danger" style="display:none;">{$LECTURE_SUB_ERROR}</p>

                          </form>

                        </div>

                        <div class="modal-footer">

                          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.reload()">{$MODAL_CLOSE}</button>

                          <button id="dersAboneOl" type="button" class="btn btn-primary">{$LECT_SUB}</button>

                        </div>



                      </div>

                    </div>

                  </div>







            



            <!-- start project list -->

              <div class="modal-body">

            {if {$dersim.ders}=='var'}

                <div class="x_panel">

                  <div class="x_content">



                    <h3 id="lectureName" class="name"> {$dersim.DersAdi} </h3>

                    <p>

                    {$dersim.Isim}

                    </p>

                    <small>{$CREATED} {$dersim.Tarih|date_format:"%D"}</small>

                    <br>

                    <p id="lectureDesc">

                    {$dersim.Aciklama}

                    </p>

                    <p>

                    {if {$dersim.Aktif}=='1'}

                <button type="button" class="btn btn-success btn-xs">{$PROJECT_ACTIVE}</button>

                {else}

                <button type="button" class="btn btn-danger btn-xs">{$PROJECT_PASSIVE}</button>

                {/if}

                    </p>

                  </div>

                </div>

               

                

                <!--<p class="alert">Duyuru yapmak için aşağıdaki alana duyurunuzu yazıp submit butonuna basın. Derse abone olan herkese bildirim gidecektir.</p>

               <p for="first-name">Announcement</p>

                <textarea style="width: 100%;border: 1px solid #e5e5e5;resize:vertical;" name="Text1" id="first-name" rows="5" required="required"></textarea>-->

                {else}

                <p class="alert alert-info">{$LECTURE_NEW_STU}</p>

                {/if}



              </div>

            <!-- end project list -->



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

<!-- bootstrap-progressbar -->

<script src="../_Vendors/Proje/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

{/block}



{block name="customJs"}

<script type="text/javascript">





  var wage = document.getElementById("subCodeTxt");

wage.addEventListener("keydown", function (e) {

    if (e.keyCode === 13) {  //checks whether the pressed key is "Enter"

        $( "#dersAboneOl" ).click();

    }

});





  $( "#dersAboneOl" ).click(function() {



  var subCode=$("#subCodeTxt").val();

  $.ajax({

                    type: 'POST',

                    url: 'AJAX/subLecture.php',

                    data: 'subCode='+ subCode,

                    success: function (data) {

                      var data = $.parseJSON(data);

                      if( data.status == 'success' ) {

                        location.reload();

                      }else{

                        $("#hata").show();

                      }

                    },

                    error: function () {

                      alert('ERROR!');

                    }

                  });

});



  function aboneliktenCik(ID) {

    if (confirm('Çıkmak istediğinizden emin misiniz?')) {

                // do it!

                if (ID != "") {

                  $.ajax({

                    type: 'POST',

                    url: 'AJAX/unsubLecture.php',

                    data: 'dersID='+ ID,

                    success: function (data) {

                      var data = $.parseJSON(data);      

                      if( data.status == 'success' ) {

                        location.reload();

                      }else{

                        location.reload();

                      }

                    },

                    error: function () {

                      alert('ERROR!');

                    }

                  })

                }

              }   

            }







</script>

{/block}