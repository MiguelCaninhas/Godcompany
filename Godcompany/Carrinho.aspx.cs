using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;



namespace Godcompany
{
    public partial class Carrinho : System.Web.UI.Page
    {

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        string[]  id_reserva = new string[5000];
        string[] nome_reserva = new string[5000];
        string[] imagem = new string[5000];
        int n = 0, u = 0;




        bool validar2 = false;

        void pesquisar_packs()
        {

            Session["validar_entrada_carrinho"] = "false";

            string id_cliente = "";
            int i = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao), ligar2 = new MySqlConnection(configuracao), ligar3 = new MySqlConnection(configuracao), ligar4 = new MySqlConnection(configuracao), ligar_auxiliar = new MySqlConnection(configuracao);
            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand(), comando_auxiliar = new MySqlCommand("Select * from reservas where id_cliente = @id_cliente", ligar_auxiliar);
            MySqlDataReader dr1, dr2, dr3, dr4;
            MySqlDataAdapter dados1 = new MySqlDataAdapter(comando1), dados2 = new MySqlDataAdapter(comando2), dados3 = new MySqlDataAdapter(comando3), dados4 = new MySqlDataAdapter(comando4);
            DataTable dt = new DataTable();

            comando1.Connection = ligar;
            comando2.Connection = ligar2;
            comando3.Connection = ligar3;
            comando4.Connection = ligar4;


            ligar4.Open();

            

            
            comando4.CommandText = "SELECT id_cliente  FROM cliente where mail = @mail";
            comando4.Parameters.AddWithValue("@mail", Session["email"]);




          dr4 = comando4.ExecuteReader();

            while(dr4.Read()){
                id_cliente = dr4["id_cliente"].ToString();
            }

            

         ligar.Open();

            ligar_auxiliar.Open();


            comando_auxiliar.Parameters.AddWithValue("@id_cliente", id_cliente);


            dr1 = comando_auxiliar.ExecuteReader();
            comando1.CommandText = "SELECT id_reserva, data_reserva, id_viagens_pacotes  FROM reservas where id_cliente = @id_cliente";
            comando1.Parameters.AddWithValue("@id_cliente", id_cliente);
            dados1.Fill(dt);


          



            while (dr1.Read())
            {


                if ( Convert.ToString( dr1["id_viagens_pacotes"]) == "31") {



                    ligar2.Open();



                    comando2.Parameters.Clear();
                    comando2.CommandText = "SELECT id_hotel from reserva_quartos where id_reserva = @id_reserva";
                    comando2.Parameters.AddWithValue("@id_reserva", dr1["id_reserva"]);

                    


                    dados2.Fill(dt);

                    dr2 = comando2.ExecuteReader();


                    while (dr2.Read())
                    {

                        ligar3.Open();

                        comando3.Parameters.Clear();
                        comando3.CommandText = "SELECT nome_hotel, imagem from hoteis where id_hoteis = @id_hoteis";
                        comando3.Parameters.AddWithValue("@id_hoteis", dr2["id_hotel"]);

                        dados3.Fill(dt);

                        dr3 = comando3.ExecuteReader();

                        while (dr3.Read())
                        {

                            nome_reserva[i] = dr3["nome_hotel"].ToString();
                            imagem[i] = dr3["imagem"].ToString();
                            
                        }

                        ligar3.Close();
                    }

                    ligar2.Close();

                 





                }

                else
                {

                    ligar2.Open();

                    comando2.Parameters.Clear();


                    comando2.CommandText = "SELECT nome_pacote , imagem FROM viagens_pacotes where id_viagens_pacotes = @id_viagens_pacotes";
                    comando2.Parameters.AddWithValue("@id_viagens_pacotes", dr1["id_viagens_pacotes"]);



                    dados2.Fill(dt);

                    dr2 = comando2.ExecuteReader();


                    while (dr2.Read())
                    {
                        nome_reserva[i] = dr2["nome_pacote"].ToString();
                        imagem[i] = dr2["imagem"].ToString();
                        
                    }

                    ligar2.Close();



                }
                i++;
            }

