using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.IO;

namespace Godcompany
{
    public partial class Fazer_compras_hotel : System.Web.UI.Page
    {



        int backup_single, backup_double, backup_triple, backup_suite, aux, total_de_pessoas;



        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";

        protected void nome_TextChanged(object sender, EventArgs e)
        {


            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();




            comando.CommandText = "SELECT hoteis.nome_hotel, hoteis.id_classificacao, hoteis.imagem, pais.nome FROM hoteis INNER JOIN pais ON hoteis.id_pais = pais.id_pais where hoteis.id_hoteis = @id_hoteis";
            comando.Parameters.AddWithValue("@id_hoteis", Session["id_hotel3"]);
            DR = comando.ExecuteReader();

            if (DR.Read())
            {

                nome.Text = DR["nome_hotel"].ToString();
                classificacao.Text = DR["id_classificacao"].ToString();
                Pais.Text = DR["nome"].ToString();
                img.ImageUrl = "images/" + Convert.ToString(DR["imagem"]);

            }

            ligar.Close();

            MessageBox.Show("Aqui nao pode escrever!", "Ups");
        }

        protected void classificacao_TextChanged(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();




            comando.CommandText = "SELECT hoteis.nome_hotel, hoteis.id_classificacao, hoteis.imagem, pais.nome FROM hoteis INNER JOIN pais ON hoteis.id_pais = pais.id_pais where hoteis.id_hoteis = @id_hoteis";
            comando.Parameters.AddWithValue("@id_hoteis", Session["id_hotel3"]);
            DR = comando.ExecuteReader();

            if (DR.Read())
            {

                nome.Text = DR["nome_hotel"].ToString();
                classificacao.Text = DR["id_classificacao"].ToString();
                Pais.Text = DR["nome"].ToString();
                img.ImageUrl = "images/" + Convert.ToString(DR["imagem"]);

            }

            ligar.Close();

            MessageBox.Show("Aqui nao pode escrever!", "Ups");
        }

        protected void Pais_TextChanged(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();




            comando.CommandText = "SELECT hoteis.nome_hotel, hoteis.id_classificacao, hoteis.imagem, pais.nome FROM hoteis INNER JOIN pais ON hoteis.id_pais = pais.id_pais where hoteis.id_hoteis = @id_hoteis";
            comando.Parameters.AddWithValue("@id_hoteis", Session["id_hotel3"]);
            DR = comando.ExecuteReader();

            if (DR.Read())
            {

                nome.Text = DR["nome_hotel"].ToString();
                classificacao.Text = DR["id_classificacao"].ToString();
                Pais.Text = DR["nome"].ToString();
                img.ImageUrl = "images/" + Convert.ToString(DR["imagem"]);

            }

            ligar.Close();


            MessageBox.Show("Aqui nao pode escrever!", "Ups");

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            











            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();



           
            comando.CommandText = "SELECT hoteis.nome_hotel, hoteis.id_classificacao, hoteis.imagem, pais.nome FROM hoteis INNER JOIN pais ON hoteis.id_pais = pais.id_pais where hoteis.id_hoteis = @id_hoteis";
            comando.Parameters.AddWithValue("@id_hoteis", Session["id_hotel3"]);
            DR = comando.ExecuteReader();

            if (DR.Read())
            {
                
                nome.Text = DR["nome_hotel"].ToString();
                classificacao.Text = DR["id_classificacao"].ToString();
                Pais.Text = DR["nome"].ToString();
                img.ImageUrl = "images/" + Convert.ToString(DR["imagem"]);

            }

            ligar.Close();


            SqlDataSource1.SelectCommand = "SELECT tipo_quarto.nome, quartos.id_tipo_quarto FROM quartos, tipo_quarto WHERE quartos.id_hoteis = " + Session["id_hotel3"] + " AND quartos.id_tipo_quarto = tipo_quarto.id_tipo_quarto GROUP BY tipo_quarto.id_tipo_quarto";








        }

        int preço = 0;

        protected void Button1_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand();

            comando.Connection = ligar;
            comando2.Connection = ligar;
            comando3.Connection = ligar;

            ligar.Open();




