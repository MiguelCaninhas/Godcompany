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
    public partial class admin_editar_atividades_aspx : System.Web.UI.Page
    {

        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["validar_editar_atividade"] == "true")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_editar()", true);

            }
            if (Session["validar_eliminar_atividade"] == "true")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_eliminar()", true);
            }

        }

        
        protected void editar_Click(object sender, EventArgs e)
        {


            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();



         
            if (FileUpload1.FileName != "" )
            {

                comando.CommandText = "Update atividade set nome = @nome, preco = @preco, id_pais = @id_pais, lotacao = @lotacao, imagem = @imagem where " +
                           "(id_atividade = @id_atividade)";

                if (id_atividade.Text != "")
                {
                    if (nome.Text != "" && preco.Text != "" && lotacao.Text != "" && DropDownList2.SelectedValue != "")
                    {

                        string filename = Path.GetFileName(FileUpload1.FileName);
                        FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                        comando.Parameters.AddWithValue("@id_atividade", id_atividade.Text);
                        comando.Parameters.AddWithValue("@nome", nome.Text);
                        comando.Parameters.AddWithValue("@preco", preco.Text);
                        comando.Parameters.AddWithValue("@lotacao", lotacao.Text);
                        comando.Parameters.AddWithValue("@id_pais", DropDownList2.SelectedValue);
                        comando.Parameters.AddWithValue("@imagem", filename);
                        comando.ExecuteNonQuery();


                        Session["validar_editar_atividade"] = "true";
                        Response.Redirect("admin_editar_atividades.aspx", false);

                        ligar.Close();

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos_por_preencher()", true);

                    }

                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_editar()", true);

                }
            }

            else
            {
                comando.CommandText = "Update atividade set nome = @nome, preco = @preco, id_pais = @id_pais, lotacao = @lotacao where " +
                           "(id_atividade = @id_atividade)";

                if (id_atividade.Text != "")
                {

                    if (nome.Text != "" && preco.Text != "" && lotacao.Text != "" && DropDownList2.SelectedValue != "")
                    {

                        comando.Parameters.AddWithValue("@id_atividade", id_atividade.Text);
                        comando.Parameters.AddWithValue("@nome", nome.Text);
                         comando.Parameters.AddWithValue("@preco", preco.Text);
                        comando.Parameters.AddWithValue("@lotacao", lotacao.Text);
                         comando.Parameters.AddWithValue("@id_pais", DropDownList2.SelectedValue);
                    
                        comando.ExecuteNonQuery();


                        Session["validar_editar_atividade"] = "true";
                         Response.Redirect("admin_editar_atividades.aspx", false);

                        ligar.Close();

                        


                    }

                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos_por_preencher()", true);

                    }

                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_editar()", true);

                }

            }

           

        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            bool validar = true;

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlCommand comando2 = new MySqlCommand();
            MySqlDataReader DR;


            comando.Connection = ligar;
            comando2.Connection = ligar;

            ligar.Open();

            if (id_atividade.Text != "")
            {


                comando.CommandText = "Delete from atividade where " +
                "(id_atividade = @id_atividade)";
                comando.Parameters.AddWithValue("@id_atividade", id_atividade.Text);

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
                    if (validar == true)
                    {
                        Session["validar_eliminar_atividade"] = "true";
                        Response.Redirect("admin_editar_atividades.aspx", false);
                    }
                }
                
            }


            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_eliminar()", true);

            }
            ligar.Close();
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

            comando.CommandText = "Select id_atividade, nome, preco, id_pais, lotacao from atividade where " +
                "(id_atividade = @id_atividade)";
            comando.Parameters.AddWithValue("@id_atividade", codigo);


            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_atividade.Text = Convert.ToString(DR["id_atividade"]);
                nome.Text = Convert.ToString(DR["nome"]);
                lotacao.Text = Convert.ToString(DR["lotacao"]);
              
                preco.Text = Convert.ToString(DR["preco"]);
                DropDownList2.SelectedValue = Convert.ToString(DR["id_pais"]);



            }
        }
    }
}