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
    public partial class admin_adicionar_quartos : System.Web.UI.Page
    {

        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["foto_error_quartos"] == "true")
            {
                Session["foto_error_quartos"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_foto()", true);
            }

            if (Session["correct_quartos"] == "true")
            {
                Session["correct_quartos"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);

            }

            if (Session["Error_campos_quartos"] == "true")
            {
                Session["Error_campos_quartos"] = "false";
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos()", true);

            }

            if (Session["Error_nao_escolheu_quartos"] == "true")
            {
                Session["Error_nao_escolheu_quartos"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error_nao_escolher()", true);
            }
        }

      

        protected void Editar_Click(object sender, EventArgs e)
        {

            int numero_adicionar, validar = 0;
            numero_adicionar = Convert.ToInt32(DropDownList1.SelectedValue);
            
            for(int x = 1; x <= numero_adicionar; x++) {
                

                MySqlConnection ligar = new MySqlConnection(configuracao);
                MySqlCommand comando = new MySqlCommand();
                MySqlDataReader DR;

                comando.Connection = ligar;

                ligar.Open();


                string filename = Path.GetFileName(FileUpload1.FileName);






                if (id_hoteis.Text != "")
                {
                    if(preco.Text != "" && DropDownList2.SelectedValue != "") { 
                    if (filename != "")
                    {
                        FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                        comando.CommandText = "insert into quartos(id_hoteis, preco, id_tipo_quarto, imagem ) values(@id_hoteis, @preco, @id_tipo_quarto, @imagem)";
                            


                        comando.Parameters.AddWithValue("@id_hoteis", id_hoteis.Text);
                        comando.Parameters.AddWithValue("@preco", preco.Text);
                        comando.Parameters.AddWithValue("@id_tipo_quarto", DropDownList2.SelectedValue);
                        comando.Parameters.AddWithValue("@imagem", filename.ToString());
                        comando.ExecuteNonQuery();
                   

                        validar = 1;
                    }

                    else
                    {
                       
                        Session["foto_error_quartos"] = "true";
                        Response.Redirect("admin_adicionar_quartos.aspx", false);

                    }
                   }


                    else
                    {
                        Session["Error_campos_quartos"] = "true";
                        Response.Redirect("admin_adicionar_quartos.aspx", false);

                    }

                }


                else
                {
                    Session["Error_nao_escolheu_quartos"] = "true";
                    Response.Redirect("admin_adicionar_quartos.aspx", false);
                }
           
                ligar.Close();


            }


           
            



            if (validar == 1)
            {
                Session["correct_quartos"] = "true";
                Response.Redirect("admin_adicionar_quartos.aspx", false);

            }

         






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

            comando.CommandText = "Select  id_hoteis from hoteis where " +
                "(id_hoteis = @id_hoteis)";
            comando.Parameters.AddWithValue("@id_hoteis", codigo);


            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_hoteis.Text = Convert.ToString(DR["id_hoteis"]);
                


            }

        }
    }
}