            comando.CommandText = "SELECT quartos.id_quartos FROM quartos WHERE quartos.id_hoteis = @hoteis AND quartos.id_tipo_quarto = @tipo AND quartos.id_quartos NOT IN (SELECT reserva_quartos.id_quarto FROM reserva_quartos WHERE reserva_quartos.data_entrada BETWEEN @data_entrada AND @data_saida OR reserva_quartos.data_entrada = @data_entrada OR reserva_quartos.data_entrada = @data_saida OR reserva_quartos.data_saida BETWEEN @data_entrada AND @data_saida OR reserva_quartos.data_saida = @data_entrada OR reserva_quartos.data_saida = @data_saida) LIMIT " + lbl_limitante.Text + ", 10000";
            comando.Parameters.AddWithValue("@tipo", DropDownList4.SelectedValue);
            comando.Parameters.AddWithValue("@hoteis", Session["id_hotel3"]);
            comando.Parameters.AddWithValue("@data_entrada", data_entrada.Text);
            comando.Parameters.AddWithValue("@data_saida", data_saida.Text);

            lbl_limitante.Text = Convert.ToString(Convert.ToInt32(lbl_limitante.Text) + 1);

            if (comando.ExecuteScalar() != null)
            {
                ListBox2.Items.Add(DropDownList4.SelectedItem);

                id_hoteis.Text = id_hoteis.Text + comando.ExecuteScalar().ToString() + ";";

                pessoas_limite.Text = Convert.ToString(Convert.ToInt32(pessoas_limite.Text) + Convert.ToInt32(DropDownList4.SelectedValue));
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_quartos_indesponiveis()", true);
            }
            ligar.Close();


            string[] quartos = id_hoteis.Text.Split(';');

            int total_dias_int = 0;
            int validar_contar = 0;
            preço_2.Text = "0";

            MySqlCommand comando7 = new MySqlCommand();
            comando7.Connection = ligar;
            ligar.Open();


            if( data_entrada.Text != "" && data_saida.Text != "") { 

            DateTime data_teste1 = Convert.ToDateTime(data_saida.Text);
            DateTime date_teste2 = Convert.ToDateTime(data_entrada.Text);


            TimeSpan total_data = data_teste1 - date_teste2;
          


            total_dias_int = Convert.ToInt32(total_data.TotalDays);
            }
            foreach (string quarto in quartos)
            {







                comando7.Parameters.Clear();
                comando7.CommandText = "SELECT preco FROM quartos WHERE id_quartos = @id_quartos AND id_hoteis = @id_hoteis";
                comando7.Parameters.AddWithValue("@id_hoteis", Session["id_hotel3"]);
                comando7.Parameters.AddWithValue("@id_quartos", quartos[validar_contar]);

                if(quartos != null)
                    preço =  preço + Convert.ToInt32(comando7.ExecuteScalar());

                validar_contar++;
            }


            preço_2.Text = Convert.ToString(preço * total_dias_int);
            ligar.Close();

        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            
            id_hoteis.Text = "";
            ListBox2.Items.Clear();
            pessoas_limite.Text = "0";
            lbl_limitante.Text = "0";

            backup_single = 0;
            backup_double = 0;
            backup_triple = 0;
            backup_suite = 0;
            preço_2.Text = "";

        }

