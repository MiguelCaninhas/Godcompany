using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Windows.Forms;

namespace Godcompany
{
    public partial class admin : System.Web.UI.Page
    {

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {



            MySqlConnection ligar = new MySqlConnection(configuracao);

            MySqlConnection ligar2 = new MySqlConnection(configuracao);

            MySqlCommand comando_validar_datas = new MySqlCommand();

            comando_validar_datas.Connection = ligar;


            ligar.Open();

            comando_validar_datas.Parameters.Clear();
            comando_validar_datas.CommandText = "SELECT data_partida from viagens_pacotes where id_viagens_pacotes != 31";


            DateTime date_validar_datas = DateTime.Now;

            MySqlDataReader DR_validar_datas;

            DR_validar_datas = comando_validar_datas.ExecuteReader();



            while (DR_validar_datas.Read()) 
            {

               
                    if (Convert.ToDateTime(DR_validar_datas["data_partida"]) < date_validar_datas)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error_data()", true);

                    }
               
            }




            ligar.Close();

            MySqlCommand comando = new MySqlCommand();
            MySqlCommand comando2 = new MySqlCommand();
            MySqlCommand comando3 = new MySqlCommand();
            MySqlCommand comando4 = new MySqlCommand();
            MySqlCommand comando5 = new MySqlCommand();
            MySqlCommand comando6 = new MySqlCommand();
            MySqlCommand comando7 = new MySqlCommand();
            MySqlCommand comando8 = new MySqlCommand();

            comando.Connection = ligar;
            comando2.Connection = ligar;
            comando3.Connection = ligar;
            comando4.Connection = ligar;
            comando5.Connection = ligar;
            comando6.Connection = ligar;
            comando7.Connection = ligar;
            comando8.Connection = ligar2;
            ligar.Open();

            comando.CommandText = "Select  count(id_cliente) as id_cliente from cliente";




            MySqlDataReader DR;


            DR = comando.ExecuteReader();

            if (DR.Read())
            {
                clientes.Text = DR["id_cliente"].ToString();

            }

            ligar.Close();
            ligar.Open();

            comando2.CommandText = "Select  count(id_voo) as id_cliente from voo";
            MySqlDataReader DR2;


            DR2 = comando2.ExecuteReader();

            if (DR2.Read())
            {
                voos.Text = DR2["id_cliente"].ToString();

            }

            ligar.Close();
            ligar.Open();

            comando3.CommandText = "Select  count(id_hoteis) as id_cliente from hoteis";
            MySqlDataReader DR3;
            DR3 = comando3.ExecuteReader();


            if (DR3.Read())
            {
                hoteis.Text = DR3["id_cliente"].ToString();

            }
            ligar.Close();
            ligar.Open();
            comando4.CommandText = "Select  count(id_atividade) as id_cliente from atividade";
            MySqlDataReader DR4;
            DR4 = comando4.ExecuteReader();

            if (DR4.Read())
            {
                atividades.Text = DR4["id_cliente"].ToString();

            }
            ligar.Close();


            ligar.Open();
            comando5.CommandText = "Select preco_total from reservas";

            MySqlDataReader DR5;
            DR5 = comando5.ExecuteReader();
            int preco_total = 0;

            while (DR5.Read())
            {
                preco_total = preco_total + Convert.ToInt32(DR5["preco_total"]);

            }

            lb_preco_desde_inicio.Text = preco_total.ToString();
            ligar.Close();








            ligar.Open();
            comando6.CommandText = "Select preco_total, adultos, criancas from reservas where data_reserva ='" + DateTime.Now.ToString("yyyy-MM-dd") + "'";

            MySqlDataReader DR6;
            DR6 = comando6.ExecuteReader();
            int preco_total2 = 0;
            int adulto_total2 = 0;
            int crianca_total2 = 0;

            while (DR6.Read())
            {
                preco_total2 = preco_total2 + Convert.ToInt32(DR6["preco_total"]);
                adulto_total2 = adulto_total2 + Convert.ToInt32(DR6["adultos"]);
                crianca_total2 = crianca_total2 + Convert.ToInt32(DR6["criancas"]);

            }

            preco_hoje.Text = preco_total2.ToString();
            criancas.Text = crianca_total2.ToString();
            adultos.Text = adulto_total2.ToString();

            ligar.Close();


            int x = 0;
            int[] max_reserva = new int[5];

            MySqlDataReader DR7_varivel;

            ligar.Open();
            comando7.Parameters.Clear();
            comando7.CommandText = "Select id_reserva from reservas order by id_reserva DESC LIMIT 0, 5";

            DR7_varivel = comando7.ExecuteReader();

            while (DR7_varivel.Read())
            {

                max_reserva[x] = Convert.ToInt32(DR7_varivel["id_reserva"]);
                x++;
            }


            x = 0;



            ligar.Close();


