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
    public partial class admin_companhia : System.Web.UI.Page
    {

        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["criar_companhia"] == "true")
            {
                Session["criar_companhia"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_criar()", true);
            }

            if(Session["editar_companhia"] == "true")
            {
                Session["editar_companhia"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_editar()", true);
            }

            if (Session["apagar_companhia"] == "true")
            {
                Session["apagar_companhia"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_eliminar()", true);
            }
        }

        protected void signup_form_submit_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();




            if (nome_companhia.Text != "" )
            {
               
                    

                    comando.CommandText = "insert into companhia(nome ) values(@nome)";



                    comando.Parameters.AddWithValue("@nome", nome_companhia.Text);
                 
                    comando.ExecuteNonQuery();




                Session["criar_companhia"] = "true";
                Response.Redirect("admin_companhia.aspx", false);



            }



            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error_adicionar_nome()", true);

            }


            ligar.Close();

        }

        protected void editar_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();

            if (nome_companhia.Text != "" && id.Text != "")
            {
               


                comando.CommandText = "Update companhia set nome = @nome where" +
                 "(id_companhia = @id_companhia)";


                comando.Parameters.AddWithValue("@id_companhia", id.Text);
                comando.Parameters.AddWithValue("@nome", nome_companhia.Text);

                comando.ExecuteNonQuery();

                Session["editar_companhia"] = "true";
                Response.Redirect("admin_companhia.aspx", false);
            }


            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_editar()", true);
              

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

            comando.CommandText = "Select  id_companhia, nome from companhia where " +
                "(id_companhia = @id_companhia)";
            comando.Parameters.AddWithValue("@id_companhia", codigo);


            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id.Text = Convert.ToString(DR["id_companhia"]);
                nome_companhia.Text = Convert.ToString(DR["nome"]);


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

            comando.CommandText = "Delete from companhia where " +
                "(id_companhia = @id_companhia)";
            comando.Parameters.AddWithValue("@id_companhia", id.Text);


            if (id.Text != "")
            {


                try
                {
                    comando.ExecuteReader();
                }

                catch
                {
                    validar = false;
                    MessageBox.Show("Verifique se esta respetiva companhia nao esta associada a nenhum voo", "Erro");
                    Response.Redirect("admin_companhia.aspx", false);
                }


                finally
                {
                    if(validar == true)
                    {
                        Session["apagar_companhia"] = "true";
                        Response.Redirect("admin_companhia.aspx", false);
                    
                    }
                }

            }



            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_eliminar()", true);
                
            }


            
        }
    }
}