<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_login.Master" AutoEventWireup="true" CodeBehind="editar_login.aspx.cs" Inherits="Godcompany.editar_login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <script src="swalert.js" type="text/javascript"></script>


    <head>

        <script>
            function Correct() {

              


                Swal.fire({
                    padding: '8em',
                        width: 600,
                        position: 'center',
                        icon: 'success',
                        title: 'Conta editada com sucesso',
                        showConfirmButton: false,
                        timer: 3000
                    })
                

                
            }



            function Error_conta() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Campos por preencher.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }



            function Error_editar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de editar o quarto, tem de escolher o quarto que quer editar na tabela que se encontra na parte superior da tela.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }

            function Error_apagar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de apagar o hotel, tem de escolher o hotel que quer apagar na tabela que se encontra na parte superior da tela.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }

            function Error_existe_algo_associado() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Se existir qualquer tipo de produto associado a este quarto não é possivel eliminá lo',
                    showConfirmButton: false,
                    timer: 5000
                })



            }



            function Correct_apagar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'success',
                    title: 'Quarto eliminado com sucesso',
                    showConfirmButton: false,
                    timer: 5000
                })



            }

            function Error_foto() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'O preenchimento da foto é obrigatorio para concluir este processo',
                    showConfirmButton: false,
                    timer: 5000
                })



            }

            function error_nao_escolher() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de criar qualquer quarto, tem de escolher o hotel que pretende o assuciar',
                    showConfirmButton: false,
                    timer: 8500
                })



            }


            function error_pass() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'A password tem de ser igual a confirmar password',
                    showConfirmButton: false,
                    timer: 8500
                })



            }
        </script>

    </head>
    
    <html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      
        <!-- Font online-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
      
<!--        Animate.css-->
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
                
                                
        <link rel="stylesheet" href="css/main.css" >
        
        <!-- Google JQuery CDN -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        
        <script src="js/form.js"></script>

    </head>

      






    <body class="gtco-cover gtco-cover-md"  >


        <div>
           <div class="panel shadow1">
             <form class="login-form">   
                
               
                    <fieldset id="signup-fieldset" >
                        <asp:TextBox ID="username_signup" runat="server" class="login animated fadeInUp animate2" placeholder="Username" BorderStyle ="Solid" Height="40px" ForeColor="White"  Font-Size="Large"></asp:TextBox>
                        <asp:TextBox ID="password_signup" runat="server" class="login animated fadeInUp animate2" placeholder="Password" BorderStyle ="Solid" Height="40px" ForeColor="White"  TextMode="Password" Font-Size="Large"></asp:TextBox>
                         <asp:TextBox ID="confirmar_password" runat="server" class="login animated fadeInUp animate2" placeholder="Confirmar Password" BorderStyle ="Solid" Height="40px" ForeColor="White"  TextMode="Password" Font-Size="Large"></asp:TextBox>
                        <asp:TextBox ID="c_cidadao_signup" runat="server" class="login animated fadeInUp animate2" placeholder="Cartão Cidadão" BorderStyle ="Solid" Height="40px" ForeColor="White"  Font-Size="Large"></asp:TextBox>
                        <asp:TextBox ID="mail_signup" runat="server" class="login animated fadeInUp animate2" placeholder="Email" BorderStyle ="Solid" Height="40px" ForeColor="White"  Enabled="true" Font-Size="Large"></asp:TextBox> 
                        <asp:TextBox ID="idade_signup" runat="server" class="login animated fadeInUp animate2" placeholder="idade" ToolTip="Data de nascimento" BorderStyle ="Solid" Height="40px" ForeColor="White"  TextMode="Date" Font-Size="Large" > </asp:TextBox>
                        <asp:Button ID="signup_form_submit" runat="server" Text="Editar" class="<%--login_form--%> button animated fadeInUp animate4" OnClick ="signup_form_submit_Click" Height="60px" BackColor="#40E0D0" Font-Size="Large"/>
                         <asp:Button ID="voltar" runat="server" Text="Voltar" class="<%--login_form--%> button animated fadeInUp animate4" OnClick ="voltar_Click" Height="60px" BackColor="#40E0D0" Font-Size="Large"/>

                    </fieldset>
  
                </form>
            </div>
        </div>
        <script src="form.js"></script>
    </body>
</html>
</asp:Content>



