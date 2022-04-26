<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Godcompany.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

       


      <script src="swalert.js" type="text/javascript"></script>


    <head>

        <script>
            function Correct() {

              


                Swal.fire({
                    padding: '8em',
                        width: 600,
                        position: 'center',
                        icon: 'success',
                        title: 'Conta criada com sucesso',
                        showConfirmButton: false,
                        timer: 2100
                    })
                

                
            }



            function Error() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'O mail ou a password que utilizou não estão correctos',
                    showConfirmButton: false,
                    timer: 6000
                })



            }


            function Error_password() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Confirmar password tem de ser igual a password',
                    showConfirmButton: false,
                    timer: 5000
                })



            }

            function Error_email() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Já existe uma conta associada a esse email',
                    showConfirmButton: false,
                    timer: 6000
                })



            }

            function Error_data() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'A data de nascimento tem que ser inferior ao dia de hoje',
                    showConfirmButton: false,
                    timer: 6500
                })



            }


            function Error_campos() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Campos por preencher',
                    showConfirmButton: false,
                    timer: 3000
                })



            }


            function Aceitar() {




                Swal.fire({
                    icon: 'question',
                    padding: '8em',
                    width: 600,
                    title: ' I agree to these Terms and Conditions!',
                   
                    
                })



            }
           
        </script>

    </head>

    
    <body class="gtco-cover gtco-cover-md"  >

        <div>
           <div class="panel shadow1">
            
                    <div class="panel-switch animated fadeIn">
                        <button type="button" id="sign_up" class="active-button"  >Sign Up</button>
                        <button type="button" id="log_in" class="" disabled  >Log in</button>
                    </div>
                    <h1 class="animated fadeInUp animate1" id="title-login">Welcome Back !</h1>
                    <h1 class="animated fadeInUp animate1 hidden" id="title-signup">Welcome !</h1>
                    <fieldset id="login-fieldset">
                        <asp:TextBox ID="username" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Large" placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="password" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Large" placeholder="Password" TextMode="Password"></asp:TextBox> 
                       
                         <asp:Button ID="login_form_submit" runat="server" Text="log in" class="<%--login_form--%> button animated fadeInUp animate2" OnClick="login_form_submit_Click" Height="60px" Width="300" Font-Size="Medium" BackColor="#40E0D0"/>
                    </fieldset>
                    <fieldset id="signup-fieldset" class="hidden">
                        <asp:TextBox ID="username_signup" runat="server" class="login animated fadeInUp animate2" placeholder="Username" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                        <asp:TextBox ID="password_signup" runat="server" class="login animated fadeInUp animate2" placeholder="Password" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Password"></asp:TextBox>
                         <asp:TextBox ID="confirmar_password" runat="server" class="login animated fadeInUp animate2" placeholder="Confirmar Password" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Password"></asp:TextBox>
                        <asp:TextBox ID="c_cidadao_signup" runat="server" class="login animated fadeInUp animate2" placeholder="Cartão Cidadão" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                        <asp:TextBox ID="mail_signup" runat="server" class="login animated fadeInUp animate2" placeholder="Email" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" Text=""></asp:TextBox> 
                        <asp:TextBox ID="idade_signup" runat="server" class="login animated fadeInUp animate2" placeholder="idade" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Date" ToolTip="Data de nascimento" ></asp:TextBox>
                        <asp:CheckBox ID="termos_utilizaçao" runat="server" class="login animated fadeInUp animate2" Text="I agree to these Terms and Conditions!" Font-Size="Large" ForeColor="White" />
                        <br />
                        <asp:Button ID="signup_form_submit" runat="server" Text="Sign up" class="<%--login_form--%> button animated fadeInUp animate4" OnClick="signup_form_submit_Click" Height="60px" Width="300" Font-Size="Medium" BackColor="#40E0D0"/>
                        
                    </fieldset>
                    
                    
                
                
            </div>
        </div>
        
    </body>
</html>
</asp:Content>


