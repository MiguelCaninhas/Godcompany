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
    public partial class admin_editar_pais : System.Web.UI.Page
    {
        bool validar;
        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
             
            if (Session["validar_editar_pais"] == "true") {
                Session["validar_editar_pais"] = "false";
            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);
            }

            if (Session["validar_eliminar_pais"] == "true")
            {
                Session["validar_eliminar_pais"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_eliminar()", true);
            }
        }

        protected void editar_eliminar_Click(object sender, EventArgs e)
        {

        }

        protected void editar_editar_Click(object sender, EventArgs e)
        {

        }

        protected void login_form_submit_Click(object sender, EventArgs e)
        {

            bool validar2 = true;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlCommand comando2 = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;
            comando2.Connection = ligar;


            if (id_pais.Text != "" )
            {

                ligar.Open();

             comando.CommandText = "Delete from pais where " +
                "(id_pais = @id_pais)";
                comando.Parameters.AddWithValue("@id_pais", id_pais.Text);



                try
                {
                   
                    comando.ExecuteNonQuery();

                }
                catch (Exception erro)
                {
                    validar2 = false;
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_existe_algo_associado()", true);
                }

                finally
                {

                    if (validar2 == true)
                    {
                        Session["validar_eliminar_pais"] = "true";
                        Response.Redirect("admin_editar_pais.aspx", false);
                    }
                }
            }


            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error()", true);
               
            }
            ligar.Close();
        }

        protected void signup_form_submit_Click(object sender, EventArgs e)
        {
           

           
        }

        protected void signup_form_submit_Click1(object sender, EventArgs e)
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

            comando.CommandText = "Select  id_pais, nome , imagem from pais where " +
                "(id_pais = @id_pais)";
            comando.Parameters.AddWithValue("@id_pais", codigo);
            

            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_pais.Text = Convert.ToString(DR["id_pais"]);
                nome.Text = Convert.ToString(DR["nome"]);
              

            }


        }

        protected void editar_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();


            string filename = Path.GetFileName(FileUpload1.FileName);
          


           


            if (id_pais.Text != "" && nome.Text != "")
            {
                if (filename != "")
                {
                    FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                    comando.CommandText = "Update pais set nome = @nome, imagem = @imagem where " +
                        "(id_pais = @id_pais)";


                    comando.Parameters.AddWithValue("@id_pais", id_pais.Text);
                    comando.Parameters.AddWithValue("@nome", nome.Text);
                    comando.Parameters.AddWithValue("@imagem", filename.ToString());
                    comando.ExecuteNonQuery();
                    Session["validar_editar_pais"] = "true";
                    Response.Redirect("admin_editar_pais.aspx", false);
                }
                 
                else
                {

                    comando.CommandText = "Update pais set nome = @nome where " +
                        "(id_pais = @id_pais)";


                    comando.Parameters.AddWithValue("@id_pais", id_pais.Text);
                    comando.Parameters.AddWithValue("@nome", nome.Text);
                    comando.ExecuteNonQuery();
                    Session["validar_editar_pais"] = "true";
                    Response.Redirect("admin_editar_pais.aspx", false);
                }
            }



            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_editar()", true);
               

            }
            ligar.Close();
        }
    }
}