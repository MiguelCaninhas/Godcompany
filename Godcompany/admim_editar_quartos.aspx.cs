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
    public partial class admim_editar_quartos : System.Web.UI.Page
    {


        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Correct_editar_quartos"] == "true")
            {
                Session["Correct_editar_quartos"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_editar()", true);
            }

            if(Session["Error_nao_escolheu_editar_quartos"] == "true")
            {
                Session["Error_nao_escolheu_editar_quartos"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_editar()", true);
            }

           if (Session["Error_algo_associado"] == "true")
            {
                Session["Error_algo_associado"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_existe_algo_associado()", true);
            }

           if(Session["Correct_apagar_quartos"] == "true")
            {
                Session["Correct_apagar_quartos"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct_apagar() ", true);
            }
           
           if (Session["Error_nao_escolheu_apagar_quartos"] == "true")
            {
                Session["Error_nao_escolheu_apagar_quartos"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error_nao_escolher_apagar()", true);
            }
           
        }

        protected void Editar_Click(object sender, EventArgs e)
        {


            
            


                MySqlConnection ligar = new MySqlConnection(configuracao);
                MySqlCommand comando = new MySqlCommand();
                MySqlDataReader DR;

                comando.Connection = ligar;

                ligar.Open();


                string filename = Path.GetFileName(FileUpload1.FileName);






            if (id_quarto.Text != "") {

                if (filename != "")
                {
                    FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                    comando.CommandText = "Update quartos set id_hoteis = @id_hoteis, preco = @preco, id_tipo_quarto = @id_tipo_quarto, imagem = @imagem where" +
                        "(id_quartos = @id_quartos)";


                    comando.Parameters.AddWithValue("@id_quartos", id_quarto.Text);
                    comando.Parameters.AddWithValue("@id_hoteis", DropDownList1.SelectedValue);
                    comando.Parameters.AddWithValue("@preco", preco.Text);
                    comando.Parameters.AddWithValue("@id_tipo_quarto", DropDownList2.SelectedValue);
                    comando.Parameters.AddWithValue("@imagem", filename.ToString());
                    comando.ExecuteNonQuery();

                    Session["Correct_editar_quartos"] = "true";
                    Response.Redirect("admim_editar_quartos.aspx", false);

                }

                else
                {

                    comando.CommandText = "Update quartos set id_hoteis = @id_hoteis, preco = @preco, id_tipo_quarto = @id_tipo_quarto where" +
                   "(id_quartos = @id_quartos)";


                    comando.Parameters.AddWithValue("@id_quartos", id_quarto.Text);
                    comando.Parameters.AddWithValue("@id_hoteis", DropDownList1.SelectedValue);
                    comando.Parameters.AddWithValue("@preco", preco.Text);
                    comando.Parameters.AddWithValue("@id_tipo_quarto", DropDownList2.SelectedValue);

                    comando.ExecuteNonQuery();
                    Session["Correct_editar_quartos"] = "true";
                    Response.Redirect("admim_editar_quartos.aspx", false);

                }

            }


            else
            {
                Session["Error_nao_escolheu_editar_quartos"] = "true";
                Response.Redirect("admim_editar_quartos.aspx", false);
            }

                ligar.Close();


            
        }

            protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
            {

                SqlDataSource1.SelectCommand = "SELECT quartos.preco, quartos.imagem, tipo_quarto.nome, quartos.id_quartos, hoteis.nome_hotel FROM quartos INNER JOIN tipo_quarto ON quartos.id_tipo_quarto = tipo_quarto.id_tipo_quarto INNER JOIN hoteis ON quartos.id_hoteis = hoteis.id_hoteis where quartos.id_hoteis = " + DropDownList3.SelectedValue;
            }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            linha = GridView1.SelectedIndex;
            codigo = GridView1.Rows[linha].Cells[4].Text;


            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();

            comando.CommandText = "Select  id_quartos, preco, id_hoteis, id_tipo_quarto from quartos where " +
                "(id_quartos = @id_quartos)";
            comando.Parameters.AddWithValue("@id_quartos", codigo);


            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_quarto.Text = Convert.ToString(DR["id_quartos"]);
                preco.Text = Convert.ToString(DR["preco"]);
                DropDownList1.SelectedValue = Convert.ToString(DR["id_hoteis"]);
                DropDownList2.SelectedValue = Convert.ToString(DR["id_tipo_quarto"]);
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

            comando.CommandText = "Delete from quartos where " +
                "(id_quartos = @id_quartos)";
            comando.Parameters.AddWithValue("@id_quartos", id_quarto.Text);



            if (id_quarto.Text != "")
            {


                try
                {
                    comando.ExecuteReader();
                }



                catch
                {
                    validar = false;
                    Session["Error_algo_associado"] = "true";
                    Response.Redirect("admim_editar_quartos.aspx", false);

                }

                finally
                {
                    if (validar == true)
                    {
                        Session["Correct_apagar_quartos"] = "true";
                        Response.Redirect("admim_editar_quartos.aspx", false);
                    }
                }

            }

            else
            {
                Session["Error_nao_escolheu_apagar_quartos"] = "true";
                Response.Redirect("admim_editar_quartos.aspx", false);
            }
        }
    }
}