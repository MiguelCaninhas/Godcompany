<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_adicionar_quartos.aspx.cs" Inherits="Godcompany.admin_adicionar_quartos" %>
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
                        title: 'Quartos criado com sucesso',
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



            function Error_campos() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Campos por preencher',
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
        </script>

    </head>




               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Criar quartos</h2>
					<p>Em primeiro escolha o hotel em que quer associar o respetivo quarto.</p>
				</div>

    <br />
    <br />
    <br />




    <asp:GridView ID="GridView1" runat="server" PageSize="5" AutoGenerateColumns="False"  Style="margin-left:15%" Width="70%" Font-Size="Large" DataKeyNames="id_hoteis" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id_hoteis" HeaderText="Numero hotel" ReadOnly="True" InsertVisible="False" SortExpression="id_hoteis"></asp:BoundField>
            <asp:BoundField DataField="nome_hotel" HeaderText="Nome hotel" SortExpression="nome_hotel"></asp:BoundField>
            <asp:BoundField DataField="id_classificacao" HeaderText="Estrelas" SortExpression="id_classificacao"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="Pais" SortExpression="nome" />
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/images/{0}">
                <ControlStyle Height="80px" Width="130px" />
            </asp:ImageField>
        </Columns>
        <EmptyDataTemplate>Não existem hoteis criados</EmptyDataTemplate>
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



              <%--<div>
           <div class="panel shadow1 login-form">--%>
            <%-- <form > --%>  
                   
                  
                  <%--  <fieldset id="login-fieldset">
                        <asp:TextBox ID="preco" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
                        
                         <asp:TextBox ID="id_hoteis" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
                        <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control" for="customFile" />
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Value="1">x1</asp:ListItem>
                            <asp:ListItem Value="2">x2</asp:ListItem>
                            <asp:ListItem Value="3">x3</asp:ListItem>
                            <asp:ListItem Value="4">x4</asp:ListItem>
                            <asp:ListItem Value="5">x5</asp:ListItem>
                            <asp:ListItem Value="6">x6</asp:ListItem>
                            <asp:ListItem Value="7">x7</asp:ListItem>
                            <asp:ListItem Value="8">x8</asp:ListItem>
                            <asp:ListItem Value="9">x9</asp:ListItem>
                            <asp:ListItem Value="10">x10</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_tipo_quarto"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT tipo_quarto.* FROM tipo_quarto"></asp:SqlDataSource>
                        <br>
                        <br>
                        <br>
                        <br>
                         
                          <asp:Button ID="Editar" runat="server" Text="Adicionar" class="<%--login_form--%> <%--button animated fadeInUp animate4" OnClick ="Editar_Click"  Height="60px" BackColor="#40E0D0"/>

                    </fieldset>

                  --%>
                    
                    
               <%-- </form>--%>
    <%--        </div>
        </div>--%>







    <br />
    <br />
    <br />


   <asp:TextBox ID="id_hoteis" Visible="false" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
                       

  
    



      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Selecione quantos quartos identicos quer criar:</label></h1>
      


    <div style="margin-left:10%">

    
        
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="90%" Font-Size="Medium">
                            <asp:ListItem Value="1">x1</asp:ListItem>
                            <asp:ListItem Value="2">x2</asp:ListItem>
                            <asp:ListItem Value="3">x3</asp:ListItem>
                            <asp:ListItem Value="4">x4</asp:ListItem>
                            <asp:ListItem Value="5">x5</asp:ListItem>
                            <asp:ListItem Value="6">x6</asp:ListItem>
                            <asp:ListItem Value="7">x7</asp:ListItem>
                            <asp:ListItem Value="8">x8</asp:ListItem>
                            <asp:ListItem Value="9">x9</asp:ListItem>
                            <asp:ListItem Value="10">x10</asp:ListItem>
                        </asp:DropDownList>


    </div>

      
     
           <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
        


        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Selecione o tipo de quarto:</label></h1>
      


    <div style="margin-left:10%">

    
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_tipo_quarto" CssClass="form-control" Width="90%" Font-Size="Medium"></asp:DropDownList>
       <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT tipo_quarto.* FROM tipo_quarto"></asp:SqlDataSource>    
                 


    </div>

      
     
           <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    

       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Preço do quarto</label></h1>
      


    <div style="margin-left:10%">

            
         <asp:TextBox ID="preco" Width="90%" runat="server" class="form-control"  BorderStyle ="Solid" Height="40px"  Font-Size="Medium" placeholder="Preço" ></asp:TextBox>
    
    </div>



     
    






      
    

























      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto quarto:</label></h1>
      


    <div style="margin-left:10%">
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile" Font-Size="Medium" Width="90%"/>

       
    </div>
 <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
  
  





    <div >

    
   

    <asp:Button ID="editar" runat="server" Text="Criar"  OnClick ="Editar_Click" class="btn btn-outline-success " style="width:1200px; height:100px;  left: 0px;" Font-Size="Medium"/>

        </div>
    

    <br />
    <br />





















    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT hoteis.id_hoteis, hoteis.nome_hotel, hoteis.id_classificacao, hoteis.imagem, pais.nome FROM hoteis INNER JOIN pais ON hoteis.id_pais = pais.id_pais"></asp:SqlDataSource>
</asp:Content>
