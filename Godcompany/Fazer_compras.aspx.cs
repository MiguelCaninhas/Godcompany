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
    public partial class Fazer_compras : System.Web.UI.Page
    {
        int backup_single, backup_double, backup_triple, backup_suite, aux, total_de_pessoas;



        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";

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
        }

        protected void btn_reset_atividades_Click(object sender, EventArgs e)
        {
            id_atividades.Text = "";
            ListBox1.Items.Clear();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();

            comando.CommandText = "Select nome_pacote, imagem, data_partida, data_chegada from viagens_pacotes where (id_viagens_pacotes = @id_viagens_pacotes)";
            comando.Parameters.AddWithValue("@id_viagens_pacotes", Session["id_pack2"]);


            DR = comando.ExecuteReader();

            if (DR.Read())
            {
               
                nome.Text = Convert.ToString(DR["nome_pacote"]);
               img.ImageUrl ="images/" + Convert.ToString(DR["imagem"]);
                txt_voo_de_ida.Text =  Convert.ToDateTime(DR["data_partida"]).ToString("yyyy-MM-dd");
                txt_dia_volta.Text = Convert.ToDateTime(DR["data_chegada"]).ToString("yyyy-MM-dd");

               

            }
            ligar.Close();



            ligar.Open();
            comando.CommandText = "SELECT voo.id_voo, voo.nome, voo.hora_partida, voo.hora_chegada FROM voo, viagens_voo WHERE voo.id_voo = viagens_voo.id_voo AND viagens_voo.id_viagens_pacotes = @id_viagens_pacotes";

            DR = comando.ExecuteReader();

            if (DR.Read())
            {
                lbl_id_voo_ida.Text = DR["id_voo"].ToString();
                txt_voo_ida.Text = DR["nome"].ToString();
                txt_hora_voo_ida.Text = DR["hora_partida"].ToString();
                txt_hora_chegada_voo_ida.Text = DR["hora_chegada"].ToString();
            }

            if (DR.Read())
            {
                lbl_id_voo_volta.Text = DR["id_voo"].ToString();
                txt_voo_volta.Text = DR["nome"].ToString();
                txt_hora_voo_volta.Text = DR["hora_partida"].ToString();
                txt_hora_chegada_voo_volta.Text = DR["hora_chegada"].ToString();
            }

            ligar.Close();



            ligar.Open();
            comando.CommandText = "SELECT hoteis.id_hoteis, hoteis.nome_hotel FROM hoteis, viagens_hoteis WHERE hoteis.id_hoteis = viagens_hoteis.id_hoteis AND viagens_hoteis.id_viagens_pacotes = @id_viagens_pacotes";

            DR = comando.ExecuteReader();

            if(DR.Read())
            {
                lbl_id_hotel.Text = DR["id_hoteis"].ToString();
                txt_hotel.Text = DR["nome_hotel"].ToString();
            }

            ligar.Close();


            escolher_tipo_quarto.SelectCommand = "SELECT tipo_quarto.nome, quartos.id_tipo_quarto FROM quartos, tipo_quarto WHERE quartos.id_hoteis = " + lbl_id_hotel.Text + " AND quartos.id_tipo_quarto = tipo_quarto.id_tipo_quarto GROUP BY tipo_quarto.id_tipo_quarto";



            preço.Text = "1";

            MySqlCommand comando7 = new MySqlCommand();
            comando7.Connection = ligar;
            ligar.Open();

            
            comando7.Parameters.Clear();
            comando7.CommandText = "SELECT preço FROM viagens_pacotes WHERE id_viagens_pacotes = @id_viagens_pacotes";
            comando7.Parameters.AddWithValue("@id_viagens_pacotes", Session["id_pack2"]);

            preço.Text = Convert.ToString( Convert.ToInt32( comando7.ExecuteScalar()));

            ligar.Close();








        }





        protected void Eliminar_Click1(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand(), comando2 = new MySqlCommand(), comando3 = new MySqlCommand();

            comando.Connection = ligar;
            comando2.Connection = ligar;
            comando3.Connection = ligar;

            ligar.Open();

            comando2.CommandText = "SELECT viagens_pacotes.data_partida FROM viagens_pacotes WHERE viagens_pacotes.id_viagens_pacotes = @id";
            comando2.Parameters.AddWithValue("@id", Session["id_pack2"]);
            data_entrada.Text = Convert.ToDateTime(comando2.ExecuteScalar()).ToString("yyyy-MM-dd");


            comando3.CommandText = "SELECT viagens_pacotes.data_chegada FROM viagens_pacotes WHERE viagens_pacotes.id_viagens_pacotes = @id";
            comando3.Parameters.AddWithValue("@id", Session["id_pack2"]);
            data_saida.Text = Convert.ToDateTime(comando3.ExecuteScalar()).ToString("yyyy-MM-dd");

            comando.CommandText = "SELECT quartos.id_quartos FROM quartos WHERE quartos.id_hoteis = @hoteis AND quartos.id_tipo_quarto = @tipo AND quartos.id_quartos NOT IN (SELECT reserva_quartos.id_quarto FROM reserva_quartos WHERE reserva_quartos.data_entrada BETWEEN @data_entrada AND @data_saida OR reserva_quartos.data_entrada = @data_entrada OR reserva_quartos.data_entrada = @data_saida OR reserva_quartos.data_saida BETWEEN @data_entrada AND @data_saida OR reserva_quartos.data_saida = @data_entrada OR reserva_quartos.data_saida = @data_saida) LIMIT " + lbl_limitante.Text + ", 10000";
            comando.Parameters.AddWithValue("@tipo", DropDownList4.SelectedValue);
            comando.Parameters.AddWithValue("@hoteis", lbl_id_hotel.Text);
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
        }

        protected void atividades_Click(object sender, EventArgs e)
        {
            string[] atividades = id_atividades.Text.Split(';');
            bool confirmar = true;
            
            foreach (ListItem linhas in ListBox1.Items)
            {
                if (linhas.ToString() == DropDownList3.SelectedItem.ToString())
                    confirmar = false;
            }

            if(confirmar == true)
            {
                ListBox1.Items.Add(DropDownList3.SelectedItem);
                id_atividades.Text = id_atividades.Text + ";" + DropDownList3.SelectedValue;
            }

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando8 = new MySqlCommand();
            comando8.Connection = ligar;

            ligar.Open();

            comando8.Parameters.Clear();
            comando8.CommandText = "SELECT preco FROM atividade WHERE id_atividade = @atividade";
            comando8.Parameters.AddWithValue("@atividade", DropDownList3.SelectedValue);

            preço.Text = Convert.ToString( Convert.ToInt32(preço.Text) + Convert.ToInt32(comando8.ExecuteScalar()));

            ligar.Close();


        }

        protected void finalizar_Click(object sender, EventArgs e)
        {


            if (txt_adultos.Text != "" || txt_criancas.Text != "")
            {
                total_de_pessoas = 0;

            if (txt_criancas.Text == "")
            {
                total_de_pessoas = Convert.ToInt32(txt_adultos.Text);
            }

            else { 
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
                    string[] atividades = id_atividades.Text.Split(';');

                    ligar.Open();

                    comando1.CommandText = "INSERT INTO reservas (adultos, criancas, data_reserva, id_cliente, id_viagens_pacotes, preco_total) VALUES (@adultos, @criancas, @data_reserva, @cliente, @pacote, 0)";
                    comando1.Parameters.AddWithValue("@adultos", txt_adultos.Text);
                    comando1.Parameters.AddWithValue("@criancas", txt_criancas.Text);
                    comando1.Parameters.AddWithValue("@data_reserva", DateTime.Now.ToString("yyyy-MM-dd"));
                    comando1.Parameters.AddWithValue("@cliente", Session["cliente"]);
                    comando1.Parameters.AddWithValue("@pacote", Session["id_pack2"]);
                    comando1.ExecuteNonQuery();

                    foreach (string quarto in quartos)
                    {
                        comando2.Parameters.Clear();

                        if (quarto != "")
                        {
                            comando2.CommandText = "INSERT INTO reserva_quartos (id_hotel, id_quarto, id_regime, id_reserva, data_entrada, data_saida) VALUES (@hotel, @quarto, @regime, (SELECT MAX(id_reserva) FROM reservas), @data_entrada, @data_saida)";
                            comando2.Parameters.AddWithValue("@hotel", lbl_id_hotel.Text);
                            comando2.Parameters.AddWithValue("@quarto", quarto);
                            comando2.Parameters.AddWithValue("@regime", 1);
                            comando2.Parameters.AddWithValue("@data_entrada", data_entrada.Text);
                            comando2.Parameters.AddWithValue("@data_saida", data_saida.Text);
                            comando2.ExecuteNonQuery();

                        }
                    }

                    foreach (string atividade in atividades)
                    {
                        comando2.Parameters.Clear();

                        if (atividade != "")
                        {
                            comando2.CommandText = "INSERT INTO detalhe_reserva (id_reserva, id_atividade, data_entrada, data_saida) VALUES ((SELECT MAX(id_reserva) FROM reservas), @atividade, @data_entrada, @data_saida)";
                            comando2.Parameters.AddWithValue("@atividade", atividade);
                            comando2.Parameters.AddWithValue("@data_entrada", data_entrada.Text);
                            comando2.Parameters.AddWithValue("@data_saida", data_saida.Text);
                            
                                comando2.ExecuteNonQuery();
                            



                            comando3.Parameters.Clear();
                            comando3.CommandText = "SELECT preco FROM atividade WHERE id_atividade = @atividade";
                            comando3.Parameters.AddWithValue("@atividade", atividade);

                            soma_preco_atividades = soma_preco_atividades + Convert.ToInt32(comando3.ExecuteScalar());






                        }

                    }





                    comando3.Parameters.Clear();
                    comando3.CommandText = "SELECT preço FROM viagens_pacotes WHERE id_viagens_pacotes = @id_viagens_pacotes";
                    comando3.Parameters.AddWithValue("@id_viagens_pacotes", Session["id_pack2"]);

                    soma_preco_quartos = Convert.ToInt32(comando3.ExecuteScalar()) * Convert.ToInt32(total_de_pessoas.ToString());



                    comando1.CommandText = "UPDATE reservas SET preco_total = @preco WHERE id_reserva = @reserva";
                    comando1.Parameters.AddWithValue("@reserva", comando4.ExecuteScalar().ToString());
                    comando1.Parameters.AddWithValue("@preco", (soma_preco_atividades * total_de_pessoas) + soma_preco_quartos);


           
                    comando1.ExecuteNonQuery();




                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);



                ligar.Close();

                //Response.Redirect(Request.RawUrl);
                }
                else
                {
                
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_pessoas_in()", true);
                 }

            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error() ", true);
            }




        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(aux == 1)
            {
                backup_single = Convert.ToInt32(lbl_limitante.Text);
            }

            else if(aux == 2)
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