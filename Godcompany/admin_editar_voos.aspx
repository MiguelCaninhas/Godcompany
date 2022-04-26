<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_editar_voos.aspx.cs" Inherits="Godcompany.admin_editar_voos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script src="swalert.js" type="text/javascript"></script>


    <head>

        <script>
            function Correct_editar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'success',
                    title: 'Voo editado com sucesso',
                    showConfirmButton: false,
                    timer: 3000
                })



            }



            function Error_foto() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'O campo de introdução da foto é de preenchimento obrigatório.',
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
                    title: 'Antes de editar o voo, tem de escolher o voo que quer editar na tabela que se encontra na parte superior da tela.',
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
                    title: 'Se existir qualquer tipo de produto associado a este voo não é possivel eliminá lo',
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
                    title: 'Voo eliminado com sucesso',
                    showConfirmButton: false,
                    timer: 3000
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


            function error_nao_escolher_apagar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de apagar o voo, tem de escolher o voo que quer apagar na tabela que se encontra na parte superior da tela.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }
        </script>

    </head>




    
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Editar voos</h2>
					<p>Em primeiro escolha o voo que quer editar.</p>
				</div>

    <br />
    <br />
    <br />


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_voo" DataSourceID="SqlDataSource35" Style="margin-left: 15%" Width="70%" Font-Size="Large" AllowPaging="True" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_voo" HeaderText="id_voo" ReadOnly="True" InsertVisible="False" SortExpression="id_voo"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="Expr1" HeaderText="Companhia" SortExpression="Expr1"></asp:BoundField>
            <asp:BoundField DataField="lotaçao" HeaderText="lotaçao" SortExpression="lotaçao"></asp:BoundField>
<asp:BoundField DataField="hora_partida" HeaderText="hora_partida" SortExpression="hora_partida"></asp:BoundField>
            <asp:BoundField DataField="hora_chegada" HeaderText="hora_chegada" SortExpression="hora_chegada"></asp:BoundField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>



   
    <asp:SqlDataSource ID="SqlDataSource35" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT voo.id_voo, voo.nome, companhia.nome AS Expr1, voo.lotaçao, voo.hora_partida, voo.hora_chegada FROM voo INNER JOIN companhia ON voo.id_companhia = companhia.id_companhia"></asp:SqlDataSource>



   
    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT voo.* FROM voo"></asp:SqlDataSource>
    
    
    
    <%--<div>
           <div class="panel shadow1">
                   
                 
                    <fieldset id="signup-fieldset">
                        <asp:TextBox ID="id_voo" runat="server" class="login animated fadeInUp animate2"  placeholder="Nome companhia" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                        <asp:TextBox ID="nome_companhia" runat="server" class="login animated fadeInUp animate2"  placeholder="Nome companhia" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                        <asp:TextBox ID="lotacao" runat="server" class="login animated fadeInUp animate2"  placeholder="Lotação" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
                        <asp:TextBox ID="dia_partida" runat="server" class="login animated fadeInUp animate2" placeholder="Hora partida" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Date"></asp:TextBox>
                        <asp:TextBox ID="dia_chegada" runat="server" class="login animated fadeInUp animate2" placeholder="Hora chegada" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Date"></asp:TextBox>
                        <asp:TextBox ID="hora_partida" runat="server" class="login animated fadeInUp animate2" placeholder="Hora partida" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Time"></asp:TextBox>
                        <asp:TextBox ID="hora_chegada" runat="server" class="login animated fadeInUp animate2" placeholder="Hora chegada" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" TextMode="Time"></asp:TextBox>
                        <asp:DropDownList ID="pais_origem" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_pais"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
                        <asp:DropDownList ID="pais_destino" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_pais"></asp:DropDownList>
                        <asp:DropDownList ID="companhia" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_companhia"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT companhia.* FROM companhia"></asp:SqlDataSource>
                        <br />
                        <asp:Button ID="editar" runat="server" Text="Criar"  class="<%--login_form--%> <%--button animated fadeInUp animate4" OnClick="editar_Click" Height="60px" BackColor="#40E0D0"/>
                        
                    </fieldset>

                
            </div>
        </div>--%>
    <asp:TextBox ID="id_voo" runat="server" class="login animated fadeInUp animate2"  placeholder="Nome companhia" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" Visible="false"></asp:TextBox>


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
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Pais origem:</label></h1>
      


    <div >

     <asp:DropDownList ID="Pais_origem" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_pais" Height="40px"  Font-Size="Medium"  style="margin-left:10%" Width="80%"></asp:DropDownList>
      <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>

    </div>
 
  
    
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Pais destino:</label></h1>
      


    <div >

       <asp:DropDownList ID="Pais_destino" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id_pais" Height="40px"  Font-Size="Medium" style="margin-left:10%" Width="80%"></asp:DropDownList>



    </div>
  




     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Companhia:</label></h1>
      


    <div >

       

     <asp:DropDownList ID="companhia"  class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_companhia" Height="40px"  Font-Size="Medium" style="margin-left:10%" Width="80%"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT companhia.* FROM companhia"></asp:SqlDataSource>
     
        
     </div>
        
        <br />
      <br />
      <br />


    <div >

      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
 

  <asp:Button ID="editar" runat="server" Text="Editar"   class="btn btn-outline-success" OnClick ="editar_Click" style="width:600px; height:100px" Font-Size="Medium"/>
                        
        
  <asp:Button ID="Eliminar" runat="server" Text="Eliminar"   class="btn btn-outline-success" OnClick ="Eliminar_Click" style="width:600px; height:100px" Font-Size="Medium"/>
        </div>
    

    <br />
    <br />













    
</asp:Content>
