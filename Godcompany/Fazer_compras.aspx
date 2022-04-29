<%@ Page Title="" Language="C#" MasterPageFile="~/mestrer_comprar.Master" AutoEventWireup="true" CodeBehind="Fazer_compras.aspx.cs" Inherits="Godcompany.Fazer_compras" %>
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



            function Error() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Campos por preencher',
                    showConfirmButton: false,
                    timer: 2100
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
        </script>





    <asp:TextBox ID="id_hoteis" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="900px" Visible="false"></asp:TextBox>
    <asp:TextBox ID="id_atividades" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="900px" Visible="false"></asp:TextBox>
     <asp:Label ID="data_entrada" runat="server" Text="" Visible="false"></asp:Label>         
    <asp:Label ID="data_saida" runat="server" Text="" Visible="false"></asp:Label>  
        <asp:Label ID="lbl_limitante" runat="server" Text="0" Visible="false"></asp:Label>  
    <asp:Label ID="pessoas_limite" runat="server" Text="0" Visible="false"></asp:Label>

  <br />
    <br />
    <br />
      <br />
     <br />
     <br />
     
        
 <div style="display: inline-flex">

        <div >
            <asp:Image ID="img" runat="server" width="100%" Height="550" style="margin-left:20%"/>
            <br/><br/>
        
        </div>

        <div style ="margin-left:15%">


    <h1 style="color:black"> <label for="inputEmail3" class=" col-form-label" style="font-family: Lucida Bright" >Nome pack:</label></h1>
    <asp:TextBox ID="nome" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="500px" BackColor="White" ReadOnly="True"></asp:TextBox>
       
    <h1 style="color:black"> <label for="inputEmail3" class=" col-form-label" style="font-family: Lucida Bright" >Voo de Ida:</label></h1>
     <asp:Label ID="lbl_id_voo_ida" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:TextBox ID="txt_voo_ida" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="440px" BackColor="White" ReadOnly="True"></asp:TextBox>
   <asp:TextBox ID="txt_voo_de_ida" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="220px" BackColor="White" ReadOnly="True"></asp:TextBox>
    <asp:TextBox ID="txt_hora_voo_ida" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="220px" BackColor="White" ReadOnly="True"></asp:TextBox>
    <asp:TextBox ID="txt_hora_chegada_voo_ida" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="220px" BackColor="White" ReadOnly="True"></asp:TextBox>

    <h1 style="color:black"> <label for="inputEmail3" class=" col-form-label" style="font-family: Lucida Bright" >Voo de Volta:</label></h1>
     <asp:Label ID="lbl_id_voo_volta" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:TextBox ID="txt_voo_volta" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="440px" BackColor="White" ReadOnly="True"></asp:TextBox>
    <asp:TextBox ID="txt_dia_volta" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="220px" BackColor="White" ReadOnly="True"></asp:TextBox>
    <asp:TextBox ID="txt_hora_voo_volta" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="220px" BackColor="White" ReadOnly="True"></asp:TextBox>
    <asp:TextBox ID="txt_hora_chegada_voo_volta" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="220px" BackColor="White" ReadOnly="True"></asp:TextBox>

    <h1 style="color:black"> <label for="inputEmail3" class=" col-form-label" style="font-family: Lucida Bright" >Hotel:</label></h1>
     <asp:Label ID="lbl_id_hotel" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:TextBox ID="txt_hotel" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="500px" BackColor="White" ReadOnly="True"></asp:TextBox>
                

    </div>
    </div>
            
    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    

      <div class="col-md-12" >
    <h1 style="color:black; font-size:x-large; margin-left:10%; font-family: Lucida Bright " > <label for="inputEmail3" class="col-sm-3 col-form-label" >Numero de Adultos:</label></h1>
    <asp:TextBox ID="txt_adultos" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%" Text="1"></asp:TextBox>
     </div>

      <div class="col-md-12" >
    <h1 style="color:black; font-size:x-large; margin-left:10%; font-family: Lucida Bright"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Numero de Crianças:</label></h1>
    <asp:TextBox ID="txt_criancas" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%"></asp:TextBox>
     </div>
    
    
           
    <div class="col-md-12" >
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
       <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

     <h1 style="color:black;   font-size:x-large; margin-left:42%; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Escolher tipo de quarto:</label></h1>

    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    <asp:DropDownList ID="DropDownList4" Font-Size="Medium" class=" <%--form-group Rstar row form-group--%> col-md-6 form-control" runat="server"  DataTextField="nome" DataValueField="id_tipo_quarto" Width="40%" Height="100" DataSourceID="escolher_tipo_quarto" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" style="margin-left:10%"></asp:DropDownList>
    <asp:SqlDataSource ID="escolher_tipo_quarto" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_tipo_quarto, nome FROM tipo_quarto"></asp:SqlDataSource>
    
       
        
        <asp:ListBox ID="ListBox2" runat="server" Width="40%" Height="100" SelectionMode="Multiple" Class="col-md-6" style="margin-left:15px"></asp:ListBox>

    </div>


     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
     <div class="col-md-12"  >
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    <asp:Button ID="Button1" runat="server" Text="Adicionar"  OnClick="Eliminar_Click1"   class="btn btn-outline-success col-md-6" Width="30%" Height="60" Font-Size="Medium" style="margin-left:21%"/> 
    <asp:Button ID="btn_reset" runat="server" Text="Apagar tudo"  OnClick="btn_reset_Click"   class="btn btn-outline-success col-md-6" Width="30%" Height="60" Font-Size="Medium"/>
    

    </div>

              <div class="col-md-12"  >
    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

                      
   <h1 style="color:black; margin-left:43%;  font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Escolher atividades:</label></h1>

    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

                  </div>
           
    <div class="col-md-12" >
    
    <asp:DropDownList ID="DropDownList3" Font-Size="Medium" class=" col-md-6 form-control" runat="server"  DataTextField="nome" DataValueField="id_atividade" Width="40%" Height="100px" DataSourceID="escolher_atividade" style="margin-left:10%"></asp:DropDownList>
    <asp:SqlDataSource ID="escolher_atividade" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_atividade, nome FROM atividade"></asp:SqlDataSource>

    
    
    <asp:ListBox ID="ListBox1" runat="server"  Width="40%" Height="100" SelectionMode="Multiple" Class="col-md-6"></asp:ListBox>
         </div>
    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    <div class="col-md-12" >
         <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
        <asp:Button ID="atividades" runat="server" Text="Adicionar"  OnClick="atividades_Click"  class="btn btn-outline-success col-md-6" Width="30%" Height="60" Font-Size="Medium" style="margin-left:21%"/>
    <asp:Button ID="btn_reset_atividades" runat="server" Text="Apagar tudo" OnClick="btn_reset_atividades_Click" class="btn btn-outline-success col-md-6" Width="30%" Height="60" Font-Size="Medium" />
   </div>

       <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


      
    
     

              <div class="col-md-12"  >
                   <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
   <h1 style="color:black; margin-left:43%;  font-size:x-large; font-family: Lucida Bright"> <label for="inputEmail3" class=" col-form-label" >Preço por pessoa :</label></h1>

    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      </div>
     <asp:TextBox ID="preço" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="70%" style="margin-left:15%" Enabled="false"></asp:TextBox>
                        <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


    
      


    <asp:Button ID="finalizar" runat="server" class="btn btn-outline-success " Width="70%" Height="100px" style="margin-left:15%" Text="FINALIZAR" OnClick="finalizar_Click" Font-Size="Medium" />





</asp:Content>
