<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_adicionar_atividades.aspx.cs" Inherits="Godcompany.admin_adicionar_atividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Required meta tags -->
       
      
         <script src="swalert.js" type="text/javascript"></script>


    <head>

        <script>
            function Correct() {

              


                Swal.fire({
                    padding: '8em',
                        width: 600,
                        position: 'center',
                        icon: 'success',
                        title: 'Atividade criada com sucesso',
                        showConfirmButton: false,
                        timer: 3000
                    })
                

                
            }



            function Error() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de apagar qualquer pais, tem de escolher na tabela que se encontra na parte superior da pagina o respetivo pais que deseija apagar.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }



            function Error_adicionar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de adicionar qualquer atividade.<br>Tem de escolher na tabela que se encontra na parte superior da pagina o pais que pretende associar a essa atividade.',
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
                    title: 'Se existir qualquer tipo de produto associado a este pais não é possivel eliminá lo',
                    showConfirmButton: false,
                    timer: 5000
                })



            }

            function Error_campos_preencher() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Campos por prencher',
                    showConfirmButton: false,
                    timer: 3000
                })



            }
        </script>

    </head>
      

        <!-- Google JQuery CDN -->
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
        
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Criar atividade</h2>
					<p>Em primeiro escolha o pais dessa respetiva atividade.</p>
				</div>

    <br />
    <br />
    <br />

   
      
        <asp:GridView ID="GridView1" runat="server" PageSize="5" Style="margin-left:15%" Width="70%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_pais" DataSourceID="SqlDataSource1" GridLines="Horizontal" Font-Size="Large" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id_pais" HeaderText="Numero pais" InsertVisible="False" ReadOnly="True" SortExpression="id_pais" />
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
               

                <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/images/{0}">
                     <ControlStyle Height="80px" Width="130px" />
                </asp:ImageField>

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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>

   <%-- <div>
        <div class="panel shadow1">
            <%--<form class="login-form">--%>   
       
               <%-- <fieldset id="signup-fieldset" >
                    <asp:TextBox ID="nome_atividade" runat="server" class="login animated fadeInUp animate2" placeholder="Nome" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                    <asp:TextBox ID="preço_atividade" runat="server" class="login animated fadeInUp animate2" placeholder="preço" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
                    <asp:TextBox ID="id_pais" runat="server" class="login animated fadeInUp animate2" placeholder="id_pais" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" Visible="false"></asp:TextBox>
                     <asp:TextBox ID="id_pais_nome" runat="server" class="login animated fadeInUp animate2" placeholder="Nome Pais" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
                    <asp:TextBox ID="lotaçao_atividade" runat="server" class="login animated fadeInUp animate2" placeholder="Lotação" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                
            <asp:Button ID="editar" runat="server" Text="Adicionar" class="<%--login_form--%> <%--button animated fadeInUp animate4" OnClick ="editar_Click" Height="60px" BackColor="#40E0D0"/>--%>


                <%--</fieldset>--%>
                    
                    
                    
               <%-- </form>--%>
          <%--  </div>
        </div>--%>
 
        <asp:TextBox ID="id_pais" runat="server" class="login animated fadeInUp animate2" placeholder="id_pais" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" Visible="false"></asp:TextBox>
  <br />
    <br />
    <br />




  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Nome atividade:</label></h1>
    <asp:TextBox ID="nome_atividade" runat="server"   Class ="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium"></asp:TextBox>
  </div>

    

  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Preço atividade:</label></h1>
    <asp:TextBox ID="preço_atividade" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Preço" Font-Size="Medium"></asp:TextBox>
  </div>
    
    

  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >pais atividade:</label></h1>
    <asp:TextBox ID="id_pais_nome" runat="server" class="form-control col-sm-9" placeholder="Nome pais" BorderStyle ="Solid"  Font-Size="Medium" ></asp:TextBox>

  </div>
    
    

      <div class="col-md-12">
    
           <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Lotação atividade:</label></h1>
           <asp:TextBox ID="lotaçao_atividade" runat="server" class="form-control col-sm-9" placeholder="lotação" BorderStyle ="Solid"  Font-Size="Medium"></asp:TextBox>
                       
  </div>
    
    

    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

  

      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto atividade:</label></h1>
      


    <div style="margin-left:10%">
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile" Font-Size="Medium" Width="90%"/>

       
    </div>
 <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
  
      
  
  

      <br />
      <br />
      <br />


    <div >

    
   

    <asp:Button ID="editar" runat="server" Text="Criar"  OnClick ="editar_Click" class="btn btn-outline-success " style="width:1200px; height:100px;" Font-Size="Medium"/>

        </div>
    

    <br />
    <br />
</asp:Content>
