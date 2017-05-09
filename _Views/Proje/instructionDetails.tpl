{extends file='Proje/_layout.tpl'}
<!-- Index File -->

<!-- Load Lang Files -->
{if $LANG == 'tr'}
    {include file='Proje/_lang_TR.tpl' scope=parent}
    {block name="title"}Ders Detayları | BÖTE Projeleri{/block}
{else}
    {include file='Proje/_lang_EN.tpl' scope=parent}
    {block name="title"}Instruction Details | CEIT Projects{/block}
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
        <div class="page-title">
              <div class="title_left">
                <h3>{$GUEST_INSTRUCTION}</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="modal fade videoIzle" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">Video | {$DersNotu.DersNotuAdi}</h4>
                </div>
                <div class="modal-body">

                  <iframe width="100%" height="400" src="{$DersNotu.Video}" frameborder="0" allowfullscreen></iframe>
                  
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"{$MODAL_CLOSE}</button>
                </div>

              </div>
            </div>
          </div>

            <div class="modal fade sunumIzle" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">

                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                  </button>
                  <h4 class="modal-title" id="myModalLabel">{$GUEST_PRESENT} | {$DersNotu.DersNotuAdi}</h4>
                </div>
                <div class="modal-body">

                  <iframe src="{$DersNotu.Sunum}" width="100%" height="500" scrolling="no" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                  
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{$MODAL_CLOSE}</button>
                </div>

              </div>
            </div>
          </div>


          <div class="row">
          	 <div class="col-md-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>{$DersNotu.DersNotuAdi}</h2>
                   <div class="clearfix"></div>
                   <small>by {$DersNotu.Hazirlayan}</small>
                </div>
                <div class="x_content">
                  
                  <p class="well">  {$DersNotu.DersNotuAciklama}  </p>
                  
                  {if {$DersNotu.PDF}!=""}
                  <div class="animated flipInY col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="tile-stats"><a href="../files/{$DersNotu.PDF}" target="_blank">
                          <div class="icon"><i class="fa fa-file-pdf-o"></i>
                          </div>
                          <div class="count">PDF</div>

                          <h3 style="font-size:13px;margin-top:16px;">{$DersNotu.PDF}</h3>
                          <p>{$DersNotu.DersNotuAdi} PDF</p>
                        </a></div>
                 </div>
                 {/if}
                 {if {$DersNotu.Video}!=""}
                  <div class="animated flipInY col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="tile-stats"><a data-toggle="modal" data-target=".videoIzle" >
                          <div class="icon"><i class="fa fa-caret-square-o-right"></i>
                          </div>
                          <div class="count">VIDEO</div>

                          <h3 style="font-size:13px;margin-top:16px;">{$DersNotu.DersNotuAdi}</h3>
                          <p>{$DersNotu.DersNotuAdi} Youtube Video</p>
                        </a></div>
                 </div>
                 {/if}
                 {if {$DersNotu.Sunum}!=""}
                  <div class="animated flipInY col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="tile-stats"><a data-toggle="modal" data-target=".sunumIzle" >
                          <div class="icon"><i class="fa fa-file-powerpoint-o"></i>
                          </div>
                          <div class="count" style="text-transform: uppercase">{$GUEST_PRESENT}</div>

                          <h3 style="font-size:13px;margin-top:16px;">{$DersNotu.DersNotuAdi}</h3>
                          <p>{$DersNotu.DersNotuAdi} Online {$GUEST_PRESENT}</p>
                        </a></div>
                 </div>
                  {/if}
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
    <!-- iCheck -->
    <script src="../_Vendors/Proje/iCheck/icheck.min.js"></script>

{/block}

{block name="customJs"}

{/block}