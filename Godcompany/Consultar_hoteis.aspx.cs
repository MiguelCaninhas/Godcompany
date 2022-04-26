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
    public partial class Consultar_hoteis : System.Web.UI.Page
    {
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";

        string[] nome_reserva = new string[5000];
        string[] imagem = new string[5000];
        string[] id_reserva_cliente = new string[5000];
        string[] nome_reserva_cliente = new string[5000];
        string[] imagem_cliente = new string[5000];
        int n = 0, u = 0;
        bool validar = false;




        void pesquisar_hoteis()
        {
            Session["validar_entrar_consultar_hoteis"] = "false";
            Session["validar_entrar_consultar_hoteis_cliente"] = "false";
            int i = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao), ligar2 = new MySqlConnection(configuracao), ligar3 = new MySqlConnection(configuracao), ligar4 = new MySqlConnection(configuracao), ligar_auxiliar = new MySqlConnection(configuracao);
            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand(), comando_auxiliar = new MySqlCommand("Select * from reservas", ligar_auxiliar);
            MySqlDataReader dr1, dr2, dr3;
            MySqlDataAdapter dados1 = new MySqlDataAdapter(comando1), dados2 = new MySqlDataAdapter(comando2), dados3 = new MySqlDataAdapter(comando3), dados4 = new MySqlDataAdapter(comando4);
            DataTable dt = new DataTable();

            comando1.Connection = ligar;
            comando2.Connection = ligar2;
            comando3.Connection = ligar3;
            comando4.Connection = ligar4;

            ligar.Open();

            ligar_auxiliar.Open();

            dr1 = comando_auxiliar.ExecuteReader();

            comando1.CommandText = "SELECT id_reserva, data_reserva, id_viagens_pacotes  FROM reservas ";
            dados1.Fill(dt);






            while (dr1.Read())
            {


                if (Convert.ToString(dr1["id_viagens_pacotes"]) == "31")
                {


                    ligar2.Open();

                    comando2.Parameters.Clear();


                    comando2.CommandText = "SELECT id_hotel  FROM reserva_quartos where id_reserva = @id_reserva";
                    comando2.Parameters.AddWithValue("@id_reserva", dr1["id_reserva"]);



                    dados2.Fill(dt);

                    dr2 = comando2.ExecuteReader();


                    if (dr2.Read())
                    {


                        ligar3.Open();

                        comando3.Parameters.Clear();


                        comando3.CommandText = "SELECT nome_hotel, imagem  FROM hoteis where id_hoteis = @id_hoteis";
                        comando3.Parameters.AddWithValue("@id_hoteis", dr2["id_hotel"]);



                    

                        dr3 = comando3.ExecuteReader();

                        while (dr3.Read()) {
                            nome_reserva[i] = dr3["nome_hotel"].ToString();
                            imagem[i] = dr3["imagem"].ToString();


                        }
                        ligar3.Close();
                    }

                    ligar2.Close();


                }


                i++;
            }

            dl_consulta_hoteis.DataSource = dt;
            dl_consulta_hoteis.DataBind();

            ligar_auxiliar.Close();
            ligar.Close();
        }






        void pesquisar_hoteis_cliente()
        {
            Session["validar_entrar_consultar_hoteis"] = "false";
            Session["validar_entrar_consultar_hoteis_cliente"] = "false";

            validar = true;
            int i = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao), ligar2 = new MySqlConnection(configuracao), ligar3 = new MySqlConnection(configuracao), ligar4 = new MySqlConnection(configuracao), ligar_auxiliar = new MySqlConnection(configuracao);
            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand(), comando_auxiliar = new MySqlCommand("Select * from reservas", ligar_auxiliar);
            MySqlDataReader dr1, dr2, dr3;
            MySqlDataAdapter dados1 = new MySqlDataAdapter(comando1), dados2 = new MySqlDataAdapter(comando2), dados3 = new MySqlDataAdapter(comando3), dados4 = new MySqlDataAdapter(comando4);
            DataTable dt = new DataTable();

            dt.Clear();

            comando1.Connection = ligar;
            comando2.Connection = ligar2;
            comando3.Connection = ligar3;
            comando4.Connection = ligar4;

            ligar.Open();

            ligar_auxiliar.Open();

           

            comando1.CommandText = "SELECT id_reserva, data_reserva, id_viagens_pacotes  FROM reservas where id_cliente = @id_cliente";
            comando1.Parameters.AddWithValue("@id_cliente", escolher_cliente.SelectedValue);
            dados1.Fill(dt);

            dr1 = comando1.ExecuteReader();




            while (dr1.Read())
            {


                if (Convert.ToString(dr1["id_viagens_pacotes"]) == "31")
                {


                    ligar2.Open();

                    comando2.Parameters.Clear();


                    comando2.CommandText = "SELECT id_hotel  FROM reserva_quartos where id_reserva = @id_reserva";
                    comando2.Parameters.AddWithValue("@id_reserva", dr1["id_reserva"]);



                    dados2.Fill(dt);

                    dr2 = comando2.ExecuteReader();


                    if (dr2.Read())
                    {


                        ligar3.Open();

                        comando3.Parameters.Clear();


                        comando3.CommandText = "SELECT nome_hotel, imagem  FROM hoteis where id_hoteis = @id_hoteis";
                        comando3.Parameters.AddWithValue("@id_hoteis", dr2["id_hotel"]);





                        dr3 = comando3.ExecuteReader();

                        while (dr3.Read())
                        {
                            nome_reserva_cliente[i] = dr3["nome_hotel"].ToString();
                            imagem_cliente[i] = dr3["imagem"].ToString();


                        }
                        ligar3.Close();
                    }

                    ligar2.Close();


                }


                i++;
            }

            dl_consulta_hoteis.DataSource = dt;
            dl_consulta_hoteis.DataBind();

            ligar_auxiliar.Close();
            ligar.Close();
        }




        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                pesquisar_hoteis();


           
        }

        protected void escolher_cliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            pesquisar_hoteis_cliente();
        }

        protected void dl_consulta_hoteis_ItemDataBound(object sender, DataListItemEventArgs e)
        {
           

            Panel panel2 = (Panel)(e.Item.FindControl("Mostrar_hoteis"));
            Label id_reserva = (Label)(e.Item.FindControl("id_reserva"));
            Label Nome_hotel = (Label)(e.Item.FindControl("Nome_hotel"));
            Label di_reserva = (Label)(e.Item.FindControl("dia_da_reserva"));

            Image img = (Image)e.Item.FindControl("img");


            if (validar == false)
            {

                Session["validar_entrar_consultar_hoteis"] = "true";

                if (Nome_hotel != null)
                    Nome_hotel.Text = nome_reserva[n];




                if (img != null)
                    img.ImageUrl = "images/" + imagem[n];
            }

            else
            {
              
                Session["validar_entrar_consultar_hoteis_cliente"] = "true";

                if (Nome_hotel != null)
                    Nome_hotel.Text = nome_reserva_cliente[n];




                if (img != null)
                    img.ImageUrl = "images/" + imagem_cliente[n];
            }


            id_reserva.Text = (string)DataBinder.Eval(e.Item.DataItem, "id_reserva").ToString();


            //string dia_reserva = (string)DataBinder.Eval(e.Item.DataItem, "data_reserva");






            di_reserva.Text = (string)DataBinder.Eval(e.Item.DataItem, "data_reserva").ToString();


            if (id_reserva.Text == "" || di_reserva.Text == "" || Nome_hotel.Text == "" || img.ImageUrl == "images/")
            {

                panel2.Visible = false;


            }

            n++;
        }

        protected void dl_consulta_hoteis_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label id_reserva = (Label)(e.Item.FindControl("id_reserva"));
            Response.Redirect("ver_consultar_hoteis.aspx", false);
            Session["id_hoteis_consulta"] = id_reserva.Text;
        }

        protected void dl_consulta_hoteis_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}