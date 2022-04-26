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
    public partial class editar_login : System.Web.UI.Page
    {

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["validar_editar_conta"] = "false";

            mail_signup.Text = Session["email"].ToString();


            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();


            comando.CommandText = "Select nome , data_nascimento, c_cidadao, password from cliente where mail = '" + Session["email"].ToString() + "'";


            DR = comando.ExecuteReader();




            if (DR.Read())
            {

                username_signup.Text = DR["nome"].ToString();
                password_signup.Text = DR["password"].ToString();
                confirmar_password.Text = DR["password"].ToString();
                c_cidadao_signup.Text = DR["c_cidadao"].ToString();
                


            }




            if (Session["validar_correct_editar_conta"] == "true")
            {
                Session["validar_correct_editar_conta"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Correct()", true);
            }


            if (Session["validar_errar_editar_conta"] == "true")
            {
                Session["validar_errar_editar_conta"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Error_conta()", true);
            }


            if(Session["validar_errar_pass_editar_conta"] == "true")
            {

                Session["validar_errar_pass_editar_conta"] = "false";

                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error_pass()", true);


            }

        }

        protected void signup_form_submit_Click(object sender, EventArgs e)
        {
            bool validar = false;

            string user = "";
            int tipo = 0;

            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlCommand comando2 = new MySqlCommand();
            MySqlCommand comando3 = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;
            comando2.Connection = ligar;
            comando3.Connection = ligar;

            ligar.Open();

            
            if (username_signup.Text != "" && idade_signup.Text != "" && password_signup.Text != "" && c_cidadao_signup.Text != "" && confirmar_password.Text != "")
            {
                if(password_signup.Text == confirmar_password.Text) { 

                comando.CommandText = "Update cliente set data_nascimento = @data_nascimento, nome = @user, password = @pass, c_cidadao = @c_cidadao where " +
                    "(cliente.mail = @email)";
                comando2.CommandText = "Update login set  password = @pass where " +
                   "(email = @email)";
                comando3.CommandText = "Select  mail, id_tipo_cliente, nome from cliente where " +
                   "(mail = @email)";

                comando.Parameters.AddWithValue("@email", Session["email"].ToString());
                comando.Parameters.AddWithValue("@user", username_signup.Text);
                comando.Parameters.AddWithValue("@data_nascimento", idade_signup.Text);

                comando.Parameters.AddWithValue("@pass", password_signup.Text);
                comando.Parameters.AddWithValue("@c_cidadao", c_cidadao_signup.Text);
                comando2.Parameters.AddWithValue("@pass", password_signup.Text);
                comando2.Parameters.AddWithValue("@email", Session["email"].ToString());
                comando3.Parameters.AddWithValue("@email", Session["email"].ToString());

                try
                {
                    comando.ExecuteNonQuery();
                    comando2.ExecuteNonQuery();
                }

                catch
                {
                    validar = true;
                }

                finally
                {
                    if (validar != true)
                    {

                        Session["validar_correct_editar_conta"] = "true";
                            Response.Redirect("editar_login.aspx", false);

                        }

                   
                }


                DR = comando3.ExecuteReader();




                if (DR.Read())
                {
                    Session["nome_utilizador"] = DR["nome"];
                    user = Convert.ToString(DR["mail"]);
                    Session["tipo_cliente_editar_conta"] = Convert.ToString(DR["id_tipo_cliente"]);
                    Session["email"] = Convert.ToString(DR["mail"]);
                }




               




                }

                else
                {

                    Session["validar_errar_pass_editar_conta"] = "true";
                    Response.Redirect("editar_login.aspx", false);
                }
            }

            else
            {
                Session["validar_errar_editar_conta"] = "true";
                Response.Redirect("editar_login.aspx", false);

            }



            Session["validar_editar_conta"] = "true";




            ligar.Close();
        }

        protected void voltar_Click(object sender, EventArgs e)
        {



            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;

            ligar.Open();


            comando.CommandText = "Select id_tipo_cliente from cliente where mail = '" + Session["email"].ToString() + "'";


            DR = comando.ExecuteReader();

            int tipo_cliente = 0;


            if (DR.Read())
            {

                tipo_cliente = Convert.ToInt32(DR["id_tipo_cliente"]);


            }





            if (Session["validar_editar_conta"].ToString() == "true")
            {
                Session["validar_editar_conta"] = "false";
                if (Session["tipo_cliente_editar_conta"].ToString() == "2")
                {
                    Response.Redirect("cliente.aspx", false);

                }

                if (Session["tipo_cliente_editar_conta"].ToString() == "1")
                {
                    Response.Redirect("admin_gerir.aspx", false);
                }

                
            }

            if (tipo_cliente == 2)
            {
                Response.Redirect("cliente.aspx", false);

            }

            if (tipo_cliente == 1)
            {
                Response.Redirect("admin_gerir.aspx", false);
            }

        }
    }
}