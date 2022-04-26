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
    public partial class ver_hoteis : System.Web.UI.Page
    {


        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        string[] pais_hotel = new string[5000], classificacao_hotel = new string[5000], id_hotel = new string[5000];
        string[] nome_hotel = new string[5000];
        int n = 0, u = 0;
        int[] id_hoteis = new int[5000];
        void pesquisar_packs()
        {
            Session["validar_entrada_ver_hoteis"] = "false";

            int i = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao), ligar2 = new MySqlConnection(configuracao), ligar3 = new MySqlConnection(configuracao), ligar4 = new MySqlConnection(configuracao), ligar_auxiliar = new MySqlConnection(configuracao);
            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand(), comando_auxiliar = new MySqlCommand("Select * from hoteis", ligar_auxiliar);
            MySqlDataReader dr1, dr2;
            MySqlDataAdapter dados1 = new MySqlDataAdapter(comando1), dados2 = new MySqlDataAdapter(comando2), dados3 = new MySqlDataAdapter(comando3), dados4 = new MySqlDataAdapter(comando4);
            DataTable dt = new DataTable();

            comando1.Connection = ligar;
            comando2.Connection = ligar2;
            comando3.Connection = ligar3;
            comando4.Connection = ligar4;

            ligar.Open();

            ligar_auxiliar.Open();

            dr1 = comando_auxiliar.ExecuteReader();

            comando1.CommandText = "SELECT hoteis.nome_hotel, hoteis.id_hoteis, hoteis.id_classificacao, pais.nome , hoteis.imagem  FROM hoteis INNER JOIN pais ON hoteis.id_pais = pais.id_pais";
            dados1.Fill(dt);
            





            while (dr1.Read())
            {
                
                

                ligar2.Open();

                comando2.Parameters.Clear();
              

                comando2.CommandText = "SELECT hoteis.nome_hotel, hoteis.id_hoteis, hoteis.id_classificacao, pais.nome , hoteis.imagem  FROM hoteis INNER JOIN pais ON hoteis.id_pais = pais.id_pais where hoteis.id_hoteis = @id_hoteis";
                comando2.Parameters.AddWithValue("@id_hoteis", dr1["id_hoteis"]);



                dados2.Fill(dt);

                dr2 = comando2.ExecuteReader();


                while (dr2.Read())
                {

                    nome_hotel[i] = dr2["nome_hotel"].ToString();
                    classificacao_hotel[i] = dr2["id_classificacao"].ToString();
                    pais_hotel[i] = dr2["nome"].ToString();
                }

                ligar2.Close();

                i++;
            }

            dl_destinos.DataSource = dt;
            dl_destinos.DataBind();

            ligar_auxiliar.Close();
            ligar.Close();
        }




        protected void Page_Load(object sender, EventArgs e)
        {
           
           

            if (!IsPostBack)
                pesquisar_packs();


            if  (Session["validar_entrada_ver_hoteis"].ToString() == "true")
            {
               
                mostrar_nada.Visible = false;
            }

        }

        protected void dl_destinos_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            Session["validar_entrada_ver_hoteis"] = "true";

            Panel panel = (Panel)(e.Item.FindControl("Mostrar_hotel"));
            Label id_hoteis2 = (Label)(e.Item.FindControl("id_hotel"));
            Label Nome_hotel2 = (Label)(e.Item.FindControl("Nome_hotel"));
            Label estrelas2 = (Label)(e.Item.FindControl("estrelas"));
            Label pais2 = (Label)(e.Item.FindControl("pais"));
            Image img = (Image)e.Item.FindControl("img");

        

            if (Nome_hotel2 != null)
                Nome_hotel2.Text = nome_hotel[n];

            if (estrelas2 != null)
                estrelas2.Text = classificacao_hotel[n];


            if (pais2 != null)
                pais2.Text = pais_hotel[n];

            if (img != null)
                img.ImageUrl = "images/" + (string)DataBinder.Eval(e.Item.DataItem, "imagem");


            id_hoteis2.Text = (string)DataBinder.Eval(e.Item.DataItem, "id_hoteis").ToString();
            

            if (id_hoteis2.Text == "" || Nome_hotel2.Text == "" || estrelas2.Text == "" || pais2.Text == "" || img.ImageUrl == "")
            {


                panel.Visible = false;


            }

            n++;

        }

        protected void dl_destinos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label id_hotel3 = (Label)(e.Item.FindControl("id_hotel"));
            Response.Redirect("Fazer_compras_hotel.aspx", false);



            Session["id_hotel3"] = id_hotel3.Text;
        }

        protected void dl_destinos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}