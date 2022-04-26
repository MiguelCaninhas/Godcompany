using System;
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
    public partial class ver_consultar_pack : System.Web.UI.Page
    {

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";

        string[] nome_atividade = new string[5000];
        string[] imagem_atividade = new string[5000];
        string[] preco_atividade_v = new string[5000];
        int n = 0;


        string[] nome_quartos = new string[5000];
        string[] imagem_quartos = new string[5000];
        string[] preco_quartos_v = new string[5000];
        int n_quartos = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

            MySqlConnection ligar = new MySqlConnection(configuracao), ligar2 = new MySqlConnection(configuracao), ligar3 = new MySqlConnection(configuracao), ligar4 = new MySqlConnection(configuracao), ligar_auxiliar = new MySqlConnection(configuracao);
            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand(), comando_auxiliar = new MySqlCommand();
            MySqlDataReader dr1, dr2, dr3, dr4, dr5, dr6;
            MySqlDataAdapter dados1 = new MySqlDataAdapter(comando1), dados2 = new MySqlDataAdapter(comando2), dados3 = new MySqlDataAdapter(comando3), dados4 = new MySqlDataAdapter(comando4);
            MySqlCommand comando5 = new MySqlCommand(), comando6 = new MySqlCommand();
            MySqlConnection ligar5 = new MySqlConnection(configuracao), ligar6 = new MySqlConnection(configuracao);



            comando1.Connection = ligar;
            comando2.Connection = ligar2;
            comando3.Connection = ligar3;
            comando4.Connection = ligar4;
            comando5.Connection = ligar5;
            comando6.Connection = ligar6;

            ligar.Open();

     

           

            comando1.CommandText = "SELECT id_cliente, data_reserva, id_viagens_pacotes, preco_total, adultos, criancas  FROM reservas where id_reserva = @id_reserva";
            comando1.Parameters.AddWithValue("@id_reserva", Session["id_pack_consulta"]);


            dr1 = comando1.ExecuteReader();


            if (dr1.Read())
            {

                DateTime data_marcaçao_v = Convert.ToDateTime(dr1["data_reserva"]);


                preco.Text = dr1["preco_total"].ToString();
                txt_adultos.Text = dr1["adultos"].ToString();
                txt_criancas.Text = dr1["criancas"].ToString();
                data_marcacao.Text = data_marcaçao_v.ToString("d MMMM yyyy");


                ligar5.Open();




                comando5.CommandText = "SELECT id_hoteis FROM viagens_hoteis where id_viagens_pacotes = @id_viagens_pacotes";
                comando5.Parameters.AddWithValue("@id_viagens_pacotes", dr1["id_viagens_pacotes"]);


                dr5 = comando5.ExecuteReader();



                if (dr5.Read())
                {
                    ligar6.Open();
                    comando6.CommandText = "SELECT nome_hotel FROM hoteis where id_hoteis = @id_hoteis";
                    comando6.Parameters.AddWithValue("@id_hoteis", dr5["id_hoteis"]);


                    dr6 = comando6.ExecuteReader();

                    if (dr6.Read())
                    {

                        hotel.Text = dr6["nome_hotel"].ToString();
                    }



                    ligar6.Close();

                }


                ligar5.Close();




                ligar2.Open();

                comando2.CommandText = "SELECT mail  FROM cliente where id_cliente = @id_cliente";
                comando2.Parameters.AddWithValue("@id_cliente", dr1["id_cliente"]);

                dr2 = comando2.ExecuteReader();


                if (dr2.Read())
                {

                    cliente.Text = dr2["mail"].ToString();
                }


                ligar2.Close();

                ligar3.Open();

                comando3.CommandText = "SELECT nome_pacote, id_pais, imagem, data_partida, data_chegada  FROM viagens_pacotes where id_viagens_pacotes = @id_viagens_pacotes";
                comando3.Parameters.AddWithValue("@id_viagens_pacotes", dr1["id_viagens_pacotes"]);

                dr3 = comando3.ExecuteReader();


                if (dr3.Read())
                {
                    DateTime data_chegada_v = Convert.ToDateTime(dr3["data_chegada"]);

                    DateTime data_partida_v = Convert.ToDateTime(dr3["data_partida"]);

                    nome.Text = dr3["nome_pacote"].ToString();
                    img.ImageUrl = "images/" + dr3["imagem"];
                    dia_chegada.Text = data_chegada_v.ToString("d MMMM yyyy");
                    dia_partida.Text = data_partida_v.ToString("d MMMM yyyy");


                    ligar4.Open();

                    comando4.CommandText = "SELECT nome from pais where id_pais = @id_pais";
                    comando4.Parameters.AddWithValue("@id_pais", dr3["id_pais"]);

                    dr4 = comando4.ExecuteReader();

                    if (dr4.Read())
                    {

                        pais.Text = dr4["nome"].ToString();
                    }

                    ligar4.Close();

                }

                ligar3.Close();







            }




            ligar.Close();


            if (!IsPostBack)
                pesquisar_packs_atividade();

            if (!IsPostBack)
                pesquisar_packs_quartos();

        }




        void pesquisar_packs_atividade()
        {
            
            int i = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao), ligar2 = new MySqlConnection(configuracao), ligar3 = new MySqlConnection(configuracao), ligar4 = new MySqlConnection(configuracao), ligar_auxiliar = new MySqlConnection(configuracao);
            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand(), comando_auxiliar = new MySqlCommand();
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

         

            comando1.CommandText = "SELECT id_atividade  FROM detalhe_reserva where id_reserva = @id_reserva";
            comando1.Parameters.AddWithValue("@id_reserva", Session["id_pack_consulta"]);

            dados1.Fill(dt);
            dr1 = comando1.ExecuteReader();





            while (dr1.Read())
            {


                


                    ligar2.Open();

                    comando2.Parameters.Clear();


                    comando2.CommandText = "SELECT nome, preco, imagem from atividade where id_atividade = @id_atividade";
                    comando2.Parameters.AddWithValue("@id_atividade", dr1["id_atividade"]);



                   

                    dr2 = comando2.ExecuteReader();


                    while (dr2.Read())
                    {
                        nome_atividade[i] = dr2["nome"].ToString();
                        imagem_atividade[i] = dr2["imagem"].ToString();
                        preco_atividade_v[i] = dr2["preco"].ToString();
                    }

                    ligar2.Close();


                


                i++;
            }

            dl_consulta_atividades.DataSource = dt;
            dl_consulta_atividades.DataBind();

            ligar_auxiliar.Close();
            ligar.Close();
        }




        void pesquisar_packs_quartos()
        {

            int i = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao), ligar2 = new MySqlConnection(configuracao), ligar3 = new MySqlConnection(configuracao), ligar4 = new MySqlConnection(configuracao), ligar_auxiliar = new MySqlConnection(configuracao);
            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand(), comando_auxiliar = new MySqlCommand();
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



            comando1.CommandText = "SELECT id_quarto  FROM reserva_quartos where id_reserva = @id_reserva";
            comando1.Parameters.AddWithValue("@id_reserva", Session["id_pack_consulta"]);

            dados1.Fill(dt);
            dr1 = comando1.ExecuteReader();





            while (dr1.Read())
            {

                nome_quartos[i] = dr1["id_quarto"].ToString();



                ligar2.Open();

                comando2.Parameters.Clear();


                comando2.CommandText = "SELECT preco, imagem from quartos where id_quartos = @id_quartos";
                comando2.Parameters.AddWithValue("@id_quartos", dr1["id_quarto"]);





                dr2 = comando2.ExecuteReader();


                while (dr2.Read())
                {
                    
                    imagem_quartos[i] = dr2["imagem"].ToString();
                    preco_quartos_v[i] = dr2["preco"].ToString();
                }

                ligar2.Close();





                i++;
            }

            dl_consulta_quartos.DataSource = dt;
            dl_consulta_quartos.DataBind();

            ligar_auxiliar.Close();
            ligar.Close();
        }




        protected void voltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Consultar_pack.aspx", false);
            Session["id_pack_consulta"] = "";
        }

        protected void dl_consulta_atividades_ItemDataBound(object sender, DataListItemEventArgs e)
        {
           
            

            Panel panel2 = (Panel)(e.Item.FindControl("Mostrar_atividade"));
            
            Label Nome_atividade = (Label)(e.Item.FindControl("Nome_atividade"));
            Label preco_atividade = (Label)(e.Item.FindControl("preco_atividade"));

            Image img = (Image)e.Item.FindControl("img");


           
                if (Nome_atividade != null)
                     Nome_atividade.Text = nome_atividade[n];




                if (img != null)
                    img.ImageUrl = "images/" + imagem_atividade[n];
            

                if (preco_atividade != null)
                preco_atividade.Text = preco_atividade_v[n];




       













            if (Nome_atividade.Text == "" || preco_atividade.Text == "" || img.ImageUrl == "images/")
            {

                panel2.Visible = false;


            }

            n++;
        }

        protected void dl_consulta_atividades_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void dl_consulta_atividades_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void dia_chegada_TextChanged(object sender, EventArgs e)
        {

        }

        protected void dl_consulta_quartos_ItemDataBound(object sender, DataListItemEventArgs e)
        {


            Panel panel2 = (Panel)(e.Item.FindControl("Mostrar_quartos"));

            Label Nome_quartos = (Label)(e.Item.FindControl("Nome_quarto"));
            Label preco_quartos = (Label)(e.Item.FindControl("preco_quarto"));

            Image img_quartos = (Image)e.Item.FindControl("img_quartos");



            if (Nome_quartos != null)
                Nome_quartos.Text = nome_quartos[n_quartos];




            if (img_quartos != null)
                img_quartos.ImageUrl = "images/" + imagem_quartos[n_quartos];


            if (preco_quartos != null)
                preco_quartos.Text = preco_quartos_v[n_quartos];


















            if (Nome_quartos.Text == "" || preco_quartos.Text == "" || img_quartos.ImageUrl == "images/")
            {

                panel2.Visible = false;


            }

            n_quartos++;
        }
    

        protected void dl_consulta_quartos_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void dl_consulta_quartos_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}