        protected void finalizar_Click(object sender, EventArgs e)
        {
            bool validar = false;
            int validar_quartos = 0;
            var data_entrada_v = new DateTime();
            var data_saida_v = new DateTime();


            var date = DateTime.Now;
            if (data_entrada.Text != "" && data_saida.Text != "")
            {
                data_entrada_v = Convert.ToDateTime(data_entrada.Text);
                data_saida_v = Convert.ToDateTime(data_saida.Text);
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_data()", true);

            }



        if(txt_criancas.Text != "" || txt_adultos.Text != "") { 
            if (data_saida_v > data_entrada_v)
            {
                if (data_entrada_v > date && data_saida_v > date)
                {



                    total_de_pessoas = 0;

                    if (txt_criancas.Text == "")
                    {
                        total_de_pessoas = Convert.ToInt32(txt_adultos.Text);
                    }

                    else
                    {
                        total_de_pessoas = Convert.ToInt32(txt_adultos.Text) + Convert.ToInt32(txt_criancas.Text);
                    }
                    decimal soma_preco_quartos = 0, soma_preco_atividades = 0;


                        if (Convert.ToInt32(pessoas_limite.Text) >= total_de_pessoas)
                        {
                            MySqlConnection ligar = new MySqlConnection(configuracao);
                            MySqlCommand comando1 = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand(), comando4 = new MySqlCommand("SELECT MAX(id_reserva) FROM reservas", ligar);

                            comando1.Connection = ligar;
                            comando2.Connection = ligar;
                            comando3.Connection = ligar;

                            string[] quartos = id_hoteis.Text.Split(';');
                            

                            ligar.Open();

                            comando1.CommandText = "INSERT INTO reservas (adultos, criancas, data_reserva, id_cliente, id_viagens_pacotes, preco_total) VALUES (@adultos, @criancas, @data_reserva, @cliente, @pacote, 0)";
                            comando1.Parameters.AddWithValue("@adultos", txt_adultos.Text);
                            comando1.Parameters.AddWithValue("@criancas", txt_criancas.Text);
                            comando1.Parameters.AddWithValue("@data_reserva", DateTime.Now.ToString("yyyy-MM-dd"));
                            comando1.Parameters.AddWithValue("@cliente", Session["cliente"]);
                            comando1.Parameters.AddWithValue("@pacote", 31);
                            comando1.ExecuteNonQuery();

                            foreach (string quarto in quartos)
                            {
                               

                                if (quartos[validar_quartos] != "")
                                {
                                    comando2.Parameters.Clear();
                                    comando2.CommandText = "INSERT INTO reserva_quartos (id_hotel, id_quarto, id_regime, id_reserva, data_entrada, data_saida) VALUES (@hotel, @quarto, @regime, (SELECT MAX(id_reserva) FROM reservas), @data_entrada, @data_saida)";
                                    comando2.Parameters.AddWithValue("@hotel", Session["id_hotel3"]);
                                    comando2.Parameters.AddWithValue("@quarto", quartos[validar_quartos]);
                                    comando2.Parameters.AddWithValue("@regime", 1);
                                    comando2.Parameters.AddWithValue("@data_entrada", data_entrada.Text);
                                    comando2.Parameters.AddWithValue("@data_saida", data_saida.Text);
                                    comando2.ExecuteNonQuery();


                                comando3.Parameters.Clear();
                                comando3.CommandText = "SELECT preco FROM quartos WHERE id_hoteis = @id_hoteis AND id_quartos = @id_quartos";
                                comando3.Parameters.AddWithValue("@id_quartos", quartos[validar_quartos]);
                                comando3.Parameters.AddWithValue("@id_hoteis", Session["id_hotel3"]);


                                soma_preco_quartos = soma_preco_quartos + Convert.ToInt32(comando3.ExecuteScalar()) ;

                                validar_quartos++;
                                
                                 }


                             
                            }






                        DateTime data_teste1 = Convert.ToDateTime(data_saida.Text);
                        DateTime date_teste2 = Convert.ToDateTime(data_entrada.Text);



                        TimeSpan total_data = data_teste1 - date_teste2;


                        int total_dias_int = Convert.ToInt32(total_data.TotalDays);




                        comando1.CommandText = "UPDATE reservas SET preco_total = @preco WHERE id_reserva = @reserva";
                            comando1.Parameters.AddWithValue("@reserva", comando4.ExecuteScalar().ToString());
                            comando1.Parameters.AddWithValue("@preco",  soma_preco_quartos* total_dias_int);



                            comando1.ExecuteNonQuery();

                            ligar.Close();


                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);
                     
                        }
                        else
                        {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_pessoas_in()", true);
                    }
                    
                 




                }



                else 
                {
                    validar = true;
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_data_de_hoje()", true);
                }
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_data_final()", true);
            }


            }
        else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_pessoas_nada()", true);
            }



        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (aux == 1)
            {
                backup_single = Convert.ToInt32(lbl_limitante.Text);
            }

            else if (aux == 2)
            {
                backup_double = Convert.ToInt32(lbl_limitante.Text);
            }
            else if (aux == 3)
            {
                backup_triple = Convert.ToInt32(lbl_limitante.Text);

            }
            else if (aux == 4)
            {
                backup_suite = Convert.ToInt32(lbl_limitante.Text);

            }

            if (DropDownList4.SelectedValue == "1")
            {
                aux = 1;
                lbl_limitante.Text = backup_single.ToString();
            }

            else if (DropDownList4.SelectedValue == "2")
            {
                aux = 2;
                lbl_limitante.Text = backup_double.ToString();
            }

            else if (DropDownList4.SelectedValue == "3")
            {
                aux = 3;
                lbl_limitante.Text = backup_triple.ToString();
            }

            else if (DropDownList4.SelectedValue == "4")
            {
                aux = 4;
                lbl_limitante.Text = backup_suite.ToString();
            }
        }
    }
}