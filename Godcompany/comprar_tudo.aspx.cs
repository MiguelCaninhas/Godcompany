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
    public partial class comprar_tudo : System.Web.UI.Page
    {

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        string[] hoteis = new string[5000], voos = new string[5000], atividades = new string[5000];
        string[] nome_pack = new string[5000]; 
        int n = 0, u = 0;

        void pesquisar_packs()
        {

            Session["validar_entrada_ver_pack"] = "false";

            int i = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao), ligar2 = new MySqlConnection(configuracao), ligar3 = new MySqlConnection(configuracao), ligar4 = new MySqlConnection(configuracao), ligar_auxiliar = new MySqlConnection(configuracao);
            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand(), comando_auxiliar = new MySqlCommand("SELECT * FROM viagens_pacotes where id_viagens_pacotes != 31", ligar_auxiliar);
            MySqlDataReader dr1, dr2, dr3, dr4;
            MySqlDataAdapter dados1 = new MySqlDataAdapter(comando1), dados2 = new MySqlDataAdapter(comando2), dados3 = new MySqlDataAdapter(comando3), dados4 = new MySqlDataAdapter(comando4);
            DataTable dt = new DataTable();

            comando1.Connection = ligar;
            comando2.Connection = ligar2;
            comando3.Connection = ligar3;
            comando4.Connection = ligar4;

            ligar.Open();

            ligar_auxiliar.Open();

            dr1 = comando_auxiliar.ExecuteReader();


            DateTime validar_date = DateTime.Now;

            comando1.CommandText = "SELECT id_viagens_pacotes, nome_pacote, preço, id_pais, imagem, descricao, data_partida FROM viagens_pacotes where id_viagens_pacotes != 31 ";
            dados1.Fill(dt);



      


            while (dr1.Read())
            {
                hoteis[i] = "";
                voos[i] = "";
                atividades[i] = "";

                nome_pack[i] = dr1["nome_pacote"].ToString();



                comando2.Parameters.Clear();
                comando3.Parameters.Clear();
                comando4.Parameters.Clear();

                comando2.CommandText = "SELECT nome_hotel FROM viagens_hoteis, hoteis WHERE viagens_hoteis.id_hoteis = hoteis.id_hoteis AND viagens_hoteis.id_viagens_pacotes = @viagens";
                comando3.CommandText = "SELECT nome FROM viagens_voo, voo WHERE viagens_voo.id_voo = voo.id_voo AND viagens_voo.id_viagens_pacotes = @viagens";
                comando4.CommandText = "SELECT nome FROM viagens_atividades, atividade WHERE viagens_atividades.id_atividade = atividade.id_atividade AND viagens_atividades.id_viagens_pacotes = @viagens";

                comando2.Parameters.AddWithValue("@viagens", dr1["id_viagens_pacotes"]);
                comando3.Parameters.AddWithValue("@viagens", dr1["id_viagens_pacotes"]);
                comando4.Parameters.AddWithValue("@viagens", dr1["id_viagens_pacotes"]);





                ligar2.Open();
                ligar3.Open();
                ligar4.Open();


                dr2 = comando2.ExecuteReader();
                dr3 = comando3.ExecuteReader();
                dr4 = comando4.ExecuteReader();

                


                while (dr2.Read() && u < 3)
                {
                    hoteis[i] = dr2["nome_hotel"] + ", " + hoteis[i];
                }
                while (dr3.Read() && u < 3)
                {
                    voos[i] = dr3["nome"] + ", " + voos[i];

                }
                while (dr4.Read() && u < 3)
                {
                    atividades[i] = dr4["nome"] + "," + atividades[i];
                }

                ligar2.Close();
                ligar3.Close();
                ligar4.Close();

                i++;
            }

            dl_destinos.DataSource = dt;
            dl_destinos.DataBind();

            ligar_auxiliar.Close();
            ligar.Close();
        }

        protected void dl_destinos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {

           

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando_validar = new MySqlCommand();
            comando_validar.Connection = ligar;

            MySqlDataReader DR;
       

            ligar.Open();
            int numero_de_pack = 0;
            comando_validar.Parameters.Clear();

            comando_validar.CommandText = "Select * from viagens_pacotes";


            DR = comando_validar.ExecuteReader();



            while (DR.Read())
            {
                numero_de_pack++;

            }


            numero_de_pack--;

            ligar.Close();



            if(numero_de_pack != 0)
            {
                if (!IsPostBack)
                    pesquisar_packs();

            }

            else
            {
                mostrar_nada.Visible = true;
            }


            if (Session["validar_entrada_ver_pack"].ToString() == "true")
            {
                
            }


        }

        protected void dl_destinos_ItemDataBound(object sender, DataListItemEventArgs e)
        {


            Session["validar_entrada_ver_pack"] = "true";

            DateTime data_entrada ;

            Panel panel = (Panel)(e.Item.FindControl("Mostrar_pack"));
            Label id_pack = (Label)(e.Item.FindControl("id_pack"));
            Label Nome_pack = (Label)(e.Item.FindControl("Nome_pack"));
            Label Nome_hotel = (Label)(e.Item.FindControl("Nome_hotel"));
            Label Nome_voo = (Label)(e.Item.FindControl("Nome_voo"));
            Label Nome_atividade = (Label)(e.Item.FindControl("Nome_atividade"));
            Image img = (Image)e.Item.FindControl("img");

            if (Nome_pack != null)
            {
                Nome_pack.Text = nome_pack[n];
            }

            if (Nome_hotel != null)
                Nome_hotel.Text = hoteis[n] ;

            if (Nome_voo != null)
                Nome_voo.Text = voos[n] ;


            if (Nome_atividade != null)
                Nome_atividade.Text = atividades[n];

            if (img != null)
                img.ImageUrl = "images/" + (string)DataBinder.Eval(e.Item.DataItem, "imagem");


            id_pack.Text = (string)DataBinder.Eval(e.Item.DataItem, "id_viagens_pacotes").ToString();
            n++;

            DateTime date = DateTime.Now;

            data_entrada = Convert.ToDateTime (DataBinder.Eval(e.Item.DataItem, "data_partida"));

            if (id_pack.Text == "" || Nome_pack.Text == "" || Nome_voo.Text == ""  || img.ImageUrl == "" || data_entrada < date)
            {


                panel.Visible = false;
              
                
            }



            if (Nome_atividade.Text == "")
            {
                Nome_atividade.Text = "Não tem atividades";
            }
            
           
        }

        protected void dl_destinos_ItemCommand(object source, DataListCommandEventArgs e)
        {

            Label id_pack2 = (Label)(e.Item.FindControl("id_pack"));
            Response.Redirect("Fazer_compras.aspx", false);



            Session["id_pack2"] = id_pack2.Text;


        }
    }
}