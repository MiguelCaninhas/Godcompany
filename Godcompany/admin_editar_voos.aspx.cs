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
    public partial class admin_editar_voos : System.Web.UI.Page
    {

        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["correct_editar_voo"] == "true")
            {
                Session["correct_editar_voo"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_editar()", true);
            }

            if(Session["correct_eliminar_sucess"] == "true")
            {
                Session["correct_eliminar_sucess"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_apagar()", true);
            }
        }


        protected void adicionar_Click1(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            {
                linha = GridView1.SelectedIndex;
                codigo = GridView1.Rows[linha].Cells[1].Text;


                MySqlConnection ligar = new MySqlConnection(configuracao);
                MySqlCommand comando = new MySqlCommand();
                MySqlDataReader DR;

                comando.Connection = ligar;

                ligar.Open();

                comando.CommandText = "Select  id_voo, nome, pais_destino, id_companhia, hora_partida, hora_chegada, pais_origem, lotaçao from voo where " +
                    "(id_voo = @id_voo)";
                comando.Parameters.AddWithValue("@id_voo", codigo);


                DR = comando.ExecuteReader();



                if (DR.Read())
                {
                    id_voo.Text = Convert.ToString(DR["id_voo"]);
                    nome_voo.Text = Convert.ToString(DR["nome"]);
                    Pais_destino.SelectedValue = Convert.ToString(DR["pais_destino"]);
                    companhia.SelectedValue = Convert.ToString(DR["id_companhia"]);
                    hora_chegada.Text = Convert.ToString(DR["hora_chegada"]);
                    hora_partida.Text = Convert.ToString(DR["hora_partida"]);
                    Pais_origem.SelectedValue = Convert.ToString(DR["pais_origem"]);
                    lotacao.Text = Convert.ToString(DR["lotaçao"]);
                }
            }
        }

        protected void editar_Click(object sender, EventArgs e)
        {

            bool validar = true;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();

            comando.CommandText = "Update voo set nome = @nome, pais_destino = @pais_destino, id_companhia = @id_companhia, pais_origem = @pais_origem, lotaçao = @lotacao, hora_partida = @hora_partida, hora_chegada = @hora_chegada where " +
                       "(id_voo = @id_voo)";

            if (id_voo.Text != "")
            {

                comando.Parameters.AddWithValue("@id_voo", id_voo.Text);
                comando.Parameters.AddWithValue("@nome", nome_voo.Text);
                comando.Parameters.AddWithValue("@pais_destino", Pais_destino.SelectedValue);
                comando.Parameters.AddWithValue("@lotacao", lotacao.Text);
                comando.Parameters.AddWithValue("@id_companhia", companhia.SelectedValue);
                comando.Parameters.AddWithValue("@hora_partida", hora_partida.Text);
                comando.Parameters.AddWithValue("@hora_chegada", hora_chegada.Text);
                comando.Parameters.AddWithValue("@pais_origem", Pais_origem.SelectedValue);


             
                    comando.ExecuteNonQuery();






                Session["correct_editar_voo"] = "true";
                Response.Redirect("admin_editar_voos.aspx", false);

               

                ligar.Close();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_editar()", true);

            }

        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            bool validar = true;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();

            comando.CommandText = "Delete from voo where " +
                "(id_voo = @id_voo)";
            comando.Parameters.AddWithValue("@id_voo", id_voo.Text);

            if (id_voo.Text != "")
            {


                try
                {
                    comando.ExecuteReader();
                }

                catch
                {
                    validar = false;
                   
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_existe_algo_associado()", true);


                }


                finally
                {
                    if(validar== true)
                    {
                        Session["correct_eliminar_sucess"] = "true";
                        Response.Redirect("admin_editar_voos.aspx", false);

                    }
                }
            }
            else
            {
                
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error_nao_escolher_apagar()", true);

            }

            
        }
    }
}