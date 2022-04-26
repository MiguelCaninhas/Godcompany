<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="admin_criar_pack.aspx.cs" Inherits="Godcompany.admin_criar_pack" %>
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
                        title: 'Pack criado com sucesso',
                        showConfirmButton: false,
                        timer: 3000
                    })
                

                
            }



            function Error_escolher_atividade() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'È obrigatorio escolher atividade.',
                    showConfirmButton: false,
                    timer: 8500
                })



            }



            function Error_voo() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'O voo de ida e o voo de volta não podem ser o mesmos',
                    showConfirmButton: false,
                    timer: 6000
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

            function datas_antes_hoje() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'Qualquer das duas datas tem de ser superiores ao dia de hoje',
                    showConfirmButton: false,
                    timer: 5000
                })



            }

            function datas_erro() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'O dia da chegada tem que ser superior ao dia da partida',
                    showConfirmButton: false,
                    timer: 5000
                })



            }


        </script>

    </head>
      


     <%--<br />
     <br />
     <br />
    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control"/>

     <fieldset id="login-fieldset">
         <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource4" DataTextField="nome" DataValueField="id_pais" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
         <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
         
         <asp:TextBox ID="nome_pacote" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
         <asp:TextBox ID="preco" runat="server" class="login animated fadeInUp animate2" placeholder="preço" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
         <asp:TextBox ID="descricao" runat="server" class="login animated fadeInUp animate2" placeholder="lotação" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
                        
                         

                        <asp:Button ID="editar" runat="server" Text="Adicionar" class="<%--login_form--%> <%--button animated fadeInUp animate4" OnClick ="editar_Click" Height="60px" BackColor="#40E0D0"/>
                  
                    </fieldset>--%>


   <%-- <asp:Label ID="Label1" runat="server" Text="Selecione o voo de ida e o voo de chegada, sucessivamente "></asp:Label>
    <asp:GridView runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_voo" DataSourceID="SqlDataSource1"  ForeColor="#333333" GridLines="None" Style="margin-left:15%" Width="70%" Font-Size="Large" AllowPaging="True" ID="gridview12">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server"  />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id_voo" HeaderText="id_voo" InsertVisible="False" ReadOnly="True" SortExpression="id_voo" >
            <ItemStyle Width="30px" />
            </asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" >
                <ItemStyle HorizontalAlign="Center" Width="3000px"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
--%>


   <%-- <asp:GridView ID="GridView1" runat="server" Style="margin-left:15%" Width="70%" Font-Size="Large" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4"  DataKeyNames="id_hoteis" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox2" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id_hoteis" HeaderText="id_hoteis" InsertVisible="False" ReadOnly="True" SortExpression="id_hoteis" />
            <asp:BoundField DataField="nome_hotel" HeaderText="nome_hotel" SortExpression="nome_hotel" >
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
        --%>

         
  <%--  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_hoteis , nome_hotel FROM hoteis"></asp:SqlDataSource>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_voo, nome FROM voo"></asp:SqlDataSource>
