<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_editar_pais.aspx.cs" Inherits="Godcompany.admin_editar_pais" %>
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
                        title: 'Pais editado com sucesso',
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



            function Error_editar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de editar qualquer pais, tem de escolher na tabela que se encontra na parte superior da pagina o respetivo pais que deseija editar.',
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

            function Correct_eliminar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'success',
                    title: 'Pais eliminado com sucesso',
                    showConfirmButton: false,
                    timer: 3000
                })



            }
        </script>

    </head>


  
		    
 <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Editar pais</h2>
					<p>Em primeiro escolha o pais que quer editar</p>
				</div>

    <br />
    <br />
    <br />
			
    <asp:GridView ID="GridView1" runat="server" PageSize="5" AutoGenerateColumns="False" DataKeyNames="id_pais" DataSourceID="SqlDataSource2" Font-Size="Large" CellPadding="4" GridLines="Horizontal"  Style="margin-left:15%" Width="70%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_pais" HeaderText="Numero pais" InsertVisible="False" ReadOnly="True" SortExpression="id_pais" />
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
            
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/images/{0}">

                <ControlStyle Height="80px" Width="130px" />

            </asp:ImageField>
        </Columns>

        <EmptyDataTemplate>Não existem paises criados</EmptyDataTemplate>
        
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT atividade.* FROM atividade"></asp:SqlDataSource>
    <asp:SqlDataSource ID="bd_agencia_de_viagens" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_pais, nome, imagem FROM pais"></asp:SqlDataSource>
        

       <%--   <div>
           <div class="panel shadow1 login-form">
            <%-- <form > --%>  
                   
                  
<%--                    <fieldset id="login-fieldset">
                        <asp:TextBox ID="id_pais" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Id"></asp:TextBox>
                        <asp:TextBox ID="nome" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
                        <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control" for="customFile" />

                        <br>
                        <br>
                        <br>
                        <br>
                         <asp:Button ID="Eliminar" runat="server" Text="Eliminar" class="<%--login_form--%> <%--button animated fadeInUp animate2" OnClick="login_form_submit_Click" Height="60px" BackColor="#40E0D0"/>--%>
                       <%--   <asp:Button ID="Editar" runat="server" Text="Editar" class="<%--login_form--%> <%--button animated fadeInUp animate4" OnClick ="editar_Click"  Height="60px" BackColor="#40E0D0"/>--%>

<%--                    </fieldset>--%>

                  
                    
                    
               <%-- </form>--%>
          <%--  </div>
        </div>--%>



      <br />
      <br />
      <br />
   
   
          <asp:TextBox ID="id_pais" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid" Height="40px"  Font-Size="Medium" placeholder="Id"  Visible="false"></asp:TextBox>


      
  
    
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Nome pais:</label></h1>
      


    <div style="margin-left:10%">
        <asp:TextBox ID="nome" runat="server" class="form-control "  BorderStyle ="Solid" Height="40px" Width="90%" Font-Size="Medium" placeholder="Nome"></asp:TextBox>

       
    </div>
    
    

   

  
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto pais:</label></h1>
      


    <div style="margin-left:10%">
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile" Width="90%" Font-Size="Medium"/>

       
    </div>
 
  
    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1> 


      <br />
     
      <br />


    <div >

    
        
    <table style="margin-left:10%">
        <tr>
            

    
        <asp:Button ID="Eliminar" runat="server" Text="Eliminar" class="btn btn-outline-success" OnClick="login_form_submit_Click" style="width:600px; height:75px; " Font-Size="Medium"/>
                          <asp:Button ID="Editar" runat="server" Text="Editar" class="btn btn-outline-success" OnClick ="editar_Click"  style="width:600px; height:75px; " Font-Size="Medium"/>


                
                
                </tr>
            </table>
        </div>
    

    <br />
    <br />

</asp:Content>
