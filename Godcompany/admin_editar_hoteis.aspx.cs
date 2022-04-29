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
    public partial class admin_editar_hoteis : System.Web.UI.Page
    {
        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["validar_correct_editar_hoteis"] == "true")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);
                Session["validar_correct_editar_hoteis"] = "false";
            }

            if (Session["validar_error_editar_hoteis"] == "true")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_editar()", true);
                Session["validar_error_editar_hoteis"] = "false";
            }


            if (Session["validar_error_apagar"] == "true")
            {
                Session["validar_error_apagar"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_tem_algo_ass()", true);
            }



            if (Session["validar_correct_apagar"] == "true")
            {
                Session["validar_correct_apagar"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_apagar()", true);
            }


            if(Session["validar_error_apagar_nao_escolheu"] == "true")
            {
                Session["validar_error_apagar_nao_escolheu"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_apagar()", true);
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






            if (id_hotel.Text != "" && nome.Text != "")
            {
                if (filename != "")
                {
                    FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                    comando.CommandText = "Update hoteis set nome_hotel = @nome, imagem = @imagem, id_pais = @id_pais, id_classificacao = @id_classificacao where " +
                        "(id_hoteis = @id_hoteis)";


                    comando.Parameters.AddWithValue("@id_hoteis", id_hotel.Text);
                    comando.Parameters.AddWithValue("@nome", nome.Text);
                    comando.Parameters.AddWithValue("@imagem", filename.ToString());
                    comando.Parameters.AddWithValue("@id_pais", DropDownList2.SelectedValue);
                    comando.Parameters.AddWithValue("@id_classificacao", DropDownList1.SelectedValue);
                    comando.ExecuteNonQuery();
                    Session["validar_correct_editar_hoteis"] = "true";
                    Response.Redirect("admin_editar_hoteis.aspx", false);
                }

                else
                {

                    comando.CommandText = "Update hoteis set nome_hotel = @nome, id_pais = @id_pais, id_classificacao = @id_classificacao where " +
                        "(id_hoteis = @id_hoteis)";


                    comando.Parameters.AddWithValue("@id_hoteis", id_hotel.Text);
                    comando.Parameters.AddWithValue("@nome", nome.Text);
                    comando.Parameters.AddWithValue("@id_pais", DropDownList2.SelectedValue);
                    comando.Parameters.AddWithValue("@id_classificacao", DropDownList1.SelectedValue);
                    comando.ExecuteNonQuery();
                    Session["validar_correct_editar_hoteis"] = "true";
                    Response.Redirect("admin_editar_hoteis.aspx", false);
                }
            }



            else
            {
                Session["validar_error_editar_hoteis"] = "true";
               
                Response.Redirect("admin_editar_hoteis.aspx", false);

            }
            ligar.Close();
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

            comando.CommandText = "Delete from hoteis where " +
                "(id_hoteis = @id_hoteis)";
            comando.Parameters.AddWithValue("@id_hoteis", id_hotel.Text);



           


            if (id_hotel.Text != "" && nome.Text != "")
            {

                try
                {
                    comando.ExecuteNonQuery();
                }

                catch
                {
                    validar = false;

                    Session["validar_error_apagar"] = "true";
                    Response.Redirect("admin_editar_hoteis.aspx", false);
                }

                finally
                {
                    if (validar == true)
                    {
                        Session["validar_correct_apagar"] = "true";
                        Response.Redirect("admin_editar_hoteis.aspx", false);
                    }
                }

            
            }


            else
            {
                Session["validar_error_apagar_nao_escolheu"] = "true";
                Response.Redirect("admin_editar_hoteis.aspx", false);
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

            comando.CommandText = "Select id_hoteis, nome_hotel, id_classificacao, id_pais from hoteis where " +
                "(id_hoteis = @id_hoteis)";
            comando.Parameters.AddWithValue("@id_hoteis", codigo);


            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_hotel.Text = Convert.ToString(DR["id_hoteis"]);
                nome.Text = Convert.ToString(DR["nome_hotel"]);
                DropDownList1.SelectedValue = Convert.ToString(DR["id_classificacao"]);
                DropDownList2.SelectedValue = Convert.ToString(DR["id_pais"]);


            }
        }
    }
}