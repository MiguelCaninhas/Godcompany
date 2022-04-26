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

    public partial class admin_adicionar_atividades : System.Web.UI.Page
    {

        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void signup_form_submit_Click(object sender, EventArgs e)
        {

        }

        protected void editar_Click(object sender, EventArgs e)
        {
            bool validar = true;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();

            MySqlDataReader DR;






            ligar.Open();
            comando.CommandText = "insert into atividade(nome, preco, id_pais, lotacao, imagem) values (@nome, @preco, @id_pais, @lotacao, @imagem)";

            
            if ( id_pais.Text != "") { 

            if (FileUpload1.FileName != "" && nome_atividade.Text != "" && preço_atividade.Text != ""  && lotaçao_atividade.Text != "")
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                comando.Connection = ligar;


                comando.Parameters.AddWithValue("@nome", nome_atividade.Text);
                comando.Parameters.AddWithValue("@preco", preço_atividade.Text);
                comando.Parameters.AddWithValue("@id_pais", id_pais.Text);
                comando.Parameters.AddWithValue("@lotacao", lotaçao_atividade.Text);
                comando.Parameters.AddWithValue("@imagem", FileUpload1.FileName);

                try
                {
                    
                    comando.ExecuteNonQuery();

                }

                catch
                {
                    validar = false;
                   
                }



                finally
                {
                    if (validar == true)
                    {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);
                        }
                }
            }


            else
            {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos_preencher()", true);
                }

            }

            else
            {


                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_adicionar()", true);

            }
            ligar.Close();


        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            linha = GridView1.SelectedIndex;
            codigo = GridView1.Rows[linha].Cells[1].Text;


            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();

            comando.CommandText = "Select  id_pais, nome from pais where " +
                "(id_pais = @id_pais)";
            comando.Parameters.AddWithValue("@id_pais", codigo);


            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_pais.Text = Convert.ToString(DR["id_pais"]);
                id_pais_nome.Text = Convert.ToString(DR["nome"]);

            }

        }
    }
}