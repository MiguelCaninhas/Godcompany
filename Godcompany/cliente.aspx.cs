using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.Media;

namespace Godcompany
{
    public partial class cliente : System.Web.UI.Page
    {

        string configuracao = "server=localhost; userid=root; database=bd_agencia_viagens";
        protected void Page_Load(object sender, EventArgs e)
        {

            Session["validar_carrinho_true"] = "false";



            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            MySqlDataReader DR;

            comando.Connection = ligar;


            ligar.Open();
            int numero_de_reservas = 0;
            comando.Parameters.Clear();

            comando.CommandText = "Select * from reservas";


            DR = comando.ExecuteReader();



            while (DR.Read())
            {
                numero_de_reservas++;

            }


            lbl_reservas.Text = Convert.ToString(numero_de_reservas);

            ligar.Close();


            ligar.Open();
            int numero_de_clientes = 0;
            comando.Parameters.Clear();

            comando.CommandText = "Select * from cliente where id_cliente != 8";


            DR = comando.ExecuteReader();



            while (DR.Read())
            {
                numero_de_clientes++;

            }


            lbl_clientes.Text = Convert.ToString(numero_de_clientes);

            ligar.Close();


            ligar.Open();
            int numero_de_hoteis = 0;
            comando.Parameters.Clear();

            comando.CommandText = "Select * from hoteis";


            DR = comando.ExecuteReader();



            while (DR.Read())
            {
                numero_de_hoteis++;

            }


            lbl_hoteis.Text = Convert.ToString(numero_de_hoteis);

            ligar.Close();


            ligar.Open();
            int numero_de_pack = 0;
            comando.Parameters.Clear();

            comando.CommandText = "Select * from viagens_pacotes where id_viagens_pacotes != 31 AND id_viagens_pacotes != 32";


            DR = comando.ExecuteReader();



            while (DR.Read())
            {
                numero_de_pack++;

            }


            lbl_packs.Text = Convert.ToString(numero_de_pack);

            ligar.Close();

        }
    }
}