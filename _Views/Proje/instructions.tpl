{extends file='Proje/_layout.tpl'}
<!-- Index File -->

<!-- Load Lang Files -->
{if $LANG == 'tr'}
    {include file='Proje/_lang_TR.tpl' scope=parent}
    {block name="title"}Dersler | BÖTE Projeleri{/block}
{else}
    {include file='Proje/_lang_EN.tpl' scope=parent}
    {block name="title"}Instructions | CEIT Projects{/block}
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
                <h3>{$MENU_INSTRUCTION}</h3>
              </div>
            </div>

            <div class="clearfix"></div>
          <div class="row">
          	 <div class="col-md-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>{$MENU_INSTRUCTION}</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <ul class="list-unstyled timeline">
                    {foreach $DersNotuDizi as $r} 
                          <li>
                            <div class="block">
                              <div class="tags">
                                <a href="" class="tag">
                                  <span>{$GUEST_INSTRUCTION_UNIT} #{$r@index+1}</span>
                                </a>
                              </div>
                              <div class="block_content">
                                <h2 class="title">
                                                <a href="InstructionDetails.php?id={$r.DersNotuID}">{$r.DersNotuAdi}</a>
                                            </h2>
                                <div class="byline">
                                  <span>by</span> <a>{$r.Hazirlayan}</a>
                                </div>
                                <p class="excerpt">{$r.DersNotuAciklama}
                                </p>
                              </div>
                            </div>
                          </li>
                        {foreachelse}
                          .. no results .. 
                        {/foreach}

                  </ul>

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