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
    public partial class admin_hoteis : System.Web.UI.Page
    {

        int linha;
        string codigo;
        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void editar_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();

            MySqlDataReader DR;



            if (id_pais.Text != "") {

                if (nome_hotel.Text != "" && DropDownList1.SelectedValue != "") {

                    if (FileUpload1.FileName != "")
                    {

                        ligar.Open();
                        comando.CommandText = "insert into hoteis(nome_hotel, id_classificacao, id_pais, imagem) values (@nome, @id_classificaçao, @id_pais, @imagem )";
                        string filename = Path.GetFileName(FileUpload1.FileName);
                        FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                        comando.Connection = ligar;


                        comando.Parameters.AddWithValue("@nome", nome_hotel.Text);
                        comando.Parameters.AddWithValue("@imagem", filename);
                        comando.Parameters.AddWithValue("@id_classificaçao", DropDownList1.SelectedValue);
                        comando.Parameters.AddWithValue("@id_pais", id_pais.Text);


                        try
                        {

                            comando.ExecuteNonQuery();
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);
                        }
                        catch (Exception erro)
                        {
                            MessageBox.Show(erro.Message, "Erro");
                        }
                        ligar.Close();
                    }

                    else
                    {
                       ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_foto()", true);
                    }
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos()", true);
                }
            }
        

               
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", " Error_criar()", true);
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

            comando.CommandText = "Select  id_pais from pais where " +
                "(id_pais = @id_pais)";
            comando.Parameters.AddWithValue("@id_pais", codigo);


            DR = comando.ExecuteReader();



            if (DR.Read())
            {
                id_pais.Text = Convert.ToString(DR["id_pais"]);

            }

        }
    }
}