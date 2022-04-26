<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_editar_hoteis.aspx.cs" Inherits="Godcompany.admin_editar_hoteis" %>
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
                        title: 'Hotel editado com sucesso',
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
                    title: 'Antes de editar o hotel, tem de escolher o hotel que quer editar na tabela que se encontra na parte superior da tela.',
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
                    title: 'Se existir qualquer tipo de produto associado a este pais não é possivel eliminá lo',
                    showConfirmButton: false,
                    timer: 5000
                })



            }



            function Error_tem_algo_ass() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Antes de querer apagar verifique se não existe nada a associado este hotel',
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

            function Correct_apagar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'success',
                    title: 'Hotel eliminado com sucesso',
                    showConfirmButton: false,
                    timer: 3000
                })



            }
        </script>

    </head>




   
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Editar hotel</h2>
					<p>Em primeiro escolha o hotel que quer editar.</p>
				</div>

    <br />
    <br />
    <br />

    <asp:GridView ID="GridView1" runat="server" CellPadding="4" PageSize="5" Style="margin-left:15%" Width="70%" Font-Size="Large" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="id_hoteis" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_hoteis" HeaderText="Numero hotel" InsertVisible="False" ReadOnly="True" SortExpression="id_hoteis" />
            <asp:BoundField DataField="nome_hotel" HeaderText="Nome hotel" SortExpression="nome_hotel" />
            <asp:BoundField DataField="id_classificacao" HeaderText="Estrelas" SortExpression="id_classificacao" />
            <asp:BoundField DataField="nome" HeaderText="Pais" SortExpression="nome" />
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/images/{0}">
                <ControlStyle Height="80px" Width="130px" />
            </asp:ImageField>
            


        </Columns>
           <EmptyDataTemplate>Não exitem hoteis criadas</EmptyDataTemplate>
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT hoteis.id_hoteis, hoteis.nome_hotel, hoteis.id_classificacao, hoteis.imagem, pais.nome FROM hoteis INNER JOIN pais ON hoteis.id_pais = pais.id_pais"></asp:SqlDataSource>


<%--              <div>
           <div class="panel shadow1 login-form">
          
                  
                    <fieldset id="login-fieldset">
                        <asp:TextBox ID="id_hotel" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Id"></asp:TextBox>
                        <asp:TextBox ID="nome" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
                         
                        <asp:FileUpload ID="FileUpload1" runat="server"  for="customFile" />
                        
                        <asp:DropDownList ID="DropDownList1" runat="server" class="col-md-12 form-group Rstar" DataSourceID="SqlDataSource2" DataTextField="id_classificacao" DataValueField="id_classificacao"></asp:DropDownList>

    

                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
                        <asp:Button ID="Eliminar" runat="server" Text="Eliminar" class="<%--login_form--%> <%--button animated fadeInUp animate2" OnClick="Eliminar_Click" Height="60px" BackColor="#40E0D0"/>
                         <asp:Button ID="editar" runat="server" Text="Editar" class="<%--login_form--%> <%--button animated fadeInUp animate4" OnClick ="editar_Click" Height="60px" BackColor="#40E0D0"/>

                        </fieldset>
          --%>
                    
                    
               <%-- </form>--%>
       <%--     </div>
        </div>--%>




    <asp:TextBox ID="id_hotel" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Id" Visible="false"></asp:TextBox>
     <br />
    <br />
    <br />


    

  
    

      
     
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Nome hotel:</label></h1>
      


    <div style="margin-left:10%">

           <asp:TextBox ID="nome" Width="90%" runat="server"   Class ="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium"></asp:TextBox>             
    
    </div>



     
    






      
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Pais hotel:</label></h1>
      


    <div >

          <asp:DropDownList ID="DropDownList2" runat="server" Font-Size="Medium" style="margin-left:10%; width:81%" class="form-control" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_pais"></asp:DropDownList>

    
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_pais,nome FROM pais"></asp:SqlDataSource>

    
    </div>



      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>



      
    
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Numero de estrelas hotel:</label></h1>
      


    <div >

          
          <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="Medium" class="form-control" DataSourceID="SqlDataSource3" DataTextField="n_estrelas" DataValueField="id_classificacao" style="margin-left:10%; width:81%"></asp:DropDownList>

    
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_classificacao, n_estrelas FROM classificacao"></asp:SqlDataSource>

    
    </div>



      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto hotel:</label></h1>
      


    <div style="margin-left:10%">
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile" Font-Size="Medium" Width="90%"/>

       
    </div>
 <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
  
  





    <div >

    
        
    <table style="margin-left:10%">
        <tr>
            
        
    
   
        
    <asp:Button ID="editar" runat="server" Text="Editar"  OnClick ="editar_Click" class="btn btn-outline-success " style="width:600px; height:100px;  left: 0px;" Font-Size="Medium"/>
            <asp:Button ID="Eliminar" runat="server" Text="Eliminar"  OnClick ="Eliminar_Click" class="btn btn-outline-success " style="width:600px; height:100px;  left: 0px;" Font-Size="Medium"/>

              
                </tr>
            </table>
        </div>
    
    

    <br />
    <br />









</asp:Content>
