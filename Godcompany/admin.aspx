<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="Godcompany.admin" %>

<!DOCTYPE html>

<head>
    <title>Mega Able bootstrap admin template by codedthemes </title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
      <!-- Meta -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
      <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
      <meta name="author" content="codedthemes" />
      <!-- Favicon icon -->
      <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify icon -->
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- scrollbar.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
        <!-- am chart export.css -->
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">



    <script src="swalert.js" type="text/javascript"></script>




        <script>
            function error_data() {

              


                Swal.fire({
                    padding: '8em',
                        width: 600,
                        position: 'center',
                        icon: 'question',
                        title: 'Cuidado existe um pack com uma data de inicio já ultrapassada',
                        showConfirmButton: false,
                        timer: 6000
                    })
                

                
            }

        </script>

  </head>


  <body style="background-color:white">
      <form runat="server">  <!-- Pre-loader start -->
  <div class="theme-loader">
      <div class="loader-track">
          <div class="preloader-wrapper">
              <div class="spinner-layer spinner-blue">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
              <div class="spinner-layer spinner-red">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-yellow">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
            
              <div class="spinner-layer spinner-green">
                  <div class="circle-clipper left">
                      <div class="circle"></div>
                  </div>
                  <div class="gap-patch">
                      <div class="circle"></div>
                  </div>
                  <div class="circle-clipper right">
                      <div class="circle"></div>
                  </div>
              </div>
          </div>
      </div>
  </div>

                      <!-- Page-header end -->
                        <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-body start -->
                                    <div class="page-body">
                                        <div class="row">
                                            <!-- task, page, download counter  start -->
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-purple"> <asp:Label ID="clientes" runat="server" Text="Label"></asp:Label></h4>
                                                                <h6 class="text-muted m-b-0">Clientes</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-bar-chart f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-purple">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                               
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
            
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-green">
                                                                    <asp:Label ID="voos" runat="server" Text="Label"></asp:Label><h4>
                                                                <h6 class="text-muted m-b-0">Voos</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-file-text-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-green">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                                
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-red"><asp:Label ID="hoteis" runat="server" Text="Label"></asp:Label></h4>
                                                                <h6 class="text-muted m-b-0">Hoteis</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-calendar-check-o f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-red">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                           
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-3 col-md-6">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row align-items-center">
                                                            <div class="col-8">
                                                                <h4 class="text-c-blue"><asp:Label ID="atividades" runat="server" Text="Label"></asp:Label></h4>
                                                                <h6 class="text-muted m-b-0">Atividades</h6>
                                                            </div>
                                                            <div class="col-4 text-right">
                                                                <i class="fa fa-hand-o-down f-28"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-c-blue">
                                                        <div class="row align-items-center">
                                                            <div class="col-9">
                                                            
                                                            </div>
                                                            <div class="col-3 text-right">
                                                                <i class="fa fa-line-chart text-white f-16"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- task, page, download counter  end -->
    
                                          
                                            <div class="col-xl-4 col-md-12">
                                                <div class="card">
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col">
                                                                <h4>
                                                                    <asp:Label ID="lb_preco_desde_inicio" runat="server" Text="$256.23"></asp:Label></h4>
                                                                <p class="text-muted">Desde o inicio</p>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-8">
                                                                <canvas id="this-month" style="height: 150px;"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                   
                                                <div class="card quater-card">
                                                    <div class="card-block">
                                                        <h6 class="text-muted m-b-15">Hoje</h6>
                                                        <h4><asp:Label ID="preco_hoje" runat="server" Text=""></asp:Label></h4>
                                                        <p class="text-muted">
                                                            </p>
                                                        <h5>
                                                            <asp:Label ID="adultos" runat="server" Text=""></asp:Label></h5>
                                                        <p class="text-muted">Adultos</p>
                                                        <div class="progress"><div class="progress-bar bg-c-blue" style="width: 100%"></div></div>
                                                        <h5 class="m-t-15"><asp:Label ID="criancas" runat="server" Text=""></asp:Label></h5>
                                                        <p class="text-muted">Crianças</p>
                                                        <div class="progress"><div class="progress-bar bg-c-green" style="width: 100%"></div></div>
                                                    </div>
                                                </div>
                                            </div>


                                            <!--  sale analytics end -->
    
                                            <!--  project and team member start -->
                                            <div class="col-xl-8 col-md-12">
                                                <div class="card table-card">
                                                    <div class="card-header">
                                                        <h5>Ultimas reservas</h5>
                                                        <div class="card-header-right">
                                                        
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="table-responsive">
                                                            <table class="table table-hover">
                                                                <thead>
                                                                <tr>
                                                                   
                                                                    <th>Mail</th>
                                                                    <th>Data entrada e data saida</th>
                                                                    <th style="color:white">.</th>
                                                                    <th class="text-right">Prioridade</th>
                                                                </tr>
                                                                </thead>
                                                                <body>
                                                                <tr>
                                                                    <td>
                                                                      
                                                                        <div class="d-inline-block align-middle">

                                                                            <div class="d-inline-block">
                                                                                <h6>
                                                                                    <asp:Label ID="nome_cliente1" runat="server" Text=""></asp:Label></h6>
                                                                                <p class="text-muted m-b-0">
                                                                                    <asp:Label ID="tipo_reserva" runat="server" Text=""></asp:Label></p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td><asp:Label ID="data_entrada_cliente1" runat="server" Text=""></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label ID="data_saida_cliente1" runat="server" Text=""></asp:Label></td>

                                                                    <asp:Panel ID="mostrar_hoje_cliente1" runat="server" Visible ="false">
                                                                         <td class="text-right"><label class="label label-primary">Recente</label></td>
                                                                    </asp:Panel>

                                                                    <asp:Panel ID="mostrar_amanha_cliente1" runat="server" Visible ="false">
                                                                        <td class="text-right"><label class="label label-danger">Antigo</label></td>
                                                                    </asp:Panel>


                                                                    


                                                                </tr>
                                                                
                                                                                    <tr>
                                                                    <td>
                                                                      
                                                                        <div class="d-inline-block align-middle">

                                                                            <div class="d-inline-block">
                                                                                <h6>
                                                                                    <asp:Label ID="nome_cliente2" runat="server" Text=""></asp:Label></h6>
                                                                                <p class="text-muted m-b-0">
                                                                                    <asp:Label ID="tipo_reserva_cliente2" runat="server" Text=""></asp:Label></p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td><asp:Label ID="data_entrada_cliente2" runat="server" Text=""></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label ID="data_saida_cliente2" runat="server" Text=""></asp:Label></td>

                                                                    <asp:Panel ID="mostrar_hoje_cliente2" runat="server" Visible ="false">
                                                                         <td class="text-right"><label class="label label-primary">Recente</label></td>
                                                                    </asp:Panel>

                                                                    <asp:Panel ID="mostrar_amanha_cliente2" runat="server" Visible ="false">
                                                                        <td class="text-right"><label class="label label-danger">Antigo</label></td>
                                                                    </asp:Panel>


                                                                    


                                                                </tr>
                                                                   
                                                                                    <tr>
                                                                    <td>
                                                                      
                                                                        <div class="d-inline-block align-middle">

                                                                            <div class="d-inline-block">
                                                                                <h6>
                                                                                    <asp:Label ID="nome_cliente3" runat="server" Text=""></asp:Label></h6>
                                                                                <p class="text-muted m-b-0">
                                                                                    <asp:Label ID="tipo_reserva_cliente3" runat="server" Text=""></asp:Label></p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td><asp:Label ID="data_entrada_cliente3" runat="server" Text=""></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label ID="data_saida_cliente3" runat="server" Text=""></asp:Label></td>

                                                                    <asp:Panel ID="mostrar_hoje_cliente3" runat="server" Visible ="false">
                                                                         <td class="text-right"><label class="label label-primary">Recente</label></td>
                                                                    </asp:Panel>

                                                                    <asp:Panel ID="mostrar_amanha_cliente3" runat="server" Visible ="false">
                                                                        <td class="text-right"><label class="label label-danger">Antigo</label></td>
                                                                    </asp:Panel>


                                                                    


                                                                </tr>

                                                                                    <tr>
                                                                    <td>
                                                                      
                                                                        <div class="d-inline-block align-middle">

                                                                            <div class="d-inline-block">
                                                                                <h6>
                                                                                    <asp:Label ID="nome_cliente4" runat="server" Text=""></asp:Label></h6>
                                                                                <p class="text-muted m-b-0">
                                                                                    <asp:Label ID="tipo_reserva_cliente4" runat="server" Text=""></asp:Label></p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td><asp:Label ID="data_entrada_cliente4" runat="server" Text=""></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label ID="data_saida_cliente4" runat="server" Text=""></asp:Label></td>

                                                                    <asp:Panel ID="mostrar_hoje_cliente4" runat="server" Visible ="false">
                                                                         <td class="text-right"><label class="label label-primary">Recente</label></td>
                                                                    </asp:Panel>

                                                                    <asp:Panel ID="mostrar_amanha_cliente4" runat="server" Visible ="false">
                                                                        <td class="text-right"><label class="label label-danger">Antigo</label></td>
                                                                    </asp:Panel>


                                                                    


                                                                </tr>

                                                                                    <tr>
                                                                    <td>
                                                                      
                                                                        <div class="d-inline-block align-middle">

                                                                            <div class="d-inline-block">
                                                                                <h6>
                                                                                    <asp:Label ID="nome_cliente5" runat="server" Text=""></asp:Label></h6>
                                                                                <p class="text-muted m-b-0">
                                                                                    <asp:Label ID="tipo_reserva_cliente5" runat="server" Text=""></asp:Label></p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td><asp:Label ID="data_entrada_cliente5" runat="server" Text=""></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label ID="data_saida_cliente5" runat="server" Text=""></asp:Label></td>

                                                                    <asp:Panel ID="mostrar_hoje_cliente5" runat="server" Visible ="false">
                                                                         <td class="text-right"><label class="label label-primary">Recente</label></td>
                                                                    </asp:Panel>

                                                                    <asp:Panel ID="mostrar_amanha_cliente5" runat="server" Visible ="false">
                                                                        <td class="text-right"><label class="label label-danger">Antigo</label></td>
                                                                    </asp:Panel>


                                                                    


                                                                </tr>

                                                           

                                                                    
                                                                     <%--<tr>





                                                                    <td>
                                                                        <div class="chk-option">
                                                                            <div class="checkbox-fade fade-in-primary">
                                                                                <label class="check-task">
                                                                                    <input type="checkbox" value="">
                                                                                    <span class="cr">
                                                                                                <i class="cr-icon fa fa-check txt-default"></i>
                                                                                            </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="d-inline-block align-middle">
                                                                            <img src="admin/assets/images/avatar-2.jpg" alt="user image" class="img-radius img-40 align-top m-r-15">
                                                                            <div class="d-inline-block">
                                                                                <h6>David Jones</h6>
                                                                                <p class="text-muted m-b-0">Developer</p>
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                    <td>Guruable</td>
                                                                    <td>Sep, 22</td>
                                                                    <td class="text-right"><label class="label label-primary">high</label></td>
                                                                </tr>      <td class="text-right"><label class="label label-success">medium</label></td>
                                                                </tr>--%>
                                                         








                                                                </body>
                                                            </table>
                                                          
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
   

    <footer>
        
      
                    <asp:Button ID="signup_form_submit" runat="server" Text="Gerir" class="btn btn-primary btn-lg btn-block" style="margin-top:15px" OnClick ="signup_form_submit_Click" />
                            
    </footer> 

          </form>



    <!-- Warning Section Ends -->
    
    <!-- Required Jquery -->
    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
   <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>
    <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
   <script type="text/javascript" src="assets/pages/widget/excanvas.js "></script>
    <!-- waves js -->
    <script src="assets/pages/waves/js/waves.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="assets/js/modernizr/modernizr.js "></script>
    <!-- slimscroll js -->
    <script type="text/javascript" src="assets/js/SmoothScroll.js"></script>
    <script src="assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
    <!-- Chart js -->
    <script type="text/javascript" src="assets/js/chart.js/Chart.js"></script>
    <!-- amchart js -->
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="assets/pages/widget/amchart/gauge.js"></script>
    <script src="assets/pages/widget/amchart/serial.js"></script>
    <script src="assets/pages/widget/amchart/light.js"></script>
    <script src="assets/pages/widget/amchart/pie.min.js"></script>
    <script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
    <!-- menu js -->
    <script src="assets/js/pcoded.min.js"></script>
    <script src="assets/js/vertical-layout.min.js "></script>
    <!-- custom js -->
   <script type="text/javascript" src="assets/pages/dashboard/custom-dashboard.js"></script>
    <script type="text/javascript" src="assets/js/script.js "></script>

</body>

</html>