--%>




    <asp:Panel ID="Panel_tudo" runat="server">


               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Criar pack.</h2>
					<p>Aqui pode criar o pack de viagens que deseija.</p>
				</div>

    <br />
    <br />
    <br />


  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Nome pack:</label></h1>
    <asp:TextBox ID="nome_pacote" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid" Height="40px"  Font-Size="Medium" placeholder="Nome" ></asp:TextBox>
  </div>


  <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Preço pack:</label></h1>
    <asp:TextBox ID="preco" runat="server" class="form-control col-sm-9" placeholder="preço" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" ></asp:TextBox>
  </div>    

  
      <div class="col-md-12">
    <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Descrição pack:</label></h1>
    <asp:TextBox ID="descricao" runat="server" class="form-control col-sm-9" placeholder="Descrição pack" TextMode="MultiLine" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" ></asp:TextBox>               
    </div>    

    
          <div class="col-md-12">
    
           <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Dia partida:</label></h1>
          <asp:TextBox ID="dia_partida" runat="server" class="form-control col-sm-9" placeholder="Hora partida" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" TextMode="Date"></asp:TextBox>

                       
  </div>
    
     <div class="col-md-12">
    
           <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Dia chegada:</label></h1>
    <asp:TextBox ID="dia_chegada" runat="server" class="form-control col-sm-9" placeholder="Hora chegada" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" TextMode="Date"></asp:TextBox>
                       
  </div>
    
         <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    

  
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Pais destino pack:</label></h1>
      


    <div >

     <asp:DropDownList ID="Drop_pais_pack" runat="server" DataSourceID="sql_pais_pack" DataTextField="nome" DataValueField="id_pais" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Font-Size="Medium" style="margin-left:10%" Width="80%" OnCallingDataMethods="Drop_pais_pack_CallingDataMethods" OnDataBound="Drop_pais_pack_DataBound"></asp:DropDownList>
    
         
        <asp:SqlDataSource ID="sql_pais_pack" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
    
         
    </div>
 
  
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Hotel pack:</label></h1>
      


    <div >

     <asp:DropDownList ID="Drop_hotel" runat="server" DataSourceID="Sql_hoteis" DataTextField="nome_hotel" DataValueField="id_hoteis" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Enabled="False" Font-Size="Medium" style="margin-left:10%" Width="80%"></asp:DropDownList>
     
         
        <asp:SqlDataSource ID="Sql_hoteis" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT hoteis.id_hoteis, hoteis.nome_hotel FROM  hoteis"></asp:SqlDataSource>
     
         
    </div>
 
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Voo de ida pack:</label></h1>
      


    <div >

     <asp:DropDownList ID="Drop_voo_origem" runat="server" DataSourceID="Sql_voo_origem" DataTextField="nome" DataValueField="id_voo" CssClass="form-control" OnSelectedIndexChanged="Drop_voo_origem_SelectedIndexChanged" AutoPostBack="True" Enabled="False" Font-Size="Medium" style="margin-left:10%" Width="80%" OnDataBound="Drop_voo_origem_DataBound"></asp:DropDownList>
     
         
        <asp:SqlDataSource ID="Sql_voo_origem" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_voo, nome FROM voo "></asp:SqlDataSource>
     
         
    </div>
 
  

       <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Voo de volta pack:</label></h1>
      


    <div >

     <asp:DropDownList ID="Drop_voo_destino" runat="server" DataSourceID= Sql_voo_destino DataValueField="id_voo" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Enabled="False" Font-Size="Medium" DataTextField="nome" style="margin-left:10%" Width="80%"></asp:DropDownList>
   
         
        <asp:SqlDataSource ID="Sql_voo_destino" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_voo, nome FROM voo"></asp:SqlDataSource>
   
         
    </div>

         <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto pack:</label></h1>
      

          <div >
        <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control" for="customFile" Font-Size="Medium" style="margin-left:10%" Width="80%" BorderColor="Turquoise"/>

       
    </div>
 


        </asp:Panel>

    <asp:Panel ID="Panel_atividades" runat="server" Visible ="false">


          <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Escolher atividades</h2>
					<p>Escolha as atividades que quer neste especifico pack.</p>
				</div>

          <asp:GridView ID="GridView2" runat="server" PageSize="5" DataSourceID="carregar_tabelas_atividade" AllowPaging="True" CellPadding="4" GridLines="Horizontal" Style="margin-left:15%" Width="70%" Font-Size="Large" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AutoGenerateColumns="False" DataKeyNames="id_atividade" >
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_atividade" HeaderText="id_atividade" InsertVisible="False" ReadOnly="True" SortExpression="id_atividade" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="preço" HeaderText="preço" SortExpression="preço" />
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





          <asp:SqlDataSource ID="carregar_tabelas_atividade" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_atividade, nome, preco as preço FROM atividade" OnLoad="carregar_tabelas_atividade_Load"></asp:SqlDataSource>





         

    </asp:Panel>






      <br />
      <br />
      <br />


    <div >
         <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
    
   <asp:Button ID="Mostrar_atividades" runat="server" Text="Escolher atividades"  OnClick="Mostrar_atividades_Click"  class="btn btn-outline-success " style="width:600px; height:100px; align-items:center"  Font-Size="Medium" Enabled="false"/>
        </div >
     <h3 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h3>
      
            <div >
    <asp:Button ID="editar" runat="server" Text="Criar" Visible="false"  OnClick ="editar_Click" class="btn btn-outline-success " style="width:600px; height:100px;  align-items:center" Font-Size="Medium"/>



                

        </div>
    

    <div>
        <asp:Button ID="reset" runat="server" Text="Voltar ao inicio" Visible="false"  OnClick ="reset_Click" class="btn btn-outline-success " style="width:600px; height:100px;  align-items:center" Font-Size="Medium"/>

    </div>

    <br />
    <br />
    
</asp:Content>
