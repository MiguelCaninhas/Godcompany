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
    public partial class admin_adicionar_paises : System.Web.UI.Page
    {

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signup_form_submit_Click(object sender, EventArgs e)
        {


            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
    
            MySqlDataReader DR;





            if (FileUpload1.FileName != "" && nome_pais_signup.Text != "")
            {


                ligar.Open();
                comando.CommandText = "insert into pais(nome, imagem) values (@user, @imagem )";
                string filename = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("images/") + filename);

                comando.Connection = ligar;


                comando.Parameters.AddWithValue("@user", nome_pais_signup.Text);
                comando.Parameters.AddWithValue("@imagem", filename);


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
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error()", true);
            }


        }
    }
}