           dl_carrinho.DataSource = dt;
            dl_carrinho.DataBind();

            ligar_auxiliar.Close();
            ligar.Close();
        }




       




        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                pesquisar_packs();
                
            }

      
              


            if (Session["validar_entrada_carrinho"].ToString() != "true")
            {

                mostrar_nada.Visible = true;
            }


            else
            {
                mostrar_nada.Visible = false;
            }


            if (!IsPostBack && Session["validar_carrinho_true"].ToString() != "true")
            {
                Session["validar_carrinho_true"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "info_data() ", true);
            }
           

        }

        protected void dl_carrinho_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            Session["validar_entrada_carrinho"] = "true";


            Panel panel2 = (Panel)(e.Item.FindControl("Mostrar_carrinho"));
            Label id_reserva = (Label)(e.Item.FindControl("id_reserva"));
            Label Nome_reserva = (Label)(e.Item.FindControl("Nome_reserva"));
            Label di_reserva = (Label)(e.Item.FindControl("dia_da_reserva"));
       
            Image img = (Image)e.Item.FindControl("img");



            if (Nome_reserva != null)
                Nome_reserva.Text = nome_reserva[n];

        


            if (img != null)
                img.ImageUrl = "images/" + imagem[n];


            id_reserva.Text = (string)DataBinder.Eval(e.Item.DataItem, "id_reserva").ToString();



            di_reserva.Text = (string)DataBinder.Eval(e.Item.DataItem, "data_reserva").ToString();


            if (id_reserva.Text == "" || di_reserva.Text == "" || Nome_reserva.Text == "" ||  img.ImageUrl == "images/")
            {

                panel2.Visible = false;


            }

            n++;
        }

        protected void dl_carrinho_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Session["validar_carrinho_true"] = "false";

            bool validar = false;

            Label id_reserva = (Label)(e.Item.FindControl("id_reserva"));








            string data_entrada = "";
            DateTime date = DateTime.Now.AddDays(-1);




            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlCommand comando2 = new MySqlCommand();
            MySqlCommand comando3 = new MySqlCommand();
            MySqlCommand comando4 = new MySqlCommand();
            MySqlDataReader DR;


            comando.Connection = ligar;
            comando2.Connection = ligar;
            comando3.Connection = ligar;
            comando4.Connection = ligar;

            ligar.Open();

            comando4.CommandText = "Select data_entrada from reserva_quartos where id_reserva = '" + id_reserva.Text + "'";


            DR = comando4.ExecuteReader();


            if(DR.Read()){


                data_entrada = DR["data_entrada"].ToString();

            }




            DR.Close();
            


            if (!(Convert.ToDateTime( data_entrada) < date))
            {


                Session["validar_carrinho_true"] = "true";

                comando.Parameters.Clear();
                comando2.Parameters.Clear();
                comando3.Parameters.Clear();

                comando.CommandText = "DElETE from reservas where id_reserva = @id_reserva";
                comando2.CommandText = "DElETE from reserva_quartos where id_reserva = @id_reserva";
                comando3.CommandText = "DElETE from detalhe_reserva where id_reserva = @id_reserva";




                comando.Parameters.AddWithValue("@id_reserva", id_reserva.Text);
                comando2.Parameters.AddWithValue("@id_reserva", id_reserva.Text);
                comando3.Parameters.AddWithValue("@id_reserva", id_reserva.Text);



                try
                {
                    comando2.ExecuteNonQuery();
                    comando3.ExecuteNonQuery();
                    comando.ExecuteNonQuery();

                }
                catch
                {
                    validar = true;
                }

                finally
                {


                    Response.Redirect("Carrinho.aspx", false);
                }


            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "erro_sata() ", true);
            }


            ligar.Close();






         
        }
        

        protected void dl_carrinho_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}