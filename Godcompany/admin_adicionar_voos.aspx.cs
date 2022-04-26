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
    public partial class admin_adicionar_voos : System.Web.UI.Page
    {
      
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["criar_voo"] == "true")
            {
                Session["criar_voo"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_criar()", true);
            }

        }

        protected void adicionar_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();




            if ( nome_voo.Text != "" && lotacao.Text != "" && Pais_origem.SelectedValue != "" && Pais_destino.SelectedValue != "" && companhia.SelectedValue != "" && hora_partida.Text != "" && hora_chegada.Text != "")
            {



                comando.CommandText = "insert into voo(nome, pais_destino, id_companhia, pais_origem, lotaç" +
                    "ao, hora_partida, hora_chegada) values(@nome, @pais_destino, @id_companhia, @pais_origem, @lotacao, @hora_partida, @hora_chegada)";



                comando.Parameters.AddWithValue("@nome", nome_voo.Text);
                comando.Parameters.AddWithValue("@pais_destino", Pais_destino.SelectedValue);
                comando.Parameters.AddWithValue("@pais_origem", Pais_origem.SelectedValue);
                comando.Parameters.AddWithValue("@id_companhia", companhia.SelectedValue);

                comando.Parameters.AddWithValue("@hora_partida", hora_partida.Text);
                comando.Parameters.AddWithValue("@hora_chegada", hora_chegada.Text);
                comando.Parameters.AddWithValue("@lotacao", lotacao.Text);
                comando.ExecuteNonQuery();




                Session["criar_voo"] = "true";
                Response.Redirect("admin_adicionar_voos.aspx", false);



            }



            else
            {
              
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos()", true);
            }


            ligar.Close();
        }

   
    }
}