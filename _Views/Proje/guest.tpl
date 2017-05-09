{extends file='Proje/_layoutGuest.tpl'}
<!-- Index File -->

<!-- Load Lang Files -->
{if $LANG == 'tr'}
    {include file='Proje/_lang_TR.tpl' scope=parent}
    {block name="title"}Ziyaretçi | BÖTE Projeleri{/block}
{else}
    {include file='Proje/_lang_EN.tpl' scope=parent}
    {block name="title"}Guest | CEIT Projects{/block}
{/if}


{block name="head"}
    <!-- NProgress -->
    <link href="../_Vendors/Proje/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../_Vendors/Proje/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="../_Vendors/Proje/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../_Vendors/Proje/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../_Vendors/Proje/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
{/block}

{block name="body"}
<!-- page content -->
        <div class="right_col" role="main">


          <div class="row">

            <div class="col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>{$GUEST}</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="jumbotron"> 
                    <h1>{$WELCOME}.</h1>
                    <p>
                       {$GUEST_JUMBO}
                    </p>
                  
                    </div>
                  <div class="dashboard-widget-content">

                    <ul class="list-unstyled timeline widget">
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title"><a href="ProjectDatabase.php">{$MENU_DATABASE}</a></h2>
                            <p class="excerpt">
                              {$GUEST_DATABASE}
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title"><a href="Instructions.php">{$MENU_INSTRUCTION}</a></h2>
                            <p class="excerpt">
                              {$GUEST_INSTRUCTIONS}
                            </p>
                          </div>
                        </div>
                      </li>
                      
                    </ul>
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
    <!-- Chart.js -->
    <script src="../_Vendors/Proje/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="../_Vendors/Proje/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../_Vendors/Proje/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../_Vendors/Proje/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="../_Vendors/Proje/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="../_Vendors/Proje/Flot/jquery.flot.js"></script>
    <script src="../_Vendors/Proje/Flot/jquery.flot.pie.js"></script>
    <script src="../_Vendors/Proje/Flot/jquery.flot.time.js"></script>
    <script src="../_Vendors/Proje/Flot/jquery.flot.stack.js"></script>
    <script src="../_Vendors/Proje/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="../_Vendors/Proje/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../_Vendors/Proje/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../_Vendors/Proje/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="../_Vendors/Proje/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="../_Vendors/Proje/jqvmap/dist/jquery.vmap.js"></script>
    <script src="../_Vendors/Proje/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="../_Vendors/Proje/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../_Vendors/Proje/moment/min/moment.min.js"></script>
    <script src="../_Vendors/Proje/bootstrap-daterangepicker/daterangepicker.js"></script>
{/block}

{block name="customJs"}

    
    <!-- gauge.js -->
    <script>
      var opts = {
          lines: 12,
          angle: 0,
          lineWidth: 0.4,
          pointer: {
              length: 0.75,
              strokeWidth: 0.042,
              color: '#1D212A'
          },
          limitMax: 'false',
          colorStart: '#1ABC9C',
          colorStop: '#1ABC9C',
          strokeColor: '#F0F3F3',
          generateGradient: true
      };
      var target = document.getElementById('foo'),
          gauge = new Gauge(target).setOptions(opts);

      gauge.maxValue = 100;
      gauge.animationSpeed = 32;
      gauge.set(50);
      gauge.setTextField(document.getElementById("gauge-text"));
    </script>
    <!-- /gauge.js -->
{/block}