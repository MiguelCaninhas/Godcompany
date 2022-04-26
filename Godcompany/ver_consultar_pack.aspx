<%@ Page Title="" Language="C#" MasterPageFile="~/Pagina_mestre_admin.Master" AutoEventWireup="true" CodeBehind="ver_consultar_pack.aspx.cs" Inherits="Godcompany.ver_consultar_pack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <asp:TextBox ID="id_hoteis" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Nome" Font-Size="Medium" Width="900px" Visible="false"></asp:TextBox>
        
        <asp:Label ID="lbl_limitante" runat="server" Text="0" Visible="false"></asp:Label>  
    <asp:Label ID="pessoas_limite" runat="server" Text="0" Visible="false"></asp:Label>

  <br />
        <br />
                 <h3 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h3>
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading" style="align-items:center">
					<h2 style="color:#40E0D0; ">Ver reservas de pack</h2>
					<p>Aqui pode ver com mais promenor a reserva que escolheu.</p>
				</div>
		

    <br />
      <br />
     <br />
     <br />
     
        
 <div style="display: inline-flex; padding: 10px;">
        <div style="padding: 20px">
            <asp:Image ID="img" runat="server" width="500" Height="550"/>
            <br/><br/>
        
        </div>
        <div style="padding:20px; width:auto" >

            
             <h3 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h3>

    <h2 style="color:black; margin-left:0%;  font-size:x-large"> <label for="inputEmail3" class=" col-form-label" >Nome pack:</label></h2>
    <asp:TextBox ID="nome" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="800px" style="margin-left: 4%" BackColor="White" ReadOnly="True" ></asp:TextBox>
       


            
           

     <h2 style="color:black; margin-left:0%;  font-size:x-large"> <label for="inputEmail3" class=" col-form-label" >Cliente:</label></h2>
    <asp:TextBox ID="cliente" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="800px" style="margin-left: 4%" BackColor="White" ReadOnly="True" ></asp:TextBox>
      


    <h2 style="color:black; margin-left:0%;  font-size:x-large"> <label for="inputEmail3" class=" col-form-label" >Preço:</label></h2>
    <asp:TextBox ID="preco" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="800px" style="margin-left: 4%" BackColor="White" ReadOnly="True" ></asp:TextBox>
      
    
   

           <h2 style="color:black; margin-left:0%;  font-size:x-large"> <label for="inputEmail3" class=" col-form-label" >Hotel:</label></h2>
    <asp:TextBox ID="hotel" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="100%" style="margin-left: 4%" BackColor="White" ReadOnly="True" ></asp:TextBox>
       
            <h2 style="color:black; margin-left:0%;  font-size:x-large"> <label for="inputEmail3" class=" col-form-label" >Pais:</label></h2>
    <asp:TextBox ID="pais" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="" Font-Size="Medium" Width="800px" style="margin-left: 4%" BackColor="White" ReadOnly="True" ></asp:TextBox>
      



