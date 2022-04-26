<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_adicionar_voos.aspx.cs" Inherits="Godcompany.admin_adicionar_voos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <script src="swalert.js" type="text/javascript"></script>


    <head>

        <script>
            function Correct_criar() {

              


                Swal.fire({
                    padding: '8em',
                        width: 600,
                        position: 'center',
                        icon: 'success',
                        title: 'Voo criado com sucesso',
                        showConfirmButton: false,
                        timer: 3000
                    })
                

                
            }



            function Error_campos() {




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



            
       
        </script>

    </head>






<%--       <div>
           <div class="panel shadow1">
                   
                 
                    <fieldset id="signup-fieldset" >
                        <asp:TextBox ID="nome_companhia" runat="server" class="login animated fadeInUp animate2"  placeholder="Nome companhia" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                        <asp:TextBox ID="lotacao" runat="server" class="login animated fadeInUp animate2"  placeholder="Lotação" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
                        
                        <asp:TextBox ID="dia_partida" runat="server" class="login animated fadeInUp animate2" placeholder="Hora partida" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Date"></asp:TextBox>
                        <asp:TextBox ID="dia_chegada" runat="server" class="login animated fadeInUp animate2" placeholder="Hora chegada" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Date"></asp:TextBox>
                        <asp:TextBox ID="hora_partida" runat="server" class="login animated fadeInUp animate2" placeholder="Hora partida" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Time"></asp:TextBox>
                        <asp:TextBox ID="hora_chegada" runat="server" class="login animated fadeInUp animate2" placeholder="Hora chegada" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Time"></asp:TextBox>

                        
                        <asp:DropDownList ID="Pais_destino" class="col-md-12 form-group Rstar" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_pais"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
                        <asp:DropDownList ID="Pais_origem" class="col-md-12 form-group Rstar" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_pais"></asp:DropDownList>
                        <asp:DropDownList ID="companhia"  class="col-md-12 form-group Rstar" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_companhia"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT companhia.* FROM companhia"></asp:SqlDataSource>
                        <br />
                        <asp:Button ID="adicionar" runat="server" Text="Criar"  class="<%--login_form--%> <%--button animated fadeInUp animate4" OnClick ="adicionar_Click" Height="60px" BackColor="#40E0D0"/>
                        
                    </fieldset>

                
            </div>
        </div>
      --%>

    
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Criar voos</h2>
					<p>Aqui pode criar o voo a sua preferencia.</p>
				</div>

    <br />
    <br />
    <br />

      <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Nome voo:</label></h1>
    <asp:TextBox ID="nome_voo" runat="server" class="form-control col-sm-9"  placeholder="Nome voo" BorderStyle ="Solid" Height="40px"  Font-Size="Medium"></asp:TextBox>
          </div>

  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Lotação:</label></h1>
    <asp:TextBox ID="lotacao" runat="server" class="form-control col-sm-9"  placeholder="Lotação" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" ></asp:TextBox>
  </div>

    

    
    

      <div class="col-md-12">
    
           <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Hora partida:</label></h1>
           <asp:TextBox ID="hora_partida" runat="server" class="form-control col-sm-9" placeholder="Hora partida" BorderStyle ="Solid"  TextMode="Time" Height="40px"  Font-Size="Medium"></asp:TextBox>

                       
  </div>
    
     <div class="col-md-12">
    
           <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Hora chegada:</label></h1>
           <asp:TextBox ID="hora_chegada" runat="server" class="form-control col-sm-9" placeholder="Hora partida" BorderStyle ="Solid" TextMode="Time" Height="40px"  Font-Size="Medium"></asp:TextBox>
                       
  </div>
    

   
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

  
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Pais origem:</label></h1>
      


    <div >

     <asp:DropDownList ID="Pais_origem" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_pais" Height="40px" Width="80%"  Font-Size="Medium" style="margin-left:10%"></asp:DropDownList>
      <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>

    </div>
 
  
    
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Pais destino:</label></h1>
      


    <div >

       <asp:DropDownList ID="Pais_destino" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_pais" Height="40px" Width="80%"  Font-Size="Medium" style="margin-left:10%"></asp:DropDownList>



    </div>
  




     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Companhia:</label></h1>
      


    <div >

       

     <asp:DropDownList ID="companhia"  class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_companhia" Height="40px"  Width="80%"  Font-Size="Medium" style="margin-left:10%" ></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT companhia.* FROM companhia"></asp:SqlDataSource>
     
        
     </div>
        
        <br />
      <br />
      <br />


     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

    <div >

    
 

  <asp:Button ID="adicionar" runat="server" Text="Criar"  class="btn btn-outline-success" OnClick ="adicionar_Click" style="width:1200px; height:100px" Font-Size="Medium"/>
                        

        </div>
    

    <br />
    <br />
</asp:Content>
