using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Windows.Forms;

namespace Godcompany
{
    public partial class Login : System.Web.UI.Page
    {

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Aceitar()", true);
        }

        void validar()
        {
            int max = 0;
            bool teste = false;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlCommand comando2 = new MySqlCommand();
            MySqlCommand comando3 = new MySqlCommand();
            MySqlCommand comando4 = new MySqlCommand();

            MySqlDataReader DR;
            MySqlDataReader DR1;

            ligar.Open();

            comando4.CommandText = "Select  email from login";

            comando4.Connection = ligar;

            DR1 = comando4.ExecuteReader();
            while (DR1.Read())
            {
                if (username_signup.Text == DR1["email"].ToString())
                {
                    teste = true;
                }
            }

            if (teste == false)
            {

                ligar.Close();

                ligar.Open();

                comando3.CommandText = "Select max(id_login) as max from login";

                comando3.Connection = ligar;

                DR = comando3.ExecuteReader();
                if (DR.Read())
                {
                    max = Convert.ToInt32(DR["max"]);
                }
                max++;

                ligar.Close();

                ligar.Open();
                comando.CommandText = "insert into cliente ( data_nascimento, mail, nome, password, id_tipo_cliente, id_login, c_cidadao) values ( @data_nascimento, @mail, @user, @pass, 2, @id_login, @c_cidadao)";
                comando2.CommandText = "insert into login (email, password) values ( @email, @pass)";

                comando.Connection = ligar;
                comando2.Connection = ligar;






                comando.Parameters.AddWithValue("@user", username_signup.Text);
                comando.Parameters.AddWithValue("@data_nascimento", idade_signup.Text);
                comando.Parameters.AddWithValue("@mail", mail_signup.Text);
                comando.Parameters.AddWithValue("@pass", password_signup.Text);
                comando.Parameters.AddWithValue("@c_cidadao", c_cidadao_signup.Text);
                comando.Parameters.AddWithValue("@id_login", max);
                comando2.Parameters.AddWithValue("@pass", password_signup.Text);
                comando2.Parameters.AddWithValue("@email", mail_signup.Text);



                DateTime date = DateTime.Now;

                string dia_nas = idade_signup.Text;

                DateTime data_nascen = Convert.ToDateTime(dia_nas);

                   if (data_nascen < date) {
                        try
                        {
                            comando2.ExecuteNonQuery();
                            comando.ExecuteNonQuery();
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);
                        }
                        catch (Exception erro)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error()", true);
                        }
                        ligar.Close();


                    }


                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_data()", true);
                    }
                }
                else
                {
                    ligar.Close();
                }
           
        }

        protected void signup_form_submit_Click(object sender, EventArgs e){


            bool validar2 = true;

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
      
            MySqlDataReader DR;

            comando.Connection = ligar;
     

            ligar.Open();

            comando.CommandText = "Select  mail from cliente";
               
     

            DR = comando.ExecuteReader();

        if (username_signup.Text != "" && confirmar_password.Text != "" && password_signup.Text != "" && c_cidadao_signup.Text != "" && mail_signup.Text != "" && idade_signup.Text != "" && termos_utilizaçao.Checked == true)
        {


            while (DR.Read())
            {
                if (DR["mail"].ToString() == mail_signup.Text)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_email()", true);
                    validar2 = false;
                }
                    
                
            }


            if (validar2 == true) {
             

               
                    if (password_signup.Text == confirmar_password.Text)
                        validar();

                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_password()", true);
                    }
               
            }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_campos()", true);
            }

        }

        protected void login_form_submit_Click(object sender, EventArgs e)
        {
            string user = "";
            int tipo = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlCommand comando2 = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;
            comando2.Connection = ligar;

            ligar.Open();

            comando.CommandText = "Select  mail, password, id_tipo_cliente, nome, id_cliente from cliente where " +
                "(mail = @email and password = @password)";
            comando.Parameters.AddWithValue("@email", username.Text);
            comando.Parameters.AddWithValue("@password", password.Text);
           
            DR = comando.ExecuteReader();

       

            if (DR.Read())
            {
                Session["nome_utilizador"] = DR["nome"];
                Session["cliente"] = DR["id_cliente"];
                user = Convert.ToString(DR["mail"]);
                tipo = Convert.ToInt32(DR["id_tipo_cliente"]);
                Session["email"] = Convert.ToString(DR["mail"]);
            }

            if (user != "" && tipo == 1)
            {
                Response.Redirect("admin.aspx", false);
            }

            else if (user != "" && tipo == 2)
            {
                Response.Redirect("cliente.aspx", false);
            }

            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error()", true);

            }
            ligar.Close();
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {

        }

      
    }
}
