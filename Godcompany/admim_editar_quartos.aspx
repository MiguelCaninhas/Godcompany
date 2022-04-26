<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admim_editar_quartos.aspx.cs" Inherits="Godcompany.admim_editar_quartos" %>
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
                        title: 'Quarto editado com sucesso',
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
                    title: 'Antes de editar o quarto, tem de escolher o quarto que quer editar na tabela que se encontra na parte superior da tela.',
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
                    title: 'Antes de apagar o quarto, tem de escolher o quarto que quer apagar na tabela que se encontra na parte superior da tela.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }
        </script>

    </head>






    
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Editar quartos</h2>
					<p>Em primeiro escolha o quarto que quer editar.</p>
				</div>

    <br />
    <br />
    <br />







     <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Escolha o hotel que o quarto esta associado:</label></h1>
      


    <div style="margin-left:10%">

    
        
    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" Font-Size="Medium" DataTextField="nome_hotel" DataValueField="id_hoteis" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" Width="90%" CssClass="form-control"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT hoteis.* FROM hoteis"></asp:SqlDataSource>

    </div>

      
     
           <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      


    <asp:GridView ID="GridView1" runat="server" PageSize="5" AutoGenerateColumns="False" Style="margin-left:15%" Width="70%" Font-Size="Large" DataKeyNames="id_quartos" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="nome_hotel" HeaderText="Nome hotel" SortExpression="nome_hotel" />
            <asp:BoundField DataField="preco" HeaderText="Preço" SortExpression="preco"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="Tipo de quarto" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="id_quartos" HeaderText="Numero quarto" SortExpression="id_quartos" InsertVisible="False" ReadOnly="True"></asp:BoundField>
            <asp:ImageField DataImageUrlField="imagem" DataImageUrlFormatString="~/images/{0}">
                <ControlStyle Height="80px" Width="130px" />
            </asp:ImageField>
        </Columns>
        <EmptyDataTemplate>Não existem quartos</EmptyDataTemplate>
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
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT quartos.preco, quartos.imagem, tipo_quarto.nome, quartos.id_quartos, hoteis.nome_hotel FROM quartos INNER JOIN tipo_quarto ON quartos.id_tipo_quarto = tipo_quarto.id_tipo_quarto INNER JOIN hoteis ON quartos.id_hoteis = hoteis.id_hoteis"></asp:SqlDataSource>



 <%--<div>
           <div class="panel shadow1 login-form">--%>
            <%-- <form > --%>  
                   
                  
                 <%--   <fieldset id="login-fieldset">

                        <asp:TextBox ID="id_quarto" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Id" ></asp:TextBox>
                        
                        <asp:TextBox ID="preco" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Preço" ></asp:TextBox>
                        <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control" for="customFile" />
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="nome_hotel" DataValueField="id_hoteis" AutoPostBack="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" DataValueField="id_tipo_quarto"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT tipo_quarto.* FROM tipo_quarto"></asp:SqlDataSource>
                        <br>
                        <br>
                        <br>
                        <br>
                         
                          <asp:Button ID="Editar" runat="server" Text="Editar" class="<%--login_form--%> <%--button animated fadeInUp animate4" OnClick ="Editar_Click"  Height="60px" BackColor="#40E0D0"/>--%>

                  <%--  </fieldset>--%>

                  
                    
                    
               <%-- </form>--%>
     <%--       </div>
        </div>--%>


    <asp:TextBox ID="id_quarto" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Id" Visible="false" ></asp:TextBox>












     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
        


        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Selecione o hotel que quer associar a este quarto:</label></h1>
      


    <div style="margin-left:10%">

     <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" Font-Size="Medium" DataTextField="nome_hotel" DataValueField="id_hoteis" AutoPostBack="True" class="form-control" Width="90%" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>

    </div>





     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
        


        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Selecione o tipo de quarto:</label></h1>
      


    <div style="margin-left:10%">

    
   <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="nome" Font-Size="Medium" class="form-control" Width="90%" DataValueField="id_tipo_quarto"></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT tipo_quarto.* FROM tipo_quarto"></asp:SqlDataSource>

    </div>






    
           <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    

       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Preço do quarto:</label></h1>
      


    <div style="margin-left:10%">

            
         <asp:TextBox ID="preco" Width="90%" runat="server" class="form-control"  BorderStyle ="Solid" Height="40px" ForeColor="Black" Font-Size="Medium" placeholder="Preço" ></asp:TextBox>
    
    </div>




    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto quarto:</label></h1>
      


    <div style="margin-left:10%">
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile" Font-Size="Medium" Width="90%"/>

       
    </div>
 <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
  

    <div>

   <asp:Button ID="editar" runat="server" Text="Editar"  OnClick ="Editar_Click" class="btn btn-outline-success " style="width:600px; height:100px;  left: 0px;" Font-Size="Medium"/>

         <asp:Button ID="Eliminar" runat="server" Text="Eliminar"  OnClick ="Eliminar_Click" class="btn btn-outline-success " style="width:600px; height:100px;  left: 0px;" Font-Size="Medium"/>

        </div>
</asp:Content>
