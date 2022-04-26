<%@ Page Title="" Language="C#" MasterPageFile="~/mestrer_comprar.Master" AutoEventWireup="true" CodeBehind="Carrinho.aspx.cs" Inherits="Godcompany.Carrinho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	 <script src="swalert.js" type="text/javascript"></script>


	 <head>

        <script>
            function erro_sata() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'error',
                    title: 'A reserva só pode ser cancelada dois dias antes do dia do voo de partida',
                    showConfirmButton: false,
                    timer: 7500
                })



			}


            function info_data() {




                Swal.fire({
                    padding: '8em',
                    width: 600,
                    position: 'center',
                    icon: 'question',
                    title: 'A reserva só pode ser cancelada dois dias antes do dia do voo de partida',
                    showConfirmButton: false,
                    timer: 7500
                })



            }

        </script>

		</head>


     <br />
	<br />
    <br />

    <div class="gtco-section " style="background-color:white;">

		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2 style="color:#40E0D0; ">O seu carrinho</h2>
					<p>Aqui pode cancelar qualquer reserva que ja reservou.</p>
				</div>
			</div>
			<div class="row">

				<asp:DataList ID="dl_carrinho" Style="width: 100%;" runat="server" OnItemDataBound="dl_carrinho_ItemDataBound" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemCommand="dl_carrinho_ItemCommand" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" OnSelectedIndexChanged="dl_carrinho_SelectedIndexChanged">
                    <ItemTemplate>
					<asp:Panel ID="Mostrar_carrinho" runat="server">
				<div class="col-lg-4 col-md-4 col-sm-6 fh5co-card-item image-popup">
					
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<asp:image alt="Image" Width="340px" Height="225px" class="img-responsive" ID="img" runat="server" ></asp:image>
						</figure>



						
						<div class="fh5co-text">
							
							<asp:Label ID="id_reserva" runat="server" ForeColor="Turquoise" Visible ="false"></asp:Label>
                            <asp:Label ID="Nome_reserva" runat="server" ForeColor="Turquoise" Font-Size="X-Large"></asp:Label>
						
							
							<p style="align-items:center"><asp:Label ID="Label3" runat="server" ForeColor="Black" Text="dia da reserva: " ></asp:Label><asp:Label ID="dia_da_reserva" runat="server" ></asp:Label></p>
						

							
					<span class="btn btn-primary" >
                                
							<asp:Button ID="btn_cancelar" runat="server" Text="Cancelar" BorderStyle="None" BackColor="Transparent"  /></span>

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


		<h1 style="margin-left:35%; font-size:xx-large "><asp:Label ID="Label4" runat="server" Text="Não existe reservas reservadas"></asp:Label></h1>


	</asp:Panel>


</asp:Content>
