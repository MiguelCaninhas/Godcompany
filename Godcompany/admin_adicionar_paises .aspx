<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_adicionar_paises .aspx.cs" Inherits="Godcompany.admin_adicionar_paises" %>
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
                        title: 'Pais criado com sucesso',
                        showConfirmButton: false,
                        timer: 2500
                    })
                

                
            }



            function Error() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Campos por preencher',
                    showConfirmButton: false,
                    timer: 2500
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
                    timer: 3000
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
                    timer: 3000
                })



            }
        </script>

    </head>


 <%--  
  <div>
           <div class="panel shadow1">
            
                 <br></br>
			<br></br>
			<br></br>
			<br></br>
			<br></br>
			<br></br>
                 
                    <asp:SqlDataSource ID="bd_agencia_viagens" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT nome FROM pais"></asp:SqlDataSource>
                 
                    <fieldset id="signup-fieldset" >
                        <asp:TextBox ID="nome_pais_signup" runat="server" class="login animated fadeInUp animate2"  placeholder="Nome pais" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                        <br>
                        <br>
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile"/>
                        
                        <asp:Button ID="signup_form_submit" runat="server" Text="Criar"  class="<%--login_form --%><%--button animated fadeInUp animate4" OnClick ="signup_form_submit_Click" Height="60px" BackColor="#40E0D0"/>
      --%>       <%--       </fieldset>

                
            </div>
        </div>
      --%>



    		
        
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Criar pais</h2>
					<p>Aqui pode criar paises.</p>
				</div>

    <br />
    <br />
    <br />



    
    
       <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Nome pais:</label></h1>
      


    <div style="margin-left:10%">
        <asp:TextBox ID="nome_pais_signup" runat="server" class="form-control"  placeholder="Nome pais" BorderStyle ="Solid"  Font-Size="Medium" Width="90%"></asp:TextBox>
       
    </div>
 
  
    
    

   

 
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto pais:</label></h1>
      


    <div style="margin-left:10%">
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile" Font-Size="Medium" Width="90%"/>

       
    </div>
 <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
  
  

      <br />
      <br />
      <br />


    <div >

    


  <asp:Button ID="signup_form_submit" runat="server" Text="Criar"  class="btn btn-outline-success" OnClick ="signup_form_submit_Click"  style="width:1200px; height:100px; " Font-Size="Medium"/>
  

        </div>
    

    <br />
    <br />



</asp:Content>