<%--    <h1 style="color:black"> <label for="inputEmail3" class=" col-form-label" >Numero de Adultos:</label></h1>
    <asp:TextBox ID="txt_adultos" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="900px"></asp:TextBox>

    <h1 style="color:black"> <label for="inputEmail3" class=" col-form-label" >Numero de Crianças:</label></h1>
    <asp:TextBox ID="txt_criancas" runat="server" class="form-control "  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="900px"></asp:TextBox>--%>

    </div>
    </div>
            
         <div class="col-md-12" >
    <h1 style="color:black; font-size:large"> <label for="inputEmail3" class="col-sm-3 col-form-label" style="margin-left:10%" >Data marcação:</label></h1>
    <asp:TextBox ID="data_marcacao" runat="server"  class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%" BackColor="White" ReadOnly="True" ></asp:TextBox>
     </div>

        <div class="col-md-12" >
    <h1 style="color:black; font-size:large"> <label for="inputEmail3" class="col-sm-3 col-form-label" style="margin-left:10%" >Dia partida:</label></h1>
    <asp:TextBox ID="dia_partida" runat="server"  class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%" BackColor="White" ReadOnly="True"  ></asp:TextBox>
     </div>

      <div class="col-md-12" >
    <h1 style="color:black; font-size:large"> <label for="inputEmail3" class="col-sm-3 col-form-label" style="margin-left:10%" >Dia chegada:</label></h1>
    <asp:TextBox ID="dia_chegada" runat="server" class="form-control col-sm-9"   BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%" OnTextChanged="dia_chegada_TextChanged" BackColor="White" ReadOnly="True"></asp:TextBox>
     </div>
    

      <div class="col-md-12" >
    <h1 style="color:black; font-size:large"> <label for="inputEmail3" class="col-sm-3 col-form-label" style="margin-left:10%" >Numero de Adultos:</label></h1>
    <asp:TextBox ID="txt_adultos" runat="server" class="form-control col-sm-9"   BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%" BackColor="White" ReadOnly="True"></asp:TextBox>
     </div>

      <div class="col-md-12" >
    <h1 style="color:black; font-size:large"> <label for="inputEmail3" class="col-sm-3 col-form-label" style="margin-left:10%" >Numero de Crianças:</label></h1>
    <asp:TextBox ID="txt_criancas" runat="server" class="form-control col-sm-9"  BorderStyle ="Solid"  placeholder="Numero" Font-Size="Medium" Width="60%" BackColor="White" ReadOnly="True"></asp:TextBox>
     </div>

   


    

      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


            
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading" style="align-items:center">
					<h2 style="color:#40E0D0; ">Atividades reservadas</h2>
					<p>Aqui pode ver as atividades que o cliente reservou.</p>
				</div>
     
	    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


	
				<asp:DataList ID="dl_consulta_atividades" Style="width: 100%;" runat="server" OnItemDataBound="dl_consulta_atividades_ItemDataBound" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemCommand="dl_consulta_atividades_ItemCommand" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" OnSelectedIndexChanged="dl_consulta_atividades_SelectedIndexChanged">
                    <ItemTemplate>
					<asp:Panel ID="Mostrar_atividade" runat="server">


				<div class="col-lg-4 col-md-4 col-sm-6 fh5co-card-item image-popup">
					
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<asp:image alt="Image" Width="500px" Height="225px" class="img-responsive" ID="img" runat="server" ></asp:image>
						</figure>



						
						<div class="fh5co-text">
							
							
                            <asp:Label ID="Nome_atividade" runat="server" ForeColor="Turquoise" Font-Size="X-Large"></asp:Label>
						
							
													
                            <p style="align-items:center"><asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Preço: " ></asp:Label><asp:Label ID="preco_atividade" runat="server" ></asp:Label></p>
						   
						    
						



							
	

						</div>
				

					

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





	<h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


            
				<div class="col-md-8 col-md-offset-2 text-center gtco-heading" style="align-items:center">
					<h2 style="color:#40E0D0; ">Quartos reservadas</h2>
					<p>Aqui pode ver os quartos que o cliente reservou.</p>
				</div>
     
	    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


	
				<asp:DataList ID="dl_consulta_quartos" Style="width: 100%;" runat="server" OnItemDataBound="dl_consulta_quartos_ItemDataBound" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemCommand="dl_consulta_quartos_ItemCommand" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" OnSelectedIndexChanged="dl_consulta_quartos_SelectedIndexChanged">
                    <ItemTemplate>
					<asp:Panel ID="Mostrar_quartos" runat="server">


				<div class="col-lg-4 col-md-4 col-sm-6 fh5co-card-item image-popup">
					
						<figure>
							<div class="overlay"><i class="ti-plus"></i></div>
							<asp:image alt="Image" Width="500px" Height="225px" class="img-responsive" ID="img_quartos" runat="server" ></asp:image>
						</figure>



						
						<div class="fh5co-text">
							
							
                            <asp:Label ID="Nome_quarto" runat="server" ForeColor="Turquoise" Font-Size="X-Large"></asp:Label>
						
							
													
                            <p style="align-items:center"><asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Preço: " ></asp:Label><asp:Label ID="preco_quarto" runat="server" ></asp:Label></p>
						   
						    
						



							
	

						</div>
				

					

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

	

	    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

	

	 

	    <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>

      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>
      <h1 style="color:white" > <label for="inputEmail3" class=" col-form-label" > . </label></h1>


   


    <asp:Button ID="voltar" runat="server" class="btn btn-outline-success " Width="70%" Height="100px" style="margin-left:3%" Text="VOLTAR" OnClick="voltar_Click" Font-Size="Medium" />



</asp:Content>
