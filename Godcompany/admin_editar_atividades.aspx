<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_editar_atividades.aspx.cs" Inherits="Godcompany.admin_editar_atividades_aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="swalert.js" type="text/javascript"></script>


    <head>

        <script>
            function Correct_editar() {

              


                Swal.fire({
                    padding: '8em',
                        width: 600,
                        position: 'center',
                        icon: 'success',
                        title: 'Atividade editado com sucesso',
                        showConfirmButton: false,
                        timer: 3000
                    })
                

                
            }



            function Error_editar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de editar qualquer atividade, tem de selecionar na tabela que se encontra na parte superior da pagina a respetiva atividade que deseija editar.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }


            function Error_eliminar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de eliminar qualquer atividade, tem de selecionar na tabela que se encontra na parte superior da pagina a respetiva atividade que deseija eliminar.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }


            function Error_campos_por_preencher() {




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


            function Error_existe_algo_associado() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Se existir qualquer tipo de produto associado a esta atividade não é possivel eliminá la',
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
                    title: 'Atividade eliminada com sucesso',
                    showConfirmButton: false,
                    timer: 3000
                })



            }
        </script>

    </head>



     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



 


		
        
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Editar atividade</h2>
					<p>Em primeiro escolha a atividade que quer editar.</p>
				</div>

    <br />
    <br />
    <br />

    <div style="margin-left:5%">

    <asp:GridView ID="GridView1" runat="server"   PageSize="5" Style="margin-left:20px" Width="95%" Font-Size="Large" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_atividade" DataSourceID="SqlDataSource3" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_atividade" HeaderText="Numero atividade" InsertVisible="False" ReadOnly="True" SortExpression="id_atividade" />
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
            <asp:BoundField DataField="preco" HeaderText="preço" SortExpression="preco" />
            <asp:BoundField DataField="lotacao" HeaderText="Lotaçao" SortExpression="lotacao" />
            <asp:BoundField DataField="Pais" HeaderText="Pais" SortExpression="Pais" />
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/images/{0}">
                <ControlStyle Height="80px" Width="130px" />
            </asp:ImageField>
        </Columns>
        <EmptyDataTemplate>Não exitem atividades criadas</EmptyDataTemplate>
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
        </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT atividade.id_atividade, atividade.nome, atividade.preco, atividade.lotacao ,atividade.imagem ,pais.nome AS Pais FROM atividade INNER JOIN pais ON atividade.id_pais = pais.id_pais"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_atividade, nome, preco, id_pais FROM atividade"></asp:SqlDataSource>


     <%-- <div>
           <div class="panel shadow1 login-form">
         
                    <fieldset id="login-fieldset">
                                         
                       <%-- <asp:TextBox ID="id_atividade2" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Id"></asp:TextBox>
                        <asp:TextBox ID="nome2" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
                        <asp:TextBox ID="preco2" runat="server" class="login animated fadeInUp animate2" placeholder="preço" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
                        <asp:TextBox ID="lotacao2" runat="server" class="login animated fadeInUp animate2" placeholder="lotação" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
                        
                         <asp:DropDownList ID="DropDownList2"  class="col-md-12 form-group Rstar row form-group form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_pais"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
--%>




                     <%--   <asp:Button ID="Eliminar" runat="server" Text="Eliminar" class="<%--login_form--%> <%--button animated fadeInUp animate2" OnClick="Eliminar_Click" Height="60px" BackColor="#40E0D0"/>--%>

                <%-- <asp:Button ID="editar" runat="server" Text="Editar" class="<%--login_form--%><%-- button animated fadeInUp animate4" OnClick ="editar_Click" Height="60px" BackColor="#40E0D0"/>
                  --%>
                    <%--</fieldset>--%>
                       
                      
                    
                    
               <%-- </form>--%>
           <%-- </div>
        </div>--%>

  
    


    <br />
    <br />
    <br />


  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Id atividade:</label></h1>
    <asp:TextBox ID="id_atividade" runat="server"   Class ="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Id" Font-Size="Medium"></asp:TextBox>
  </div>

    

  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Nome atividade:</label></h1>
    <asp:TextBox ID="nome" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium"></asp:TextBox>
  </div>
    
    

  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Preço atividade:</label></h1>
    <asp:TextBox ID="preco" runat="server" class="form-control col-sm-9" placeholder="preço" BorderStyle ="Solid"  Font-Size="Medium"></asp:TextBox>

  </div>
    
    

      <div class="col-md-12">
    
           <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Lotação atividade:</label></h1>
           <asp:TextBox ID="lotacao" runat="server" class="form-control col-sm-9" placeholder="lotação" BorderStyle ="Solid"  Font-Size="Medium"></asp:TextBox>
                       
  </div>
    
    
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

  

      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto atividade:</label></h1>
      


    <div style="margin-left:10%">
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile" Font-Size="Medium" Width="90%"/>

       
    </div>
 <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
  
      
   


      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Pais atividada:</label></h1>
      


    <div style="margin-left:75px">

       <asp:DropDownList ID="DropDownList2" Font-Size="Medium" class=" <%--form-group Rstar row form-group--%> form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_pais"></asp:DropDownList>
       <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>

    
    </div>
 
  
  

      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

    <div >

   <asp:Button ID="Eliminar" runat="server" Text="Eliminar"  OnClick="Eliminar_Click"  class="btn btn-outline-success " style="width:600px; height:100px" Font-Size="Medium"/>

    <asp:Button ID="editar" runat="server" Text="Editar"  OnClick ="editar_Click" class="btn btn-outline-success " style="width:600px; height:100px;  left: 0px;" Font-Size="Medium"/>
        
        </div>
    

    <br />
    <br />
</asp:Content>
