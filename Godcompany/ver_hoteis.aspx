<%@ Page Title="" Language="C#" MasterPageFile="~/mestrer_comprar.Master" AutoEventWireup="true" CodeBehind="ver_hoteis.aspx.cs" Inherits="Godcompany.ver_hoteis" %>
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
					<h2 style="color:#40E0D0; ">Melhores hoteis</h2>
					<p>A Goodcompany é uma das formas mais econômicas de reservar sua viagem.</p>
				</div>
			</div>
			<div class="row">

				<asp:DataList ID="dl_destinos" Style="width: 100%;" runat="server" OnItemDataBound="dl_destinos_ItemDataBound" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemCommand="dl_destinos_ItemCommand" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" OnSelectedIndexChanged="dl_destinos_SelectedIndexChanged">
                    <ItemTemplate>
					<asp:Panel ID="Mostrar_hotel" runat="server">
				<div class="col-lg-4 col-md-4 col-sm-6 fh5co-card-item image-popup">
					
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<asp:image alt="Image" Width="340px" Height="225px" class="img-responsive" ID="img" runat="server" ></asp:image>
						</figure>



						
						<div class="fh5co-text">
							
							<asp:Label ID="id_hotel" runat="server" ForeColor="Turquoise" Visible ="false"></asp:Label>
                            <asp:Label ID="Nome_hotel" runat="server" ForeColor="Turquoise" Font-Size="X-Large"></asp:Label>
						
							<p style="align-items:center"><asp:Label ID="Label1" runat="server" ForeColor="Black" Text="Estrelas: " ></asp:Label><asp:Label ID="estrelas" runat="server" ></asp:Label></p>
							<p style="align-items:center"><asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Pais: "></asp:Label><asp:Label ID="pais" runat="server"></asp:Label></p>

							
					<span class="btn btn-primary" >
                                
							<asp:Button ID="btn_comprar" runat="server" Text="Reservar" BorderStyle="None" BackColor="Transparent"  /></span>

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
	
    



		<asp:Panel ID="mostrar_nada" runat="server" Visible ="true">


		<h1 style="margin-left:35%; font-size:xx-large "><asp:Label ID="Label4" runat="server" Text="Não existe hoteis disponiveis"></asp:Label></h1>


	</asp:Panel>



</asp:Content>
