<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="Admin_editar_pack.aspx.cs" Inherits="Godcompany.Admin_editar_pack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >


     <script src="swalert.js" type="text/javascript"></script>


    <head>

       

        <script>

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

            function Correct() {

              


                Swal.fire({
                    padding: '8em',
                        width: 600,
                        position: 'center',
                        icon: 'success',
                        title: 'Pack editado com sucesso',
                        showConfirmButton: false,
                        timer: 3000
                    })
                

                
            }

            function Correct_eliminar() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'success',
                    title: 'Pack eliminado com sucesso',
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



            function atecao_editar_comando() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'question',
                    title: 'Atenção devido a ja existir reservas para este pack pode surgir alguns comflitos se o editar !',
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
                    title: 'Já existe reservas para este pack devido a isso não é possivel apagá lo',
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
                    title: 'Campos por preencher',
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

    <asp:Panel ID="mostrar_tudo_inicial" runat="server">



               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Editar pack.</h2>
					<p>Em primeiro escolha o pack que quer editar</p>
				</div>

    <br />
    <br />
    <br />

    <asp:Panel ID="Panel_inicial" runat="server">
        <asp:GridView ID="GridView1" runat="server" PageSize="5" AutoGenerateColumns="False" DataKeyNames="id_viagens_pacotes" DataSourceID="SqlDataSource1" Style="margin-left:15%" Width="70%" Font-Size="Large" AllowPaging="True" CellPadding="4" GridLines="Horizontal"  OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" >
        <Columns>
            <asp:ButtonField CommandName="Ver_comando" Text="Ver" />
            <asp:ButtonField CommandName="eliminar_comando" Text="Eliminar" />
            <asp:ButtonField CommandName="Editar_comando" Text="Editar" />
            <asp:BoundField DataField="id_viagens_pacotes" HeaderText="id_viagens_pacotes" ReadOnly="True" InsertVisible="False" SortExpression="id_viagens_pacotes"></asp:BoundField>
            <asp:BoundField DataField="nome_pacote" HeaderText="nome_pacote" SortExpression="nome_pacote"></asp:BoundField>
            <asp:BoundField DataField="pre&#231;o" HeaderText="preço" SortExpression="pre&#231;o"></asp:BoundField>
           
            <asp:BoundField DataField="descricao" HeaderText="descricao" SortExpression="descricao" />
            <asp:BoundField DataField="nome_pais" HeaderText="nome_pais" SortExpression="nome_pais" />
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

     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT viagens_pacotes.id_viagens_pacotes, viagens_pacotes.nome_pacote, viagens_pacotes.preço, viagens_pacotes.imagem, viagens_pacotes.descricao, pais.nome as nome_pais FROM pais INNER JOIN viagens_pacotes ON pais.id_pais = viagens_pacotes.id_pais where viagens_pacotes.id_viagens_pacotes != 31 and viagens_pacotes.id_viagens_pacotes != 32"></asp:SqlDataSource>


        </asp:Panel>
        </asp:Panel>

    <%--<asp:Panel ID="Panel_editar" runat="server" Visible="false">
        <br />
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control"/>
    
    <fieldset id="login-fieldset">
        <asp:Label ID="Label1" runat="server" Text="Editar Pais"></asp:Label>
         <asp:DropDownList ID="pais" runat="server" DataSourceID="SqlDataSource4" DataTextField="nome" DataValueField="id_pais"></asp:DropDownList>   <br /><br />
         <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>' ProviderName='<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>' SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
         
         <asp:TextBox ID="nome_pacote" runat="server" class="login animated fadeInUp animate2"  BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
         <asp:TextBox ID="preco" runat="server" class="login animated fadeInUp animate2" placeholder="preço" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
         <asp:TextBox ID="descricao" runat="server" class="login animated fadeInUp animate2" placeholder="lotação" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" ></asp:TextBox>
         <asp:TextBox ID="id_viagens_pacotes" runat="server" class="login animated fadeInUp animate2" visible="false" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
         
        
        
        
        
        
        
        
        
        
        
        
        
        
        
     

   <%-- </fieldset>



        <asp:Button ID="adicionar_voo" runat="server" Text="Mostrar Voos" OnClick="adicionar_voo_Click" />
        <asp:Button ID="adicionar_hoteis" runat="server" Text="Mostrar Hoteis" OnClick="adicionar_hoteis_Click" />
        <asp:Button ID="adicionar_atividades" runat="server" Text="Mostrar Atividades" OnClick="adicionar_atividades_Click" />

        <br />
        <br />
        <br />
        <br />

        <asp:Panel ID="Panel_adicionar_voos" runat="server" Visible="false">
            <asp:GridView ID="Voo_grid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_voo" Style="margin-left:15%" Width="70%" Font-Size="Large" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_voo" HeaderText="id_voo" InsertVisible="False" ReadOnly="True" SortExpression="id_voo" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
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

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_voo, nome FROM voo"></asp:SqlDataSource>

            </asp:Panel>
        <asp:Panel ID="Panel_adicionar_hoteis" runat="server" Visible="false">

            <asp:GridView ID="Hoteis_grid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_hoteis" Style="margin-left:15%" Width="70%" Font-Size="Large" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox2" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_hoteis" HeaderText="id_hoteis" InsertVisible="False" ReadOnly="True" SortExpression="id_hoteis" />
                    <asp:BoundField DataField="nome_hotel" HeaderText="nome_hotel" SortExpression="nome_hotel" />
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

             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_hoteis, nome_hotel FROM hoteis"></asp:SqlDataSource>

            </asp:Panel>


        <asp:Panel ID="Panel_adicionar_atividade" runat="server" Visible="false">
            <asp:GridView ID="Atividade_grid" runat="server" AutoGenerateColumns="False"  Style="margin-left:15%" Width="70%" Font-Size="Large" CellPadding="4" DataKeyNames="id_atividade" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox3" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_atividade" HeaderText="id_atividade" InsertVisible="False" ReadOnly="True" SortExpression="id_atividade" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
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

             <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_atividade, nome FROM atividade"></asp:SqlDataSource>


         
   
  </asp:Panel>
        </asp:Panel>--%>


    <asp:TextBox ID="id_viagens_pacotes" runat="server" class="login animated fadeInUp animate2" visible="false" BorderStyle ="Solid" Height="40px" ForeColor="White" Font-Size="Medium" placeholder="Nome" ></asp:TextBox> 
         
        

    <asp:Panel ID="Panel_tudo" runat="server" Visible="false">


               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Editar pack.</h2>
					<p>Aqui pode editar o pack de viagens que deseija.</p>
            	<p>Antes de editar qualquer campo é necessario escolher o pais destino.</p>
				</div>

    <br />
    <br />
    <br />

        <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

        <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Pais destino pack:</label></h1>
      

        
      


    <div >

     <asp:DropDownList ID="Drop_pais_pack" runat="server" DataSourceID="sql_pais_pack" DataTextField="nome" DataValueField="id_pais" CssClass="form-control" OnSelectedIndexChanged="Drop_pais_pack_SelectedIndexChanged" AutoPostBack="True" Font-Size="Medium" OnDataBound="Drop_pais_pack_DataBound" style="margin-left:10%" Width="80%"></asp:DropDownList>
    
         
        <asp:SqlDataSource ID="sql_pais_pack" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT pais.* FROM pais"></asp:SqlDataSource>
    
         
    </div>
 
                <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

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
            <asp:TextBox ID="dia_partida_escrever" runat="server" class="form-control col-sm-2" placeholder="Hora partida" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" TextMode="Date" OnTextChanged="dia_partida_escrever_TextChanged"></asp:TextBox>
              <asp:TextBox ID="dia_partida" runat="server" class="form-control col-sm-7" placeholder="Hora partida" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" ></asp:TextBox>
                       
  </div>
    
     <div class="col-md-12">
    
           <h1 style="color:black"> <label for="inputEmail3" class="col-sm-3 col-form-label" >Dia chegada:</label></h1>
    <asp:TextBox ID="dia_chegada_escrever" runat="server" class="form-control col-sm-2" placeholder="Hora chegada" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" TextMode="Date" OnTextChanged="dia_chegada_escrever_TextChanged"></asp:TextBox>
    <asp:TextBox ID="dia_chegada" runat="server" class="form-control col-sm-7" placeholder="Hora chegada" BorderStyle ="Solid" Height="40px"  Font-Size="Medium" ></asp:TextBox>
                       
  </div>
    
    
         

  
     
  
     <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Hotel pack:</label></h1>
      


    <div >

     <asp:DropDownList ID="Drop_hotel" runat="server" DataSourceID="Sql_hoteis" DataTextField="nome_hotel" DataValueField="id_hoteis" CssClass="form-control" OnSelectedIndexChanged="Drop_hotel_SelectedIndexChanged" AutoPostBack="True" Enabled="False" Font-Size="Medium" style="margin-left:10%" Width="80%"></asp:DropDownList>
     
         
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

     <asp:DropDownList ID="Drop_voo_destino" runat="server" DataSourceID= Sql_voo_destino DataValueField="id_voo" CssClass="form-control" OnSelectedIndexChanged="Drop_voo_destino_SelectedIndexChanged" AutoPostBack="True" Enabled="False" Font-Size="Medium" DataTextField="nome" style="margin-left:10%" Width="80%"></asp:DropDownList>
   
         
        <asp:SqlDataSource ID="Sql_voo_destino" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_voo, nome FROM voo"></asp:SqlDataSource>
   
         
    </div>
   


         <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Foto pack:</label></h1>
      


    <div >
        <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" for="customFile" Font-Size="Medium" style="margin-left:10%" Width="80%" BorderColor="Turquoise"/>

       
    </div>




     




        </asp:Panel>


           <br />
      <br />
      <br />

       <asp:Panel ID="Panel_adicionar_atividades" runat="server" Visible ="false">


           
               <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
          

        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Escolher atividades.</h2>
					<p>Aqui escolher as atvidades a sua preferencia.</p>
				</div>

    <br />
    <br />
    <br />


            <asp:GridView ID="Atividade_grid" PageSize="5" runat="server" AutoGenerateColumns="False"  Style="margin-left:15%" Width="70%" Font-Size="Large" CellPadding="4" DataKeyNames="id_atividade" DataSourceID="SqlDataSource5" GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox3" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="id_atividade" HeaderText="Numero atividade" InsertVisible="False" ReadOnly="True" SortExpression="id_atividade" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                </Columns>
                <EmptyDataTemplate>Nao existem atvidades associadas a este pais</EmptyDataTemplate>
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

             <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_atividade, nome FROM atividade"></asp:SqlDataSource>


         </asp:Panel>
   
  



    <asp:Panel ID="mostrar_btn" runat="server" Visible ="false">

             <br />
      <br />
      <br />
      

    <div >

    <asp:Button ID="adicionar_atividades" runat="server" Text="Mostrar Atividades" OnClick="adicionar_atividades_Click" class="btn btn-outline-success " style="width:600px; height:100px; align-items:center"  Font-Size="Medium" Enabled="false" />
   
    </div >
         <h3 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h3>
      
    <div >
    <asp:Button ID="editar" runat="server" Text="Editar"  OnClick ="editar_Click" class="btn btn-outline-success " style="width:600px; height:100px;  align-items:center" Font-Size="Medium" Visible ="false"/>
       
   </div>
    
        <div>
             <asp:Button ID="reset" runat="server" Text="Voltar ao inicio" Visible="false"  OnClick ="reset_Click" class="btn btn-outline-success " style="width:600px; height:100px;  align-items:center" Font-Size="Medium"/>
        </div>

    <br />
    <br />
              </asp:Panel>    










    <asp:Panel ID="Panel1" runat="server"  Visible ="false">



        <asp:Panel ID="Validar_errado" runat="server" Visible ="false">

               <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Não existe nada associado a este pack</h2>
					<p>Verifique se exite algo neste pack</p>
				</div>

    <br />
    <br />
    <br />


        </asp:Panel>



          
        <asp:Panel ID="validar_certo" runat="server">
        <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Eliminar</h2>
					<p>Aqui pode desassociar hoteis/atividades/voos deste respetivo pack</p>
				</div>

    <br />
    <br />
    <br />





               
        <asp:GridView ID="hoteis_grid_mostrar" runat="server" PageSize="5" CellPadding="4" GridLines="Horizontal" Style="margin-left:15%" Width="70%" Font-Size="Large" AutoGenerateColumns="False" DataSourceID="mostrar_hoteis" OnSelectedIndexChanged="hoteis_grid_mostrar_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" OnCallingDataMethods="hoteis_grid_mostrar_CallingDataMethods" OnLoad="hoteis_grid_mostrar_Load" OnPageIndexChanged="hoteis_grid_mostrar_PageIndexChanged" OnPageIndexChanging="hoteis_grid_mostrar_PageIndexChanging" AllowPaging="True">
            <Columns>
                <asp:CommandField SelectText="Eliminar" ShowSelectButton="True" />
                <asp:BoundField DataField="id_viagens_pacotes" HeaderText="Numero pack" SortExpression="id_viagens_pacotes" />
                <asp:BoundField DataField="nome_pacote" HeaderText="Nome pacote" SortExpression="nome_pacote" />
                <asp:BoundField DataField="id_hoteis" HeaderText="Numero hotel" SortExpression="id_hoteis" />
                <asp:BoundField DataField="nome_hotel" HeaderText="Nome hotel" SortExpression="nome_hotel" />
            </Columns>

            <EmptyDataTemplate>Nao existem hoteis associados a este pack</EmptyDataTemplate>
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
                    <asp:GridView ID="voos_grid_mostrar" PageSize="5" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="mostrar_voos" Font-Size="Large" GridLines="Horizontal" Style="margin-left:15%" Width="70%" OnSelectedIndexChanged="voos_grid_mostrar_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True">
                        <Columns>
                            <asp:CommandField SelectText="Eliminar" ShowSelectButton="True" />
                            

                            <asp:BoundField DataField="id_viagens_pacotes" HeaderText="Numero pack" SortExpression="id_viagens_pacotes" />
                            <asp:BoundField DataField="nome_pacote" HeaderText="Nome pacote" SortExpression="nome_pacote" />
                            <asp:BoundField DataField="id_voo" HeaderText="Numero voo" SortExpression="id_voo" />
                            <asp:BoundField DataField="nome_voo" HeaderText="Nome voo" SortExpression="nome_voo" />
                        </Columns>
                        <EmptyDataTemplate>Nao existem voos associados a este pack</EmptyDataTemplate>
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
        <asp:SqlDataSource ID="mostrar_voos" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT viagens_pacotes.nome_pacote, viagens_voo.id_voo, voo.nome AS nome_voo, viagens_voo.id_viagens_pacotes FROM viagens_voo INNER JOIN voo ON viagens_voo.id_voo = voo.id_voo INNER JOIN viagens_pacotes ON viagens_voo.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="mostrar_hoteis" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT viagens_pacotes.nome_pacote, viagens_hoteis.id_hoteis, hoteis.nome_hotel, viagens_hoteis.id_viagens_pacotes FROM viagens_hoteis INNER JOIN hoteis ON viagens_hoteis.id_hoteis = hoteis.id_hoteis INNER JOIN viagens_pacotes ON viagens_hoteis.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes" OnUpdated="mostrar_hoteis_Updated"></asp:SqlDataSource>
               


        <asp:GridView ID="atividades_grid_mostrar" PageSize="5" runat="server" CellPadding="4" GridLines="Horizontal" AutoGenerateColumns="False" Style="margin-left:15%" Width="70%" Font-Size="Large" DataSourceID="mostrar_atividades" OnSelectedIndexChanged="atividades_grid_mostrar_SelectedIndexChanged" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" AllowPaging="True">
            <Columns>
                <asp:CommandField SelectText="Eliminar" ShowSelectButton="True" />
                <asp:BoundField DataField="id_viagens_pacotes" HeaderText="Numero pack" SortExpression="id_viagens_pacotes" />
                <asp:BoundField DataField="nome_pacote" HeaderText="Nome pacote" SortExpression="nome_pacote" />
                <asp:BoundField DataField="id_atividade" HeaderText="Numero atividade" SortExpression="id_atividade" />
               
                <asp:BoundField DataField="nome" HeaderText="Nome atividade" SortExpression="nome" />
               
            </Columns>
            <EmptyDataTemplate>Nao existem atvidades associados a este pack</EmptyDataTemplate>
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
                    <asp:SqlDataSource ID="mostrar_atividades" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT viagens_pacotes.nome_pacote, viagens_atividades.id_atividade, atividade.nome, viagens_atividades.id_viagens_pacotes FROM viagens_atividades INNER JOIN atividade ON viagens_atividades.id_atividade = atividade.id_atividade INNER JOIN viagens_pacotes ON viagens_atividades.id_viagens_pacotes = viagens_pacotes.id_viagens_pacotes"></asp:SqlDataSource>
       
            </asp:Panel>
    </asp:Panel>
    




            
    




</asp:Content>
