<%@ Page Title="" Language="C#" MasterPageFile="~/pagina_mestre_cliente.Master" AutoEventWireup="true" CodeBehind="cliente.aspx.cs" Inherits="Godcompany.cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<header id="gtco-header" class="gtco-cover gtco-cover-md" role="banner" style="background-image: url(images/img_aviao.jpg) ">
		<div class="overlay"></div>
		<div class="gtco-container">
			<div class="row">
				
				<div class="col-md-12 col-md-offset-0 text-left">
					
					
             
					<div class="row row-mt-15em">
						
						<div <%--class="col-md-7"--%> data-animate-effect="fadeInUp" align="center">

							<br />
							<br />
							<br />
								<br />
							<br />
							<br />
								<br />
							<br />
							<br />
							<h1  ><b> GoodCompany</b></h1>
							
							<h1 > Melhor maneira de reservar viagens a seu gosto!</h1>
						</div>
							
						<%--<div class="col-md-4 col-md-push-1 animate-box" data-animate-effect="fadeInRight">
							<div class="form-wrap">
							<%--	<div class="tab">--%>
									
								<%--	<div class="tab-content">
										<div class="tab-content-inner active" data-content="signup">
											<h3>Book Your Trip</h3>
											
												<div class="row form-group">
													<div class="col-md-12">
														<label for="fullname">Your Name</label>
														<input type="text" id="fullname" class="form-control">
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="activities">Activities</label>
														<select name="#" id="activities" class="form-control">
															<option value="">Activities</option>
															<option value="">Hiking</option>
															<option value="">Caving</option>
															<option value="">Swimming</option>
														</select>
													</div>
												</div>
												<div class="row form-group">
													<div class="col-md-12">
														<label for="destination">Destination</label>
														<select name="#" id="destination" class="form-control">
															<option value="">Philippines</option>
															<option value="">USA</option>
															<option value="">Australia</option>
															<option value="">Singapore</option>
														</select>
													</div>
												</div>
												
												<div class="row form-group">
													<div class="col-md-12">
														<label for="date-start">Date Travel</label>
														<input type="text" id="date-start" class="form-control">
													</div>
												</div>

												<div class="row form-group">
													<div class="col-md-12">
														<input type="submit" class="btn btn-primary btn-block" value="Submit">
													</div>
												</div>
										
										</div>--%>

										
<%--									</div>--%>
								
						</div>
					</div>
							
					
				</div>
			</div>
	
	</header>
	
	<div class="gtco-section" style="background-color:white;">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading">
					<h2>Os nossos packs de viagens</h2>
					<p>Os packs da GodCompany conseguem tornar qualquer tipo de viagens o mais pratico possível.</p>
				</div>
			</div>
			<div class="row">

				




			</div>
		</div>
	</div>
	
	


	<div class="gtco-cover gtco-cover-sm" style="background-image: url(images/logo.jpg)"  data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="gtco-container text-center">
			<div class="display-t">
				<div class="display-tc">
					<h1> Descobre os nossos destinos mais populares!</h1>
				</div>	
			</div>
		</div>
	</div>

	<div id="gtco-counter" class="gtco-section" style="background-color:white;">
		
		<div class="gtco-container">
			
			<div class="row">
				
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading ">
					
					<h2>Nossos resultados:</h2>
					<p></p>
				</div>
			</div>

			<div class="row">
				
				<div class="col-md-3 col-sm-6 " data-animate-effect="fadeInUp">
					<div class="feature-center">
					<%--	<span class="counter js-counter" >--%>
							<asp:Label ID="lbl_reservas" runat="server" CssClass="counter"></asp:Label>
						<%--</span>--%>
						<span class="counter-label">Reservas</span>

					</div>
				</div>
				<div class="col-md-3 col-sm-6 " data-animate-effect="fadeInUp">
					
					<div class="feature-center">
						<%--<span class="counter js-counter" >--%>
                        <asp:Label ID="lbl_clientes" runat="server" CssClass="counter"></asp:Label>
                       <%-- </span>--%>
						<span class="counter-label">Clientes</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 " data-animate-effect="fadeInUp">
					<div class="feature-center">
						
							<asp:Label ID="lbl_hoteis" runat="server" class="counter "></asp:Label>
						<span class="counter-label">Hoteis</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 " data-animate-effect="fadeInUp">
					<div class="feature-center">
						
							<asp:Label ID="lbl_packs" runat="server" class="counter "></asp:Label>
						
						<span class="counter-label">Packs</span>

					</div>
				</div>
					
			</div>
		<%--</div>--%>
	</div>

	
		<footer id="gtco-footer" role="contentinfo">
		<div class="gtco-container">
			<div class="row row-p	b-md">

				<div class="col-md-4" Font-Size="Medium">
					<div class="gtco-widget">
						<h3 Font-Size="Medium">About Us</h3>
						<p Font-Size="Medium">A sua agência de viagens GoodCompany tem a preocupação de estar sempre mais perto de si, para maior comodidade e total facilidade na marcação das suas viagens</p>
					</div>
				</div>


				

				<div class="col-md-2 col-md-push-1">
					<div class="gtco-widget">
						<h3 Font-Size="Medium">Cancelar uma compra?</h3>
						<ul class="gtco-footer-links">
							<p Font-Size="Medium">É possivel cancelar qualquer viagem desde que seija com dois dias de antecedencia</p>
						
						</ul>
					</div>
				</div>

				<div class="col-md-2 col-md-push-1">
					<div class="gtco-widget">
						<h3 Font-Size="Medium">Resultados<p " style="color:white; font-size:small" >..........</p></h3>
						<ul class="gtco-footer-links">
							
								<p Font-Size="Medium">Todos os nossos clientes tem um grande gosto em trabalhar com GoodCompany</p>
						</ul>
					</div>
				</div>

				<h1 style="color:white">..</h1>


				<div class="col-md-3 col-md-push-1">
					<div class="gtco-widget">
						<h3>   Contactos</h3>
						<ul class="gtco-quick-contact">
							<li><a href="#"><i class="icon-phone"></i>+351 961 456 321</a></li>
							<li><a href="https://www.facebook.com/GodCompany-101805145834535"><i class="icon-facebook"></i>facebook</a></li>
							<li><a href="https://discord.gg/vjK6hSG8"><i class="icon-chat"></i>Help</a></li>
						</ul>
					</div>
				</div>

			</div>

			<div class="row copyright">
				<div class="col-md-12">
					<p class="pull-left">
						<small class="block">&copy; 2016 Free HTML5. All Rights Reserved.</small> 
						<small class="block">Designed by <a href="http://GetTemplates.co/" target="_blank">GetTemplates.co</a> Demo Images: <a href="http://unsplash.com/" target="_blank">Unsplash</a></small>
					</p>
					<p class="pull-right">
						<ul class="gtco-social-icons pull-right">
							<li><a href="#"><i class="icon-twitter"></i></a></li>
							<li><a href="#"><i class="icon-facebook"></i></a></li>
							<li><a href="#"><i class="icon-linkedin"></i></a></li>
							<li><a href="#"><i class="icon-dribbble"></i></a></li>
						</ul>
					</p>
				</div>
			</div>

		</div>
	</footer>

	
	<!-- </div> -->

	</div>


	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>


		</body>

</asp:Content>
