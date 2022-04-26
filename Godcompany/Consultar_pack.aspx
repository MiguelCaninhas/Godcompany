<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="Consultar_pack.aspx.cs" Inherits="Godcompany.Consultar_pack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	



     <br />
	<br />
    <br />

    <div class="gtco-section " style="background-color:white;">

		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">Ver reservas de pack</h2>
					<p>Aqui pode ver qualquer  reserva de qualquer cliente.</p>
				</div>
			</div>


			<h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
  
      
   


      
        
       <h1 style="color:black" > <label for="inputEmail3" class=" col-form-label" >Escolher cliente:</label></h1>
      


    <div style="margin-left:75px">

       <asp:DropDownList ID="escolher_cliente" Font-Size="Medium" class=" <%--form-group Rstar row form-group--%> form-control" runat="server" DataSourceID="escolher_cliente_sql" DataTextField="mail" DataValueField="id_cliente" AutoPostBack="True" OnSelectedIndexChanged="escolher_cliente_SelectedIndexChanged" ></asp:DropDownList>
       

    
        <asp:SqlDataSource ID="escolher_cliente_sql" runat="server" ConnectionString="<%$ ConnectionStrings:bd_agencia_viagensConnectionString %>" ProviderName="<%$ ConnectionStrings:bd_agencia_viagensConnectionString.ProviderName %>" SelectCommand="SELECT id_cliente, mail FROM cliente WHERE (id_cliente &lt;&gt; 8)"></asp:SqlDataSource>
       

    
    </div>
 
  
  

      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>






			<div class="row">

				<asp:DataList ID="dl_consulta_pack" Style="width: 100%;" runat="server" OnItemDataBound="dl_consulta_pack_ItemDataBound" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemCommand="dl_consulta_pack_ItemCommand" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" OnSelectedIndexChanged="dl_consulta_pack_SelectedIndexChanged">
                    <ItemTemplate>
					<asp:Panel ID="Mostrar_pack" runat="server">
				<div class="col-lg-4 col-md-4 col-sm-6 fh5co-card-item image-popup">
					
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<asp:image alt="Image" Width="340px" Height="225px" class="img-responsive" ID="img" runat="server" ></asp:image>
						</figure>



						
						<div class="fh5co-text">
							
							<asp:Label ID="id_reserva" runat="server" ForeColor="Turquoise" Visible ="false"></asp:Label>
                            <asp:Label ID="Nome_pack" runat="server" ForeColor="Turquoise" Font-Size="X-Large"></asp:Label>
						
							
							<p style="align-items:center"><asp:Label ID="Label3" runat="server" ForeColor="Black" Text="dia da reserva: " ></asp:Label><asp:Label ID="dia_da_reserva" runat="server" ></asp:Label></p>
						

							
					<span class="btn btn-primary" >
                                
							<asp:Button ID="btn_cancelar" runat="server" Text="Ver melhor" BorderStyle="None" BackColor="Transparent"  /></span>

						</div>
					</a>
					

				</div>
						</asp:Panel>
                    </ItemTemplate>
			</asp:DataList>

				<%--<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="images/img_2.jpg" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="images/img_2.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Seoul, South Korea</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
							<p><span class="btn btn-primary">Schedule a Trip</span></p>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="images/img_3.jpg" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="images/img_3.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Paris, France</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
							<p><span class="btn btn-primary">Schedule a Trip</span></p>
						</div>
					</a>
				</div>


				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="images/img_4.jpg" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="images/img_4.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Sydney, Australia</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
							<p><span class="btn btn-primary">Schedule a Trip</span></p>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="images/img_5.jpg" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="images/img_5.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Greece, Europe</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
							<p><span class="btn btn-primary">Schedule a Trip</span></p>
						</div>
					</a>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-6">
					<a href="images/img_6.jpg" class="fh5co-card-item image-popup">
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<img src="images/img_6.jpg" alt="Image" class="img-responsive">
						</figure>
						<div class="fh5co-text">
							<h2>Spain, Europe</h2>
							<p>Far far away, behind the word mountains, far from the countries Vokalia..</p>
							<p><span class="btn btn-primary">Schedule a Trip</span></p>
						</div>
					</a>
				</div>--%>

			</div>
		</div>
	</div>
	


		<asp:Panel ID="mostrar_nada" runat="server" Visible ="false">


		<h1 style="margin-left:2%; font-size:xx-large; color:black "><asp:Label ID="Label4" runat="server" Text="Não existe packs reservados"></asp:Label></h1>


	</asp:Panel>


</asp:Content>