            ligar.Open();
            comando7.Parameters.Clear();
            comando7.CommandText = "Select data_reserva, id_cliente, id_viagens_pacotes from reservas where id_reserva = '" + max_reserva[x] + "'";


            MySqlDataReader DR7;
            DR7 = comando7.ExecuteReader();

            if (DR7.Read())
            {
                ligar2.Open();
                comando8.Parameters.Clear();
                comando8.CommandText = "Select mail from cliente where id_cliente = '" + DR7["id_cliente"] + "'";

                nome_cliente1.Text = comando8.ExecuteScalar().ToString();

                ligar2.Close();


                ligar2.Open();
                comando8.Parameters.Clear();
                comando8.CommandText = "Select data_entrada, data_saida from reserva_quartos where id_reserva = '" + max_reserva[x] + "'";


                MySqlDataReader DR8;
                DR8 = comando8.ExecuteReader();





                if (DR8.Read())
                {
                    DateTime data_entraga = Convert.ToDateTime(DR8["data_entrada"]);
                    DateTime data_saida = Convert.ToDateTime(DR8["data_saida"]);

                    data_entrada_cliente1.Text = data_entraga.ToString("d MMMM yyyy");

                    data_saida_cliente1.Text = data_saida.ToString("d MMMM yyyy");

                }



                if (DR7["id_viagens_pacotes"].ToString() == "31")
                {
                    tipo_reserva.Text = "Hotel";
                }

                else
                {
                    tipo_reserva.Text = "Pack";
                }


                if (DR7["data_reserva"].ToString() == DateTime.Today.ToString())
                {
                    mostrar_hoje_cliente1.Visible = true;
                }

                else
                {
                    mostrar_amanha_cliente1.Visible = true;
                }

                ligar2.Close();
                x++;
            }


            ligar.Close();





            ligar.Open();
            comando7.Parameters.Clear();
            comando7.CommandText = "Select data_reserva, id_cliente, id_viagens_pacotes from reservas where id_reserva = '" + max_reserva[x] + "'";


            MySqlDataReader DR7_cliente2;
            DR7_cliente2 = comando7.ExecuteReader();

            if (DR7_cliente2.Read())
            {
                ligar2.Open();
                comando8.Parameters.Clear();
                comando8.CommandText = "Select mail from cliente where id_cliente = '" + DR7_cliente2["id_cliente"] + "'";

                nome_cliente2.Text = comando8.ExecuteScalar().ToString();

                ligar2.Close();


                ligar2.Open();
                comando8.Parameters.Clear();
                comando8.CommandText = "Select data_entrada, data_saida from reserva_quartos where id_reserva = '" + max_reserva[x] + "'";


                MySqlDataReader DR8_cliente2;
                DR8_cliente2 = comando8.ExecuteReader();





                if (DR8_cliente2.Read())
                {
                    DateTime data_entraga = Convert.ToDateTime(DR8_cliente2["data_entrada"]);
                    DateTime data_saida = Convert.ToDateTime(DR8_cliente2["data_saida"]);

                    data_entrada_cliente2.Text = data_entraga.ToString("d MMMM yyyy");

                    data_saida_cliente2.Text = data_saida.ToString("d MMMM yyyy");

                }




                if (DR7_cliente2["id_viagens_pacotes"].ToString() == "31")
                {
                    tipo_reserva_cliente2.Text = "Hotel";
                }

                else
                {
                    tipo_reserva_cliente2.Text = "Pack";
                }


                if (DR7_cliente2["data_reserva"].ToString() == DateTime.Today.ToString())
                {
                    mostrar_hoje_cliente2.Visible = true;
                }

                else
                {
                    mostrar_amanha_cliente2.Visible = true;
                }

                ligar2.Close();

                x++;
            }


            ligar.Close();

          


                ligar.Open();
                comando7.Parameters.Clear();
                comando7.CommandText = "Select data_reserva, id_cliente, id_viagens_pacotes from reservas where id_reserva = '" + max_reserva[x] + "'";
                MySqlDataReader DR7_cliente3;
                DR7_cliente3 = comando7.ExecuteReader();

                if (DR7_cliente3.Read())
                {
                    ligar2.Open();
                    comando8.Parameters.Clear();
                    comando8.CommandText = "Select mail from cliente where id_cliente = '" + DR7_cliente3["id_cliente"] + "'";

                    nome_cliente3.Text = comando8.ExecuteScalar().ToString();

                    ligar2.Close();


                    ligar2.Open();
                    comando8.Parameters.Clear();
                    comando8.CommandText = "Select data_entrada, data_saida from reserva_quartos where id_reserva = '" + max_reserva[x] + "'";


                    MySqlDataReader DR8_cliente3;
                    DR8_cliente3 = comando8.ExecuteReader();





                    if (DR8_cliente3.Read())
                    {
                        DateTime data_entraga = Convert.ToDateTime(DR8_cliente3["data_entrada"]);
                        DateTime data_saida = Convert.ToDateTime(DR8_cliente3["data_saida"]);

                        data_entrada_cliente3.Text = data_entraga.ToString("d MMMM yyyy");

                        data_saida_cliente3.Text = data_saida.ToString("d MMMM yyyy");

                    }



                    if (DR7_cliente3["id_viagens_pacotes"].ToString() == "31")
                    {
                        tipo_reserva_cliente3.Text = "Hotel";
                    }

                    else
                    {
                        tipo_reserva_cliente3.Text = "Pack";
                    }


                    if (DR7_cliente3["data_reserva"].ToString() == DateTime.Today.ToString())
                    {
                        mostrar_hoje_cliente3.Visible = true;
                    }

                    else
                    {
                        mostrar_amanha_cliente3.Visible = true;
                    }

                    ligar2.Close();
                    x++;
                }


