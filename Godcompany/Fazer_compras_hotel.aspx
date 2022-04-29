<%@ Page Title="" Language="C#" MasterPageFile="~/mestrer_comprar.Master" AutoEventWireup="true" CodeBehind="Fazer_compras_hotel.aspx.cs" Inherits="Godcompany.Fazer_compras_hotel" %>
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
                        title: 'Reserva reservada com sucesso',
                        showConfirmButton: false,
                        timer: 2100
                    })
                

                
            }



            function Error_data_de_hoje() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'O dia da partida tem de ser superior ao dia de hoje',
                    showConfirmButton: false,
                    timer: 3000
                })



            }

            function Error_data_final() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'O dia da chegada nao pode ser nem igual nem inferior ao dia da partida',
                    showConfirmButton: false,
                    timer: 4000
                })



            }

            function Error_data() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Os campos dia partida e chegada são de preenchimento obrigatorio',
                    showConfirmButton: false,
                    timer: 3500
                })



            }
            function Error_quartos_indesponiveis() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Já nao existem quartos desse tipo disponiveis',
                    showConfirmButton: false,
                    timer: 3500
                })



            }

            function Error_pessoas_in() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Não Tem Quartos Suficientes para hospedar todas as pessoas',
                    showConfirmButton: false,
                    timer: 3500
                })



            }



            function Error_pessoas_nada() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Campos por preencher',
                    showConfirmButton: false,
                    timer: 3500
                })



            }
        </script>



         </head>

     <asp:TextBox ID="id_hoteis" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="900px" Visible="false"></asp:TextBox>
        
        <asp:Label ID="lbl_limitante" runat="server" Text="0" Visible="false"></asp:Label>  
    <asp:Label ID="pessoas_limite" runat="server" Text="0" Visible="false"></asp:Label>

  <br />
    <br />
    <br />
      <br />
     <br />
     <br />
     
        
 <div style="display: inline-flex; padding: 10px;">
        <div style="padding: 20px">
            <asp:Image ID="img" runat="server" width="500" Height="550"/>
            <br/><br/>
        
        </div>
        <div style="padding:20px">

            


    <h1 style="color:black; margin-left:40%;  font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Nome hotel:</label></h1>
    <asp:TextBox ID="nome" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="900px" OnTextChanged="nome_TextChanged" BackColor="White" ReadOnly="True" ></asp:TextBox>
       


            
           






     <h1 style="color:black; margin-left:43%;  font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Estrelas:</label></h1>
     <asp:TextBox ID="classificacao" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="900px" OnTextChanged="classificacao_TextChanged" BackColor="White" ReadOnly="True"></asp:TextBox>
    
   

            
            



         <h1 style="color:black; margin-left:45%;  font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Pais:</label></h1>
    
    <asp:TextBox ID="Pais" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="900px" OnTextChanged="Pais_TextChanged" BackColor="White" ReadOnly="True"></asp:TextBox>
    

            <h1 style="color:black; margin-left:40%;  font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Data entrada:</label></h1>
    
    <asp:TextBox ID="data_entrada" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="900px"  TextMode="Date"></asp:TextBox>
    
            <h1 style="color:black; margin-left:42%;  font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Data saida:</label></h1>
    
    <asp:TextBox ID="data_saida" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="900px"  TextMode="Date"></asp:TextBox>
    

                
<%--    <h1 style="color:black"> <label for="inputEmail3" class=" col-form-label" >Numero de Adultos:</label></h1>
    <asp:TextBox ID="txt_adultos" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="900px"></asp:TextBox>

    <h1 style="color:black"> <label for="inputEmail3" class=" col-form-label" >Numero de Crianças:</label></h1>
    <asp:TextBox ID="txt_criancas" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="900px"></asp:TextBox>--%>

    </div>
    </div>
            
    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    

      <div class="col-md-12" >
    <h1 style="color:black; font-size:x-large; margin-left:10%; font-family: Lucida Bright"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Numero de Adultos:</label></h1>
    <asp:TextBox ID="txt_adultos" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%" Text="1"></asp:TextBox>
     </div>

      <div class="col-md-12" >
    <h1 style="color:black; font-size:x-large; margin-left:10%; font-family: Lucida Bright"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Numero de Crianças:</label></h1>
    <asp:TextBox ID="txt_criancas" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%"></asp:TextBox>
     </div>
    
    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    
    <h1 style="color:black; margin-left:41%;  font:medium; font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Escolher tipo de quarto:</label></h1>

    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    <div class="col-md-12" >

    <asp:DropDownList ID="DropDownList4" Font-Size="Medium" class=" <%--form-group Rstar row form-group--%> col-md-6 form-control" runat="server"  DataTextField="nome" DataValueField="id_tipo_quarto" Width="40%" Height="100px" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" style="margin-left:10%"></asp:DropDownList>
   
    
        
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_tipo_quarto, nome FROM tipo_quarto"></asp:SqlDataSource>
   
    
        
        
        <asp:ListBox ID="ListBox2" runat="server" Width="40%" Height="100" SelectionMode="Multiple" Class="col-md-6" style="margin-left:15px"></asp:ListBox>

    </div>
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
     <div class="col-md-12" >

    <asp:Button ID="Button1" runat="server" Text="Adicionar"  OnClick="Button1_Click"   class="btn btn-outline-success col-md-6" Width="30%" Height="60" Font-Size="Medium" style="margin-left:20%"/> 
    <asp:Button ID="btn_reset" runat="server" Text="Apagar tudo"  OnClick="btn_reset_Click"   class="btn btn-outline-success col-md-6" Width="30%" Height="60" Font-Size="Medium"/>
    

    </div>


    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


  
     

      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


   <h1 style="color:black; margin-left:45%;  font:medium; font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Preço total :</label></h1>

    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
  
     <asp:TextBox ID="preço_2" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid" Text="0"  placeholder="Numero" Font-Size="Medium" Width="70%" style="margin-left:15%" BackColor="White" ReadOnly="True" ></asp:TextBox>

    

    
      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


    <asp:Button ID="finalizar" runat="server" class="btn btn-outline-success " Width="70%" Height="100px" style="margin-left:15%" Text="FINALIZAR" OnClick="finalizar_Click" Font-Size="Medium" />



</asp:Content>
