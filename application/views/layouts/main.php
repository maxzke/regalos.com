<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Regalos.com</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
    <link rel="icon" href="<?php echo base_url(); ?>assets/img/favicon.ico" type="image/x-icon" />

    <!-- Fonts and icons -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: {
                "families": ["Lato:300,400,700,900"]
            },
            custom: {
                "families": ["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"],
                urls: ['<?php echo base_url(); ?>assets/css/fonts.min.css']
            },
            active: function() {
                sessionStorage.fonts = true;
            }
        });
    </script>

    <!-- CSS Files -->
    
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/atlantis.min.css">

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link type="text/css" rel="stylesheet" href="<?php echo base_url(); ?>assets/css/simple_Cart.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/notfound.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/jquery-ui.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets/css/stilos.css">
</head>

<body class="contenido" style="font-size: 15px;">
    <div class="wrapper">
        <div class="main-header encabezado">
            <!-- Logo Header -->
            <div class="logo-header" data-background-color="black">
                <a href="<?php echo base_url(); ?>" class="logo">
                    <img src="<?php echo base_url(); ?>assets/img/logo.png" alt="navbar brand" class="navbar-brand">
                </a>                
            </div>
            <!-- End Logo Header -->

            <!-- Navbar Header -->
            <nav class="navbar navbar-header navbar-expand-lg" data-background-color="black">

                <div class="container-fluid">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item <?php echo ($pagina_activa == 'venta' ? 'active' : '');  ?>">
                            <a class="nav-link" href="<?php echo site_url('venta');  ?>">
                                <i class="fas fa-shopping-cart fa-lg"></i>
                                Venta
                            <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <?php if ($auth_level==9) { ?>                        
                        <li class="nav-item <?php echo ($pagina_activa == 'historial_ventas' ? 'active' : '');  ?>">
                            <a class="nav-link" href="<?php echo site_url('historial_ventas');  ?>">
                                <i class="fas fa-history fa-lg"></i>
                                Historial Ventas
                            <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item <?php echo ($pagina_activa == 'productos' ? 'active' : '');  ?>">
                            <a class="nav-link" href="<?php echo site_url('productos');  ?>">
                                <i class="fas fa-box-open fa-lg"></i>
                                Productos</a>
                        </li>
                        <li class="nav-item <?php echo ($pagina_activa == 'reportes' ? 'active' : '');  ?>">
                            <a class="nav-link" href="<?php echo site_url('reportes');  ?>">
                                <i class="fas fa-chart-line fa-lg"></i>
                                Corte</a>
                        </li>
                        <li class="nav-item <?php echo ($pagina_activa == 'usuarios' ? 'active' : '');  ?>">
                            <a class="nav-link" href="<?php echo site_url('usuarios');  ?>">
                            <i class="fas fa-users"></i>
                                Usuarios</a>
                        </li>
                        
                        <?php } ?>
                        <li class="nav-item">
                            <div class="date text-secondary mt-2 ml-5">
                                <span id="weekDay" class="weekDay"></span>
                                <span id="day" class="day ml-1"></span> de
                                <span id="month" class="month"></span> del
                                <span id="year" class="year"></span> 
                                <span id="hours" class="hours ml-3"></span> :
                                <span id="minutes" class="minutes"></span> :
                                <span id="seconds" class="seconds"></span>
                            </div>
                             <!--<div class="clock text-secondary">
                                <span id="hours" class="hours"></span> :
                                <span id="minutes" class="minutes"></span> :
                                <span id="seconds" class="seconds"></span>
                            </div> -->
                        </li>
                    </ul>
                    <ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                        
                        
                        <li class="nav-item dropdown hidden-caret">
                            <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false">
                                
                                <li class="nav-item fas fa-user text-success"></li>
                                <span class="text-uppercase text-white">
                                    <strong><?php echo $auth_username; ?></strong>
                                </span>
                                <i class="fas fa-sort-down text-white"></i>
                                
                            </a>
                            <ul class="dropdown-menu dropdown-user animated fadeIn bg-danger">
                                <div class="dropdown-user-scroll scrollbar-outer">                                    
                                    <li>                                       
                                        <a class="dropdown-item" href="<?php echo site_url('login/logout') ?>">
                                            <strong>Finalizar Sesión</strong>
                                        </a>
                                    </li>
                                </div>
                            </ul>
                        </li>                        
                    </ul>
                </div>
            </nav>
            <!-- End Navbar -->
        </div>
        <div class="page-inner bg-secondary">
            <div class="row mt-5">
                <div class="col-md-12">
                    <!-- Custom template | don't include it in your project! -->		
                    <?php	
                        if(isset($_view) && $_view)
                            $this->load->view($_view);
                    ?> 	
                    <!-- End Custom template -->
                </div>
            </div>
        </div>
        
    </div><!-- /wrapper -->
    <!--   Core JS Files   -->
    <script src="<?php echo base_url(); ?>assets/js/core/jquery.3.2.1.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/core/popper.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/core/bootstrap_4.3..min.js"></script>

    <!-- jQuery UI -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


    <!-- Chart JS -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/datatables/datatables.min.js"></script>
    <!-- DataTables Responsivo-Botones Export-   -->
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/JSZip-2.5.0/jszip.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/pdfmake-0.1.32/pdfmake.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/pdfmake-0.1.32/vfs_fonts.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/DataTables-1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/Buttons-1.5.1/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/Buttons-1.5.1/js/buttons.bootstrap4.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/Buttons-1.5.1/js/buttons.colVis.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/Buttons-1.5.1/js/buttons.flash.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/Buttons-1.5.1/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/Buttons-1.5.1/js/buttons.print.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/Responsive-2.2.1/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="<?php echo base_url()?>assets/js/plugin/datatables/datatables/Responsive-2.2.1/js/responsive.bootstrap4.min.js"></script>


    <!-- Bootstrap Notify -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="<?php echo base_url(); ?>assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

    <!-- Sweet Alert 
    <script src="<?php echo base_url(); ?>assets/js/plugin/sweetalert/sweetalert.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/sweetalert2.all.min.js"></script>-->
    <script src="<?php echo base_url(); ?>assets/js/sweetalert2@11.js"></script>
    <!-- ALERTAS COCINA -->
    
    <!-- Atlantis JS -->
    <script src="<?php echo base_url(); ?>assets/js/atlantis.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/clock.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/jQuery.SimpleCart.js"></script>
    <script>
            $('#cart').simpleCart();
        
    </script>
    <script src="<?php echo base_url(); ?>assets/js/tablas.js"></script>
    <script src="<?php echo base_url(); ?>assets/js/alertas.js"></script>
    
</body>

</html>