<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_companhia.aspx.cs" Inherits="Godcompany.admin_companhia" %>
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
                        title: 'Companhia criada com sucesso',
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
                    title: 'Antes de editar a companhia, tem de escolher a companhia que quer editar na tabela que se encontra na parte superior da tela.',
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
                    title: 'Antes de eliminar a companhia, tem de escolher a companhia que quer eliminar na tabela que se encontra na parte superior da tela.',
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


            function Correct_editar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'success',
                    title: 'Companhia editada com sucesso',
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
                    title: 'Companhia eliminada com sucesso',
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


            function error_adicionar_nome() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'O campo nome companhia é de preenchimento obrigatório.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }
        </script>

    </head>



       <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Criar companhia</h2>
					<p>Aqui pode criar a companhia a sua preferencia.</p>
				</div>

    <br />
    <br />
    <br />




    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id_companhia" DataSourceID="SqlDataSource1" Style="margin-left:15%" Width="70%" Font-Size="Large" CellPadding="4" GridLines="Horizontal" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_companhia" HeaderText="Numero companhia" ReadOnly="True" InsertVisible="False" SortExpression="id_companhia"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
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
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT companhia.* FROM companhia"></asp:SqlDataSource>

       <%--             <div>
           <div class="panel shadow1">
                   
                 
                    <fieldset id="signup-fieldset" >
                        <asp:TextBox ID="nome_companhia" runat="server" class="login animated fadeInUp animate2"  placeholder="Nome companhia" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium"></asp:TextBox>
                        <asp:TextBox ID="id" runat="server" class="login animated fadeInUp animate2"  placeholder="Nome companhia" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" Visible="false"></asp:TextBox>
                        
                        <br />
                        
                        
                        <asp:Button ID="adicionar" runat="server" Text="Criar"  class="<%--login_form--%><%-- button animated fadeInUp animate4" OnClick ="signup_form_submit_Click" Height="60px" BackColor="#40E0D0"/>--%>
      <%--                  <asp:Button ID="editar" runat="server" Text="Editar"  class="<%--login_form --%><%--button animated fadeInUp animate4" OnClick ="editar_Click" Height="60px" BackColor="#40E0D0"/>--%>
      <%--              </fieldset>

                
            </div>
        </div>
      --%>
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      


     <asp:TextBox ID="id" runat="server" class="login animated fadeInUp animate2"  placeholder="Nome companhia" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" Visible="false"></asp:TextBox>
                        


      <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Nome companhia:</label></h1>
      


    <div style="margin-left:10%">

           <asp:TextBox ID="nome_companhia" Width="90%" runat="server"   Class ="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium"></asp:TextBox>             
    
    </div>

     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      

    
    <div >

    
        
    <table style="margin-left:10%">
        <tr>
            
        
    
   
        
    <asp:Button ID="adicionar" runat="server" Text="Criar"  OnClick ="signup_form_submit_Click" class="btn btn-outline-success " style="width:400px; height:100px;  left: 0px;" Font-Size="Medium"/>
            <asp:Button ID="editar" runat="server" Text="Editar"  OnClick ="editar_Click" class="btn btn-outline-success " style="width:400px; height:100px;  left: 0px;" Font-Size="Medium"/>
             <asp:Button ID="Eliminar" runat="server" Text="Eliminar"  OnClick ="Eliminar_Click" class="btn btn-outline-success " style="width:400px; height:100px;  left: 0px;" Font-Size="Medium"/>

              
                </tr>
            </table>
        </div>
    
    









</asp:Content>