                ligar.Close();



                ligar.Open();
                comando7.Parameters.Clear();
                comando7.CommandText = "Select data_reserva, id_cliente, id_viagens_pacotes from reservas where id_reserva = '" + max_reserva[x] + "'";

                MySqlDataReader DR7_cliente4;
                DR7_cliente4 = comando7.ExecuteReader();


                if (DR7_cliente4.Read())
                {
                    ligar2.Open();
                    comando8.Parameters.Clear();
                    comando8.CommandText = "Select mail from cliente where id_cliente = '" + DR7_cliente4["id_cliente"] + "'";

                    nome_cliente4.Text = comando8.ExecuteScalar().ToString();

                    ligar2.Close();


                    ligar2.Open();
                    comando8.Parameters.Clear();
                    comando8.CommandText = "Select data_entrada, data_saida from reserva_quartos where id_reserva = '" + max_reserva[x] + "'";


                    MySqlDataReader DR8_cliente4;
                    DR8_cliente4 = comando8.ExecuteReader();





                    if (DR8_cliente4.Read())
                    {
                        DateTime data_entraga = Convert.ToDateTime(DR8_cliente4["data_entrada"]);
                        DateTime data_saida = Convert.ToDateTime(DR8_cliente4["data_saida"]);

                        data_entrada_cliente4.Text = data_entraga.ToString("d MMMM yyyy");

                        data_saida_cliente4.Text = data_saida.ToString("d MMMM yyyy");

                    }



                    if (DR7_cliente4["id_viagens_pacotes"].ToString() == "31")
                    {
                        tipo_reserva_cliente4.Text = "Hotel";
                    }

                    else
                    {
                        tipo_reserva_cliente4.Text = "Pack";
                    }


                    if (DR7_cliente4["data_reserva"].ToString() == DateTime.Today.ToString())
                    {
                        mostrar_hoje_cliente4.Visible = true;
                    }

                    else
                    {
                        mostrar_amanha_cliente4.Visible = true;
                    }

                    ligar2.Close();

                    x++;
                }


                ligar.Close();






                ligar.Open();
                comando7.Parameters.Clear();
                comando7.CommandText = "Select data_reserva, id_cliente, id_viagens_pacotes from reservas where id_reserva = '" + max_reserva[x] + "'";

                MySqlDataReader DR7_cliente5;
                DR7_cliente5 = comando7.ExecuteReader();


                if (DR7_cliente5.Read())
                {
                    ligar2.Open();
                    comando8.Parameters.Clear();
                    comando8.CommandText = "Select mail from cliente where id_cliente = '" + DR7_cliente5["id_cliente"] + "'";

                    nome_cliente5.Text = comando8.ExecuteScalar().ToString();

                    ligar2.Close();


                    ligar2.Open();
                    comando8.Parameters.Clear();
                    comando8.CommandText = "Select data_entrada, data_saida from reserva_quartos where id_reserva = '" + max_reserva[x] + "'";


                    MySqlDataReader DR8_cliente5;
                    DR8_cliente5 = comando8.ExecuteReader();





                    if (DR8_cliente5.Read())
                    {
                        DateTime data_entraga = Convert.ToDateTime(DR8_cliente5["data_entrada"]);
                        DateTime data_saida = Convert.ToDateTime(DR8_cliente5["data_saida"]);

                        data_entrada_cliente5.Text = data_entraga.ToString("d MMMM yyyy");

                        data_saida_cliente5.Text = data_saida.ToString("d MMMM yyyy");

                    }



                    if (DR7_cliente5["id_viagens_pacotes"].ToString() == "31")
                    {
                        tipo_reserva_cliente5.Text = "Hotel";
                    }

                    else
                    {
                        tipo_reserva_cliente5.Text = "Pack";
                    }


                    if (DR7_cliente5["data_reserva"].ToString() == DateTime.Today.ToString())
                    {
                        mostrar_hoje_cliente5.Visible = true;
                    }

                    else
                    {
                        mostrar_amanha_cliente5.Visible = true;
                    }

                    x++;
                }


                ligar.Close();
            }
            

        protected void signup_form_submit_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_gerir.aspx", false);
        }
    }
}